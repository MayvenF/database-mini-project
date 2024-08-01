--Queries for View 1

--select the reservation where the adult’s email matches a certain email
SELECT * FROM adult_reservations_view WHERE email LIKE '%"@example.net"%';

--insert new reservation
INSERT INTO reservation (reservationid, loandate, returndate, librarycard, bookid) VALUES (555555, '2024-01-15', '2024-02-15', 123456, 789);
--INSERT 0 1
--Query returned successfully in 101 msec.

--update return date of reservation based on reservationID
UPDATE reservation SET returndate = '2024-02-20' WHERE reservationid = 11;
--UPDATE 1
--Query returned successfully in 80 msec.

--and some more:

--select reservations from a specific time period
SELECT readerid, adult_name, email, cellphone, occupation, bookid, title, genre, condition, reservationid, loandate, returndate
FROM adult_reservations_view
WHERE loandate BETWEEN '2023-01-01' AND '2023-12-31';

--select reservations of a certain reader based on ID
SELECT readerid, adult_name, email, cellphone, occupation, bookid, title, genre, condition, reservationid, loandate, returndate
FROM adult_reservations_view
WHERE readerid = 123456;

--Queries for View 2

SELECT * FROM book_author_view WHERE rating > 4;
--Query complete 00:00:01.504

INSERT INTO book (bookid, title, genre, condition)
VALUES (423456, 'New Book Title', 'Fiction', 'New');
INSERT INTO writtenby (bookid, authorid)
VALUES (423456, (SELECT authorid FROM author WHERE authorname = 'William Lee'));
--INSERT 0 1
--Query returned successfully in 111 msec.

SELECT bookid, title, genre, condition, authorname, 
rating FROM book_author_view WHERE genre= 'Mystery'
AND condition='Bad' AND rating >= 7;
--Query complete 00:00:00.778

UPDATE author
SET authorname= ‘Mediocre Author’
WHERE rating= 5;
--UPDATE 77
--Query returned successfully in 96 msec.

