CREATE INDEX idx_return_date_book_id ON reservation (returndate, bookid);
-- Time: 93 msec

CREATE INDEX idx_genre ON book (genre);
-- Time: 665 msec

CREATE INDEX idx_readername ON reader (readername);
-- Time: 140 msec




-- Constraints


-- Makes sure that supplier id is unique
ALTER TABLE supplier ADD CONSTRAINT unique_supplier_id UNIQUE (supplierid)
--Time: 64 msec


-- Checks that the return date is after the loan date
ALTER TABLE reservation ADD CONSTRAINT check_dates CHECK (returndate > loandate)
--Time: 197 msec


-- Makes sure that the book id provided in reservation is a valid book id
ALTER TABLE reservation ADD CONSTRAINT fk_book_id FOREIGN KEY (bookid) REFERENCES book (bookid) 
--Time: 86 msec


-- Makes sure that the library card provided in reservation is a valid library card
ALTER TABLE reservation ADD CONSTRAINT fk_member_id FOREIGN KEY (librarycard) REFERENCES reader (librarycard);
--Time: 96 msec


-- Make sure that a book is not stored on more than one shelf
ALTER TABLE location ADD CONSTRAINT unique_book_shelf UNIQUE (bookid);
--Time: 133 msec