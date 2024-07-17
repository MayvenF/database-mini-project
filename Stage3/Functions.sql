--FUNCTION 1

CREATE OR REPLACE FUNCTION get_books_with_authors()
RETURNS TABLE (
    bookid INT,
    title TEXT,
    genre TEXT,
    condition TEXT,
    author_name TEXT
) AS $$
BEGIN
    RETURN QUERY
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
END;
$$ LANGUAGE plpgsql;

--FUNCTION 2

CREATE OR REPLACE FUNCTION get_reservations_books_readers()
RETURNS TABLE (
    reservationid INT,
    book_title TEXT,
    reader_name TEXT,
    due_date DATE,
    returndate DATE
) AS $$
BEGIN
    RETURN QUERY
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
END;
$$ LANGUAGE plpgsql;


--FUNCTION 3

CREATE OR REPLACE FUNCTION get_books_on_shelves()
RETURNS TABLE (
    bookid INT,
    title TEXT,
    genre TEXT,
    condition TEXT,
    shelf_id TEXT,
    location TEXT
) AS $$
BEGIN
    RETURN QUERY
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
END;
$$ LANGUAGE plpgsql;

---FUNCTION 4

CREATE OR REPLACE FUNCTION get_readers_reservation_count()
RETURNS TABLE (
    librarycard INT,
    readername TEXT,
    total_reservations INT
) AS $$
BEGIN
    RETURN QUERY
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
END;
$$ LANGUAGE plpgsql;
