Create Table BookStore (
    id Integer Primary Key, 
    title Text, 
    author Text, 
    genre Text, 
    price Text
);

INSERT INTO BookStore VALUES
    (1, 'Harry Potter',	'J.K. Rowling',	'Fantasy', 19.99),
    (2, 'To Kill a Mockingbird', 'Harper Lee', 'Fiction', 14.99),
    (3, '1984', 'George Orwell', 'Dystopian', 12.99),
    (4, 'Pride and Prejudice', 'Jane Austen', 'Classic', 9.99),
    (5, 'The Catcher in the Rye', 'J.D. Salinger', 'Fiction', 11.99),
    (6,	'The Great Gatsby', 'F. Scott Fitzgerald', 'Classic', 10.99),
    (7,	'The Hobbit', 'J.R.R. Tolkien', 'Fantasy', 17.99),
    (8,	'The Lord of the Rings', 'J.R.R. Tolkien', 'Fantasy', 25.99),
    (9,	'The Alchemist', 'Paulo Coelho', 'Fiction',	13.99),
    (10, 'Brave New World',	'Aldous Huxley', 'Dystopian', 16.99),
    (11, 'Crime and Punishment', 'Fyodor Dostoevsky', 'Classic', 18.99),
    (12, 'The Da Vinci Code', 'Dan Brown', 'Mystery', 12.99),
    (13, 'The Hunger Games', 'Suzanne Collins',	'Young Adult', 14.99),
    (14, 'The Chronicles of Narnia', 'C.S. Lewis', 'Fantasy', 20.99),
    (15, 'The Shining', 'Stephen King',	'Horror', 15.99);

SELECT * From BookStore; 

SELECT * 
FROM BookStore 
ORDER BY price;

SELECT AVG(price) 
AS average_price 
FROM BookStore;