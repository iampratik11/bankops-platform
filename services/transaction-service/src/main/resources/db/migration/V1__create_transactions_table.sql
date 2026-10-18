CREATE TABLE transactions (
    id BIGINT NOT NULL AUTO_INCREMENT,
    transaction_reference VARCHAR(64) NOT NULL,
    source_account_id BIGINT NOT NULL,
    destination_account_id BIGINT,
    transaction_type VARCHAR(20) NOT NULL,
    amount DECIMAL(19, 4) NOT NULL,
    currency CHAR(3) NOT NULL DEFAULT 'INR',
    status VARCHAR(20) NOT NULL DEFAULT 'PENDING',
    description VARCHAR(255),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY uk_transactions_reference (transaction_reference),
    KEY idx_transactions_source_account (source_account_id),
    KEY idx_transactions_destination_account (destination_account_id),
    KEY idx_transactions_status_created (status, created_at),
    CONSTRAINT chk_transactions_amount_positive CHECK (amount > 0),
    CONSTRAINT chk_transactions_type CHECK (
        transaction_type IN ('DEPOSIT', 'WITHDRAWAL', 'TRANSFER')
    ),
    CONSTRAINT chk_transactions_status CHECK (
        status IN ('PENDING', 'COMPLETED', 'FAILED', 'REVERSED')
    ),
    CONSTRAINT chk_transactions_different_accounts CHECK (
        destination_account_id IS NULL
        OR destination_account_id <> source_account_id
    )
);
