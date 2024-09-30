CREATE DATABASE IF NOT EXISTS Q;

use Q;

-- Create Condition table (renamed from KitCondition)
CREATE TABLE IF NOT EXISTS Condition (
    id INT AUTO_INCREMENT PRIMARY KEY,
    condition_name VARCHAR(50) NOT NULL UNIQUE,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Insert default conditions
INSERT INTO Condition (condition_name) VALUES
('New'), ('Excellent'), ('Good'), ('Fair'), ('Poor');

-- Create StorageLocation table
CREATE TABLE IF NOT EXISTS StorageLocation (
    id INT AUTO_INCREMENT PRIMARY KEY,
    location_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Modify kit table
CREATE TABLE IF NOT EXISTS Kit (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    storage_location_id INT,
    purchase_cost DECIMAL(10, 2),
    condition_id INT NOT NULL,
    last_checked_date DATE,
    projected_replacement_cost DECIMAL(10, 2),
    current_value DECIMAL(10, 2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (condition_id) REFERENCES Condition(id),
    FOREIGN KEY (storage_location_id) REFERENCES StorageLocation(id)
);

