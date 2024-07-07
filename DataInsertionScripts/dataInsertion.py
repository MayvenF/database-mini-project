import csv
import random
from datetime import datetime, timedelta
from faker import Faker

fake = Faker()

conditions = ["Good", "Bad", "Fair"]
genres = ["Mystery", "Biography", "Fiction", "History", "Young Adult"]

book_script = 'INSERT INTO Book (\'BookID\', \'Condition\', \'Title\', \'Genre\')\n'

# generate data for Book
books = []
for i in range(200000):
    book_id = i
    condition = random.choice(conditions)
    title = fake.name()
    genre = random.choice(genres)
    books.append(book_id)
    book_script += f"({book_id}, '{condition}', '{title}', '{genre}')"

with open("C:\\Users\\maeve\\Documents\\School\\Year 3\\Semester 2\\book.sql", "w") as file:
    file.write(book_script)


# generate data for Reader
reader_script = 'INSERT INTO Reader (\'LibraryCard\', \'ReaderName\')\n'

readers = []
for i in range(500):
    library_card = random.randint(100000000, 999999999)
    reader_name = fake.name()
    readers.append(library_card)
    reader_script += f"({library_card}, '{reader_name}')"
with open("C:\\Users\\maeve\\Documents\\School\\Year 3\\Semester 2\\reader.sql", "w") as file:
    file.write(reader_script)


def random_date(start, end):
    """Generate a random date between start and end."""
    delta = end - start
    random_days = random.randint(0, delta.days)
    return start + timedelta(days=random_days)

def random_date_pair(start, end, min_loan_days=1, max_loan_days=30):
    """Generate a pair of random dates for book loans."""
    loan_start = random_date(start, end)
    loan_duration = random.randint(min_loan_days, max_loan_days)
    loan_end = loan_start + timedelta(days=loan_duration)
    return loan_start, loan_end

# generate data for Reservation
reserve_script = 'INSERT INTO Reservation (\'TransactionID\', \'LoanDate\', \'ReturnDate\', \'LibraryCard\', \'BookID\')\n'
start_date = datetime.strptime('2024-01-01', '%Y-%m-%d')
end_date = datetime.strptime('2025-12-31', '%Y-%m-%d')

for i in range(500):
    loan_start, loan_end = random_date_pair(start_date, end_date)
    library_card = random.choice(readers)
    book_id = random.choice(books)

    reserve_script += f'VALUES ({i}, {loan_start}, {loan_end}, {library_card}, {book_id})'

with open("C:\\Users\\maeve\\Documents\\School\\Year 3\\Semester 2\\publishedby.sql", "w") as file:
    file.write(reserve_script)

# generate data for PublishedBy
published_script = 'INSERT INTO PublishedBy (\'PublisherID\', \'PublishedDate\', \'BookID\')\n'
start_date = datetime.strptime('1965-01-01', '%Y-%m-%d')
end_date = datetime.strptime('2024-06-31', '%Y-%m-%d')

for i in range(200000):
    publishedDate, loan_end = random_date_pair(start_date, end_date)
    PublisherID = random.randint(0, 499)
    BookID = random.choice(books)

    published_script += f'VALUES ({PublisherID}, {publishedDate}, {i})'

with open("C:\\Users\\maeve\\Documents\\School\\Year 3\\Semester 2\\writtenby.sql", "w") as file:
    file.write(reserve_script)

# generate data for WrittenBy
published_script = 'INSERT INTO WrittenBy (\'AuthorID\', \'BookID\')\n'

for i in range(200000):
    AuthorID = random.randint(0, 1000)
    BookID = i
    published_script += f'VALUES ({AuthorID}, {BookID})'