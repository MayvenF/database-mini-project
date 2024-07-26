CREATE TABLE Book (
    BookID int PRIMARY KEY,
    ISBN varchar(20),
    Genre varchar(50),
    Title varchar(255),
    Author varchar(255),
    Condition varchar(20)
);

CREATE TABLE Reader (
    ID int PRIMARY KEY,
    ReaderName varchar(255) NOT NULL
);

CREATE TABLE ReaderCard (
    ReaderID int PRIMARY KEY REFERENCES Reader(ID),
    CardNumber varchar(20),
    CardType varchar(50),
    LostDamaged_Status varchar(40)
);

CREATE TABLE Family (
    FamilyID int PRIMARY KEY,
    FamilyEmail varchar(255),
    FamilyPhone varchar(20)
);

CREATE TABLE Adult (
    ReaderID int PRIMARY KEY REFERENCES Reader(ID),
    FamilyID int REFERENCES Family(FamilyID),
    Email varchar(255),
    Cellphone varchar(20),
    Occupation varchar(255)
);

CREATE TABLE Child (
    ReaderID int PRIMARY KEY REFERENCES Reader(ID),
    Age int,
    FamilyID int REFERENCES Family(FamilyID)
);

CREATE TABLE Student (
    ReaderID int PRIMARY KEY REFERENCES Reader(ID),
    StudEmail varchar(255),
    Institution varchar(255),
    StudentID varchar(50)
);

CREATE TABLE Loan (
    TransactionID int PRIMARY KEY,
    BorrowDate date,
    DueDate date,
    BookID int REFERENCES Book(BookID),
    ReaderID int REFERENCES Reader(ID)
);

CREATE TABLE Publisher (
    PublisherID int PRIMARY KEY,
    PublisherName varchar(255) 
);

CREATE TABLE PublishedBy (
  BookID int REFERENCES Book(BookID),
  PublisherID int REFERENCES Publisher(PublisherID)
);

CREATE TABLE Supplier (
    SupplierID int PRIMARY KEY,  
    SupplierName varchar(255)
);

CREATE TABLE SuppliedBy (
  BookID int REFERENCES Book(BookID),
  SupplierID int REFERENCES Supplier(SupplierID)
);

CREATE TABLE Shelf (
    ShelfID int PRIMARY KEY,
    Location varchar(100),
    Capacity int
);

CREATE TABLE Location (
  ShelfID int REFERENCES Shelf(ShelfID),
  BookID int REFERENCES Book(BookID)
);
