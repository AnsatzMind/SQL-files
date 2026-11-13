USE project ;
GO
IF OBJECT_ID('customer','U') IS NULL 
BEGIN
CREATE TABLE customer (
       customer_ID INT IDENTITY(1,1) PRIMARY KEY,
       name VARCHAR(60) ,
       email VARCHAR(100),
       city VARCHAR(50),
       sign_up_date DATE,
       );
END
IF OBJECT_ID('products','U') IS NULL 
BEGIN
CREATE TABLE products (
       product_ID INT IDENTITY(1,1) PRIMARY KEY ,
       product_name VARCHAR(60) ,
       category VARCHAR(50),
       price DECIMAL(10,2) ,
       stock INT
       );

END
IF OBJECT_ID('orders','U') IS NULL 
BEGIN
CREATE TABLE orders (
         order_ID INT IDENTITY(1,1) PRIMARY KEY,
         customer_ID INT,
         order_date DATE,
         order_status VARCHAR(30),
         CONSTRAINT fk_orders_customer
         FOREIGN KEY (customer_ID)
         REFERENCES customer(customer_ID)
         );
END
IF OBJECT_ID('order_items','U') IS NULL 
BEGIN
CREATE TABLE order_items (
    order_item_ID INT IDENTITY(1,1) PRIMARY KEY,
    order_ID INT,
    product_ID INT,
    quantity INT,
    CONSTRAINT fk_order_items_orders
    FOREIGN KEY (order_ID) 
    REFERENCES orders(order_ID),
    CONSTRAINT fk_order_items_product
    FOREIGN KEY (product_ID)
    REFERENCES products(product_ID)
);
END
IF OBJECT_ID('payments','U') IS NULL 
BEGIN
CREATE TABLE payments (
    payment_ID INT IDENTITY(1,1) PRIMARY KEY,
    order_ID INT,
    payment_mode VARCHAR(30),
    amount DECIMAL(10,2),
    payment_date DATE,
    CONSTRAINT fk_payment_orders
    FOREIGN KEY (order_ID) 
    REFERENCES orders(order_ID)
);
END
GO