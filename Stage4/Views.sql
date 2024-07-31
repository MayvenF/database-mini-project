-- View 1: show adults and their reserved books
CREATE OR REPLACE VIEW adult_reservations_view AS
SELECT
  a.email,
  a.cellphone,
  a.occupation,
  a.readerID,
  a.FamilyID,
  b.bookid,
  b.title,
  b.genre,
  b.condition,
  res.reservationid,
  res.loandate,
  res.returndate
FROM
dblink('dbname=Reader user=postgres password=120601',
         'SELECT email, cellphone, occupation, readerID, familyID FROM Adult')
  AS a(email VARCHAR(255), cellphone VARCHAR(255), occupation VARCHAR(255), readerID INT, familyID INT)
--ON a.readerid = res.librarycard
JOIN
	dblink('dbname=Reader user=postgres password=120601',
         'SELECT reservationid, loandate, returndate, librarycard, bookid FROM reservation')
  AS res(reservationid INT, loandate DATE, returndate DATE, librarycard INT, bookid INT)
ON a.readerid = res.librarycard
JOIN
  dblink('dbname=Reader user=postgres password=120601',
         'SELECT bookid, title, genre, condition FROM book')
  AS b(bookid INT, title VARCHAR(255), genre VARCHAR(255), condition VARCHAR(255))
ON res.bookid = b.bookid;

-- View 2: shows books and their info, as well as their authors and author’s info
CREATE OR REPLACE VIEW book_author_view AS
SELECT
  b.bookid,
  b.title,
  b.genre,
  b.condition,
  a.authorid,
  a.authorname,
  a.rating
FROM
  dblink('dbname=Book_Database user=postgres password=120601', 
         'SELECT bookid, title, genre, condition FROM book') 
  AS b(bookid INT, title TEXT, genre TEXT, condition TEXT)
JOIN
  dblink('dbname=Book_Database user=postgres password=120601', 
         'SELECT bookid, authorid FROM writtenby') 
  AS wb(bookid INT, authorid INT)
ON b.bookid = wb.bookid
JOIN
  dblink('dbname=Book_Database user=postgres password=120601', 
         'SELECT authorid, authorname, rating FROM author') 
  AS a(authorid INT, authorname TEXT, rating INT)
ON wb.authorid = a.authorid;

