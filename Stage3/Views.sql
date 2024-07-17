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

-----------------------------------------------------------------

 --Implementing INSERT, UPDATE, DELETE Statements for Each View

-- INSERT into books_authors_publishers (view 1)
INSERT INTO book (bookid, title, genre, condition) VALUES (201, 'New Book', 'Fiction', 'New'); 
INSERT INTO writtenBy (bookid, authorid) VALUES (201, 1);

--Query returned successfully in 117 msec.


-- UPDATE books_authors_publishers
UPDATE book SET title = 'Updated Book' WHERE bookid = 201;
--Query returned successfully in 107 msec.

-- DELETE from books_authors_publishers
DELETE FROM book WHERE bookid = 201;

-- INSERT into reservations_books_readers (view 2)
INSERT INTO reservation (reservationid, bookid, librarycard, loandate, returndate) VALUES (-1, 99, 1, '2024-08-01', '2024-08-15');

--ERROR:  Key (librarycard)=(1) is not present in table "reader".insert or update on table "reservation" violates foreign key constraint "reservation_librarycard_fkey" 

-- DELETE from reservations_books_readers
DELETE FROM reservation WHERE reservationid = 301;

--Query returned successfully in 149 msec.


-- INSERT into books_on_shelves (view 3)

INSERT INTO location (bookid, shelf_id) VALUES (99, 24);
--ERROR:  Key (bookid)=(99) already exists.duplicate key value violates unique constraint "unique_book_id" 

-- UPDATE books_on_shelves
UPDATE location SET shelfid = 35 WHERE bookid = 1;
--Query returned successfully in 105 msec.

-- DELETE from readers_reservation_count
DELETE FROM reader WHERE librarycard = 3;
--Query returned successfully in 90 msec.

