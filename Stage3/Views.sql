-- View 1: View all books with their authors
CREATE VIEW books_with_authors AS
SELECT 
    book.bookid,
    book.title,
    book.genre,
    book.condition,
    author.name AS author_name
FROM 
    book
JOIN 
    writtenBy ON book.bookid = writtenBy.bookid
JOIN 
    author ON writtenBy.authorid = author.authorid;

-- View 2: View all reservations with book titles and reader names
CREATE VIEW reservations_books_readers AS
SELECT 
    reservation.reservationid,
    book.title AS book_title,
    reader.readername AS reader_name,
    reservation.due_date,
    reservation.returndate
FROM 
    reservation
JOIN 
    book ON reservation.bookid = book.bookid
JOIN 
    reader ON reservation.librarycard = reader.librarycard;

-- View 3: View all books on shelves
CREATE VIEW books_on_shelves AS
SELECT 
    book.bookid,
    book.title,
    book.genre,
    book.condition,
    shelf.shelf_id,
    shelf.location
FROM 
    book
JOIN 
    location ON book.bookid = location.bookid
JOIN 
    shelf ON location.shelf_id = shelf.shelf_id;

-- View 4: View all readers and their total number of reservations
CREATE VIEW readers_reservation_count AS
SELECT 
    reader.librarycard,
    reader.readername,
    COUNT(reservation.reservationid) AS total_reservations
FROM 
    reader
LEFT JOIN 
    reservation ON reader.librarycard = reservation.librarycard
GROUP BY 
    reader.librarycard, reader.readername;

--Time for all 4 queries run together: 90 msec
