CREATE DATABASE SmartTeaStall;
SHOW DATABASES;
USE SmartTeaStall;
SHOW COLUMNS FROM tables LIKE 'status';
CREATE TABLE tables (
    table_id INT AUTO_INCREMENT PRIMARY KEY,
    table_name VARCHAR(20) NOT NULL UNIQUE,
    capacity INT NOT NULL,
    status ENUM('AVAILABLE','PARTIAL','FULL','RESERVED') DEFAULT 'AVAILABLE',
    location VARCHAR(50)
);
CREATE TABLE seats (
    seat_id INT AUTO_INCREMENT PRIMARY KEY,
    table_id INT NOT NULL,
    seat_number INT NOT NULL,
    status ENUM('AVAILABLE','OCCUPIED','RESERVED') DEFAULT 'AVAILABLE',

    FOREIGN KEY (table_id)
    REFERENCES tables(table_id)
    ON DELETE CASCADE
);
CREATE TABLE menu_categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL UNIQUE,
    description TEXT
);
CREATE TABLE menu_items (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    category_id INT NOT NULL,
    item_name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    available BOOLEAN DEFAULT TRUE,
    image_path VARCHAR(255),

    FOREIGN KEY (category_id)
    REFERENCES menu_categories(category_id)
    ON DELETE CASCADE
);
CREATE TABLE addons (
    addon_id INT AUTO_INCREMENT PRIMARY KEY,
    item_id INT NOT NULL,
    addon_name VARCHAR(100) NOT NULL,
    addon_price DECIMAL(10,2) DEFAULT 0.00,

    FOREIGN KEY (item_id)
    REFERENCES menu_items(item_id)
    ON DELETE CASCADE
);
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    table_id INT NOT NULL,
    customer_count INT NOT NULL,
    sharing_allowed BOOLEAN DEFAULT FALSE,

    order_status ENUM(
        'PLACED',
        'PREPARING',
        'READY',
        'SERVED',
        'COMPLETED',
        'CANCELLED'
    ) DEFAULT 'PLACED',

    total_amount DECIMAL(10,2) DEFAULT 0.00,
    order_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (table_id)
    REFERENCES tables(table_id)
);
CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    item_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (order_id)
    REFERENCES orders(order_id)
    ON DELETE CASCADE,

    FOREIGN KEY (item_id)
    REFERENCES menu_items(item_id)
);
CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,

    payment_method ENUM(
        'CASH',
        'UPI',
        'CARD'
    ) NOT NULL,

    payment_status ENUM(
        'PENDING',
        'PAID',
        'FAILED'
    ) DEFAULT 'PENDING',

    amount DECIMAL(10,2) NOT NULL,

    payment_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (order_id)
    REFERENCES orders(order_id)
);
CREATE TABLE feedback (
    feedback_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comments TEXT,
    feedback_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (order_id)
    REFERENCES orders(order_id)
);
SHOW TABLES;
SELECT password From admin ;



SELECT * FROM tables ;