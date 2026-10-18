CREATE TABLE customers (
    id BIGINT NOT NULL AUTO_INCREMENT,
    customer_number VARCHAR(32) NOT NULL,
    full_name VARCHAR(120) NOT NULL,
    email VARCHAR(254) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY uk_customers_customer_number (customer_number),
    UNIQUE KEY uk_customers_email (email)
);
