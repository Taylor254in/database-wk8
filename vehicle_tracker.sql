-- Vehicle Tracker Database
-- Created by: Alex Kiptoo
-- Description: This database is for tracking vehicles, their owners, and trip data.

DROP TABLE IF EXISTS trip;
DROP TABLE IF EXISTS vehicle;
DROP TABLE IF EXISTS owner;

-- =============================
-- Table 1: owner
-- Stores vehicle owner information
-- =============================

CREATE TABLE owner (
    owner_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    phone_number VARCHAR(15) NOT NULL UNIQUE,
    email VARCHAR(100) UNIQUE
);

-- =============================
-- Table 2: vehicle
-- Stores details of each vehicle
-- =============================

CREATE TABLE vehicle (
    vehicle_id INT AUTO_INCREMENT PRIMARY KEY,
    owner_id INT,
    plate_number VARCHAR(20) NOT NULL UNIQUE,
    model VARCHAR(50),
    make_year YEAR,
    FOREIGN KEY (owner_id) REFERENCES owner(owner_id)
);

-- =============================
-- Table 3: trip
-- Records trips made by each vehicle
-- =============================

CREATE TABLE trip (
    trip_id INT AUTO_INCREMENT PRIMARY KEY,
    vehicle_id INT,
    start_location VARCHAR(100) NOT NULL,
    end_location VARCHAR(100) NOT NULL,
    distance_km DECIMAL(6,2),
    trip_date DATE NOT NULL,
    FOREIGN KEY (vehicle_id) REFERENCES vehicle(vehicle_id)
);
