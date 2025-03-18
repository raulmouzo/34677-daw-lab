CREATE TABLE users (
    id INTEGER NOT NULL AUTO_INCREMENT,
    username VARCHAR(32) NOT NULL UNIQUE,
    password VARCHAR(40) DEFAULT '',
    active INTEGER DEFAULT 1,
    admin INTEGER DEFAULT 0,
    first_name VARCHAR(64) DEFAULT NULL,
    last_name VARCHAR(128) DEFAULT NULL,
    address VARCHAR(128) DEFAULT NULL,
    city VARCHAR(64) DEFAULT NULL,
    state VARCHAR(32) DEFAULT NULL,
    zip_code CHAR(5) DEFAULT NULL,
    phone CHAR(9) DEFAULT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE categories (
    id INTEGER NOT NULL AUTO_INCREMENT,
    description VARCHAR(255) DEFAULT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE products (
    id INTEGER NOT NULL AUTO_INCREMENT,
    description VARCHAR(255) DEFAULT NULL,
    price DECIMAL(8,2) DEFAULT 0,
    brand VARCHAR(100) DEFAULT NULL, 
    category_id INTEGER NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

CREATE TABLE variants (
    id INTEGER NOT NULL AUTO_INCREMENT,
    product_id INTEGER NOT NULL,
    size_label VARCHAR(10) NOT NULL, 
    stock INTEGER DEFAULT 0,
    PRIMARY KEY(id),
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
);

CREATE TABLE product_images (
    id INTEGER NOT NULL AUTO_INCREMENT,
    product_id INTEGER NOT NULL,
    image_url VARCHAR(255) NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
);

CREATE TABLE order_status (
    id INTEGER NOT NULL AUTO_INCREMENT,
    description VARCHAR(16) DEFAULT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE orders (
    id INTEGER NOT NULL AUTO_INCREMENT,
    user_id INTEGER NOT NULL,
    order_date DATE DEFAULT (CURRENT_DATE),
    total_amount DECIMAL(8,2) DEFAULT 0,
    status_id INTEGER NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (status_id) REFERENCES order_status(id)
);

CREATE TABLE order_details (
    order_id INTEGER NOT NULL,
    variant_id INTEGER NOT NULL, 
    quantity INTEGER DEFAULT 1,
    unit_price DECIMAL(8,2) DEFAULT 0,
    PRIMARY KEY(order_id, variant_id),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (variant_id) REFERENCES variants(id) 
);
