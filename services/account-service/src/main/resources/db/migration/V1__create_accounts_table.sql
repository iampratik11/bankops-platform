CREATE TABLE accounts (
    id BIGINT NOT NULL AUTO_INCREMENT,
    account_number VARCHAR(34) NOT NULL,
    customer_id BIGINT NOT NULL,
    account_type VARCHAR(20) NOT NULL,
    currency CHAR(3) NOT NULL DEFAULT 'INR',
    balance DECIMAL(19, 4) NOT NULL DEFAULT 0.0000,
    status VARCHAR(20) NOT NULL DEFAULT 'ACTIVE',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY uk_accounts_account_number (account_number),
    KEY idx_accounts_customer_id (customer_id),
    CONSTRAINT chk_accounts_balance_nonnegative CHECK (balance >= 0),
    CONSTRAINT chk_accounts_type CHECK (
        account_type IN ('SAVINGS', 'CURRENT')
    ),
    CONSTRAINT chk_accounts_status CHECK (
        status IN ('ACTIVE', 'FROZEN', 'CLOSED')
    )
);
