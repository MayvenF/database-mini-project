--This query retrieves all books along with their corresponding authors and publishers.
--It joins the book, writtenBy, author, publishedBy, publisher tables.

SELECT 
    book.title AS book_title,
    author.name AS author_name,
    publisher.name AS publisher_name
FROM 
    book
JOIN 
    writtenBy ON book.bookid = writtenBy.bookid
JOIN 
    author ON writtenBy.authorid = author.authorid
JOIN 
    publishedBy ON book.bookid = publishedBy.bookid
JOIN 
    publisher ON publishedBy.publisherid = publisher.publisherid;
--Time: 1 second 202 msec


--This query retrieves all reservations along with the names of the readers who made the reservations and the titles of the books reserved.
  --It joins the reservation, reader, and book tables.

SELECT 
    reader.readername AS reader_name,
    book.title AS book_title,
    reservation.due_date AS due_date
FROM 
    reservation
JOIN 
    reader ON reservation.librarycard = reader.librarycard
JOIN 
    book ON reservation.bookid = book.bookid;
--Time: 246 msec


--This query updates the due date for all books reserved by a specific reader, identified by their readername. 
--It joins the reservation table with the reader and book tables to ensure the correct books are updated.

UPDATE 
    reservation
SET 
    returndate = '2025-12-31'  -- Replace with the new due date
FROM 
    reader
JOIN 
    reservation AS r ON r.librarycard = reader.librarycard
JOIN 
    book ON r.bookid = book.bookid
WHERE 
    reservation.reservationid = r.reservationid
    AND reader.readername = 'Lorraine Williams';  -- Replace with the specific reader's name

--Time: 114 msec

----------------------------------------
--New queries after adding functions:
----------------------------------------
-- Select query for View 1
SELECT * FROM get_books_with_authors();

-- Select query for View 2
SELECT * FROM get_reservations_books_readers();

-- Select query for View 3
SELECT * FROM get_books_on_shelves();

-- Select query for View 4
SELECT * FROM get_readers_reservation_count();

-- Count the number of books per genre using books_with_authors view
SELECT genre, COUNT(bookid) AS number_of_books
FROM get_books_with_authors()
GROUP BY genre;

--time to execute all 5 queries: 473 msec
