# database-mini-project-3058-6034
Below is a picture of the ERD
![image (2)](https://github.com/MayvenF/database-mini-project-3058-6034/assets/117817449/640cb3b8-ee99-4f28-898a-7b52e8997731)

Below is a picture of the DSD
<!-- ![image (3)](https://github.com/MayvenF/database-mini-project-3058-6034/assets/117817449/0d49c3ad-72bc-40d2-aded-e69c3a7a559c) -->
![ERD_Image](https://github.com/MayvenF/database-mini-project-3058-6034/assets/117817449/0274f4ad-62dc-4715-a601-9e68c1fa5b6d)

Below is an example of how we generated data
![image](https://github.com/MayvenF/database-mini-project-3058-6034/assets/117817449/c584746b-c86f-427d-bf61-913770dd5302)

SQL Schema:
**DBSQLSchema.sql**

SQL Data Generation:
* author.sql (approximately 1000 rows)
* book.sql (approximately 200,000 rows)
* location.sql (approximately 200,000 rows)
* publishedby.sql (approximately 200,000 rows)
* publisher.sql (approximately 500 rows)
* reader.sql (approximately 500 rows)
* reservation.sql (approximately 500 rows)
* shelf.sql (approximately 5000 rows)
* suppliedby.sql (approximately 200,000 rows)
* supplier.sql (approximately 500 rows)
* writtenby.sql (approximately 200,000 rows)


Stage 2:

We made 8 basic sql queries comprising 4 select queries, 2 update queries and 2 delete queries. 
With our select queries a user can:
* find out how many reserved books are in good condition
* find out the most common publisher of each genre of book
* discover the average capacity of a shelf in the library
* find the most prolific author in each rating

With our update queries a user can:
* update every book from bad condition to good
* extend all book loans due today for two weeks 

With our delete queries a user can:
* delete overdue books
* delete bad authors (rating less than 3)

Below are screenshots executing two of the queries in the GUI
![Screenshot 2024-07-05 150523](https://github.com/MayvenF/database-mini-project-3058-6034/assets/117817449/76fe6a62-1643-4307-82e4-518a9c9e420c)

![Screenshot 2024-07-05 163143](https://github.com/MayvenF/database-mini-project-3058-6034/assets/117817449/9efb099b-d1f8-4242-8c30-b384c73f3ccd)


We made 4 parameterized queries that can:| 1      | 301   | 283   |
* find the top x most borrowed books
* extend a book loan for a user indefinitely
* find the top x readers (who borrowed the most books)
* list all books due in the next x days

Below are screenshots when we prepared and ran a query in the GUI
![Screenshot 2024-07-05 150601](https://github.com/MayvenF/database-mini-project-3058-6034/assets/117817449/1daa72ee-e72f-4afd-86a2-11ddc48d4eda)

![Screenshot 2024-07-05 150626](https://github.com/MayvenF/database-mini-project-3058-6034/assets/117817449/4cabaa03-1eb2-467c-b4b4-d2485a5757ea)



We then made indices on the tables reservation, book and reader, which sped up the queries significantly when we re-ran them
Finally we added constraints to supplier id, the linearity of loan dates and return dates, valid foreign keys in the reservation table, and book location

Below is a screenshot from this stage
![Screenshot 2024-07-05 164527](https://github.com/MayvenF/database-mini-project-3058-6034/assets/117817449/52c9ed8c-99e1-41e3-9f34-b33318ca6084)

We logged the timings of all our queries as comments in the sql files. 
The error messages are logged in this file: [ConstraintsLog](BackupsAndLogs/ConstraintsLog.txt)

Here are the timing comparisons (in msec) before and after the indices were run:
| Timing | Before  | After  |
| :-----: | :---: | :---: |
| 1      | 219   | 111   |
| 2      | 1336   | 123   |
| 3      | 349   | 165   |
| 4      | 260   | 138   |

-----------------------------
**STAGE 3**
-----------------------------
3 Queries that utilize a 2 or 3 table join. Can also be found in [Queries.sql](https://github.com/MayvenF/database-mini-project-3058-6034/blob/main/Stage3/Queries.sql)

1)
This query retrieves all books along with their corresponding authors and publishers.
 It joins the book, writtenBy, author, publishedBy, publisher tables.

```
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
```
Time to execute: 1 second 202 msec


2)

This query retrieves all reservations along with the names of the readers who made the reservations and the titles of the books reserved.
It joins the reservation, reader, and book tables.
```
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
```
Time to execute: 246 msec

3)
This query updates the due date for all books reserved by a specific reader, identified by their readername.
 It joins the reservation table with the reader and book tables to ensure the correct books are updated.
```
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
```
Time to execute: 114 msec

Views and Queries:

Views can be found in [Views.sql](https://github.com/MayvenF/database-mini-project-3058-6034/blob/main/Stage3/Views.sql)

Select Queries for each view:

-- Select query for View 1
```
SELECT * FROM books_authors_publishers;
```
Time: 1 sec 128 msec


-- Select query for View 2
```
SELECT * FROM reservations_books_readers;
```
Time: 324 msec


-- Select query for View 3
```
SELECT * FROM books_on_shelves;
```
Time: 590 msec

-- Select query for View 4
```
SELECT * FROM readers_reservation_count;
```
Time:152 msec

Sample of select output:
[views.pdf](https://github.com/user-attachments/files/16272815/views.pdf)

Regarding the UPDATE, SELECT, DELETE for the views, see [Views.sql](https://github.com/MayvenF/database-mini-project-3058-6034/blob/main/Stage3/Views.sql)

--------------------------------------------------------------
Visualizations
-------------------------------------------------------------
The first graph depicts all of the readers (by reader name) and how many reservations they have. The height of the bars on the var graph reperesent the number of visualizations.
The second graph (the pie chart) depicts the number of books per genre. Each slice of the pie represents a genre.

[visualization.pdf](https://github.com/user-attachments/files/16272874/visualization.pdf)

--------------------------------------------------------------
Functions
-------------------------------------------------------------

1. get_books_with_authors()
Description: This function retrieves all books with their associated authors.

Returns: A table with the following columns: bookid (INT), title (VARCHAR), genre (VARCHAR), condition (VARCHAR), author_name (VARCHAR)

2. get_reservations_books_readers()
Description: This function retrieves all reservations along with the corresponding book titles and reader names.
Returns: A table with the following columns:reservationid (INT), book_title (VARCHAR), reader_name (VARCHAR), due_date (DATE), returndate (DATE)

3. get_books_on_shelves()
Description: This function retrieves all books along with their shelf locations.
Returns: A table with the following columns: bookid (INT), title (VARCHAR),  genre (VARCHAR), condition (VARCHAR), shelf_id (VARCHAR), location (VARCHAR)

4. get_readers_reservation_count()
Description: This function retrieves all readers along with their total number of reservations.
Returns: A table with the following columns: librarycard (INT), readername (VARCHAR), total_reservations (BIGINT)

Usage
These functions are designed to be used in place of complex queries for ease of use and improved readability. See the [Queries.sql](https://github.com/MayvenF/database-mini-project-3058-6034/blob/main/Stage3/Queries.sql) file for examples of their usage.


--------------------------------------------------------------
Stage 4 - Merging our Book Database with a Reader Database
-------------------------------------------------------------

Our old ERD:
![image (2)](https://github.com/MayvenF/database-mini-project-3058-6034/assets/117817449/640cb3b8-ee99-4f28-898a-7b52e8997731)

Their ERD:
![image](https://github.com/user-attachments/assets/d5420287-f280-4796-8704-e946f11d1a05)

The merged ERD:
![image (6)](https://github.com/user-attachments/assets/00f5cee6-af9f-4a8e-96b4-29564825821d)


The notable changes in the merged ERD is the deletion of our Author and WrittenBy entities/relationships and the deletion of our reservation relation. In the foreign database, they included author and title as attributes of book, while we had them in separate tables. Since presumably their data was accurate, we felt comfortable deleting our extra tables in favor of theirs. Additionally, their Loan table was exactly the same as our Reservation table, with the only difference being the column names, so we opted to alias theirs instead of ours. Their book database had different columns then ours, but presumably had the same books since our databases refer to the same library, so we merged those together based on book id.

The updated merged DSD:
![image](https://github.com/user-attachments/assets/06746243-0499-474a-bc85-9ef6d1cb6f94)

The SQL Create Table script can be found in this file: [DSDMergeSQLScript](Stage4/DSDMergeSQLScript.sql)


