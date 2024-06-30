-- How many reserved books are in good condition?

SELECT count(*)
FROM book b
JOIN reservation as r on b.bookid = r.bookid
WHERE b.condition = 'Good'

-- Time: 174 msec



-- Most common publisher of each genre of book?

SELECT b.genre, p.publishername, COUNT(*) AS book_count
FROM book b
JOIN publishedby pb ON b.bookid = pb.bookid
JOIN publisher p ON pb.publisherid = p.publisherid
GROUP BY b.genre, p.publishername
HAVING COUNT(*) = (
    SELECT MAX(book_count)
    FROM (
        SELECT b.genre, COUNT(*) AS book_count
        FROM book b
        JOIN publishedby pb ON b.bookid = pb.bookid
        JOIN publisher p ON pb.publisherid = p.publisherid
        GROUP BY b.genre, p.publishername
    ) AS inner_counts
    WHERE inner_counts.genre = b.genre
)
ORDER BY b.genre;

-- Time: 10 min 25 sec 383 msec



-- Average capacity of a shelf in the library?

SELECT avg(capacity)
FROM shelf s

-- Time: 65 msec



-- Find the authors with the most books published in every rating?

SELECT rating, authorname, numbookswritten
FROM author a1
WHERE numbookswritten = (
    SELECT MAX(numbookswritten)
    FROM author a2
    WHERE a1.rating = a2.rating
)
AND authorname = (
    SELECT authorname
    FROM author a3
    WHERE a1.rating = a3.rating
    ORDER BY numbookswritten DESC, authorname ASC
    LIMIT 1
)
ORDER BY rating;

-- Time: 485 msec



-- Update every Mystery book in bad condition to good


UPDATE book 
SET condition = 'Good' 
WHERE genre = 'Mystery' AND condition = 'Bad';

-- Time: 339 msec



-- Update return date to make a specific user 2 weeks later?

UPDATE reservation rs
SET returndate = rs.returndate + INTERVAL '14 DAY'
FROM reader rd
WHERE rs.librarycard = rd.librarycard
  AND rd.readername = <insert name here>

-- Time: 100 msec



-- Delete reservations whose loan return date passed

DELETE FROM reservation
WHERE returndate < CURRENT_DATE;

-- Time: 51 msec



-- Delete authors with rating less than 3

DELETE
FROM author
WHERE rating < 3

-- Time: 97 msec

