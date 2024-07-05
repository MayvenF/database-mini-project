-- Find the top x most borrowed books in the library.

PREPARE find_top_books AS 
SELECT book.title, COUNT(reservation.bookid) AS borrow_count
FROM reservation
JOIN book ON reservation.bookid = book.bookid
GROUP BY book.title
ORDER BY borrow_count DESC 
LIMIT $1;

-- Time: 360 msec

EXECUTE find_top_books (6)

-- Time: 349 msec





-- Update return date to make a specific user x weeks later

PREPARE update_user_returndate (int, text) AS
UPDATE reservation rs
SET returndate = rs.returndate + INTERVAL '$1 DAY'
FROM reader rd
WHERE rs.librarycard = rd.librarycard
  AND rd.readername = $2

-- Time: 127 msec

EXECUTE update_user_returndate (3, 'Stephanie Suarez')

-- Time: 260 msec





-- Identify the top x readers who have borrowed the most books in the past year.

PREPARE top_readers (int) AS
SELECT reader.readername, COUNT(reservation.bookid) AS total_borrowed 
FROM reservation 
JOIN reader ON reservation.librarycard = reader.librarycard 
WHERE reservation.returndate > NOW() - INTERVAL '1 YEAR'
GROUP BY reader.readername 
ORDER BY total_borrowed DESC 
LIMIT $1;

-- Time:  139 msec

EXECUTE top_readers (5)

-- Time: 219 msec




-- List all books that are due for return within the next x days.

PREPARE list_due_books (int) AS 
SELECT book.title, reservation.returndate 
FROM reservation 
JOIN book ON reservation.bookid = book.bookid 
WHERE reservation.returndate BETWEEN NOW() AND NOW() + ($1 || ' days')::interval;

-- Time: 734 msec

EXECUTE list_due_books (7)

-- Time: 1 sec 336 msec
