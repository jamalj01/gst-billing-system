-- Create Database
CREATE DATABASE gst_management;

-- Use the newly created database
USE gst_management;

-- Create Categories Table
CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    gst_rate DECIMAL(5,2) NOT NULL
);

-- Create Products Table
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    category_id INT,
    price DECIMAL(10,2),
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

-- Create Sales Table
CREATE TABLE sales (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    quantity INT,
    sale_date DATE,
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Insert Sample Data into Categories
INSERT INTO categories (name, gst_rate) VALUES
('Food', 5.00),
('Footwear', 10.00),
('Electronics', 20.00),
('Clothing', 15.00),
('Books', 0.00);

-- Insert Sample Data into Products
INSERT INTO products (name, category_id, price) VALUES
('Apple', 1, 1.50),
('Bread', 1, 2.00),
('Running Shoes', 2, 50.00),
('Smartphone', 3, 300.00),
('T-Shirt', 4, 20.00),
('Programming Book', 5, 30.00);

-- Insert Sample Data into Sales
INSERT INTO sales (product_id, quantity, sale_date) VALUES
(1, 10, '2024-08-15'),
(2, 5, '2024-08-15'),
(3, 2, '2024-08-15'),
(4, 1, '2024-08-15'),
(5, 3, '2024-08-15'),
(6, 4, '2024-08-15');

ALTER TABLE categories ADD COLUMN createdAt DATETIME DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE categories ADD COLUMN updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

ALTER TABLE products ADD COLUMN createdAt DATETIME DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE products ADD COLUMN updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

ALTER TABLE sales ADD COLUMN createdAt DATETIME DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE sales ADD COLUMN updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;
