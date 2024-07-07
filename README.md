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

Here are the timing comparisons before and after the indices were run:
| Timing | Before  | After  |
| :-----: | :---: | :---: |
| 1      | 219   | 111   |
| 2      | 1336   | 123   |
| 3      | 349   | 165   |
| 4      | 260   | 138   |

