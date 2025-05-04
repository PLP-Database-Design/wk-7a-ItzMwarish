-- Question 1
-- Task:
-- - You are given the following table **ProductDetail**:

-- | OrderID | CustomerName  | Products                        |
-- |---------|---------------|---------------------------------|
-- | 101     | John Doe      | Laptop, Mouse                   |
-- | 102     | Jane Smith    | Tablet, Keyboard, Mouse         |
-- | 103     | Emily Clark   | Phone                           |


-- - In the table above, the **Products column** contains multiple values, which violates **1NF**.
-- - **Write an SQL query** to transform this table into **1NF**, ensuring that each row represents a single product for an order

-- approach and solution
-- introduce a primary key in the table, in this case, OrderID
-- have a separate products table  products
--  the two tables will have a one-to-many relationship
-- i created a db called sales 

CREATE DATABASE sales;
use sales;
CREATE TABLE ProductDetail (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(50)
  
);

ALTER TABLE ProductDetail AUTO_INCREMENT = 101;

insert into ProductDetail (CustomerName) values
('John Doe'),
('Jane Smith'),
('Emily Clark');

CREATE TABLE ProductsOrder (

    OrderID INT,
    ProductName VARCHAR(50),
    FOREIGN KEY (OrderID) REFERENCES ProductDetail(OrderID)
);

describe ProductDetail;
select * from ProductDetail;



insert into ProductsOrder (OrderID, ProductName) values
(101, 'Laptop'),
(101, 'Mouse'),
(102, 'Tablet'),
(102, 'Keyboard'),
(102, 'Mouse'),
(103, 'Phone');


select * from ProductsOrder;



-- Question 2
--  You are given the following table **OrderDetails**, which is already in **1NF** but still contains partial dependencies:

-- | OrderID | CustomerName  | Product      | Quantity |
-- |---------|---------------|--------------|----------|
-- | 101     | John Doe      | Laptop       | 2        |
-- | 101     | John Doe      | Mouse        | 1        |
-- | 102     | Jane Smith    | Tablet       | 3        |
-- | 102     | Jane Smith    | Keyboard     | 1        |
-- | 102     | Jane Smith    | Mouse        | 2        |
-- | 103     | Emily Clark   | Phone        | 1        |

-- - In the table above, the **CustomerName** column depends on **OrderID** (a partial dependency), which violates **2NF**. 

-- - Write an SQL query to transform this table into **2NF** by removing partial dependencies. Ensure that each non-key column fully depends on the entire primary key.

show databases;
use sales;
show tables;

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(50)
);
CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(50),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

INSERT INTO Orders (OrderID, CustomerName) VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');


INSERT INTO OrderItems (OrderID, Product, Quantity) VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);

