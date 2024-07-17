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
------------------------------------------
