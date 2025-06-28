-- Create database
CREATE DATABASE f1_championship;
USE f1_championship;

-- Teams table
CREATE TABLE constructors (
    constructor_id INT PRIMARY KEY,
    constructor_name VARCHAR(50) NOT NULL,
    nationality VARCHAR(30),
    engine_supplier VARCHAR(30)
);

-- Races table
CREATE TABLE races (
    race_id INT PRIMARY KEY,
    race_name VARCHAR(50) NOT NULL,
    circuit_name VARCHAR(50),
    race_date DATE,
    season INT NOT NULL
);

-- Race results table
CREATE TABLE constructor_results (
    result_id INT PRIMARY KEY,
    race_id INT,
    constructor_id INT,
    points DECIMAL(10,2) NOT NULL,
    position INT,
    FOREIGN KEY (race_id) REFERENCES races(race_id),
    FOREIGN KEY (constructor_id) REFERENCES constructors(constructor_id)
);

-- Insert constructors (teams)
INSERT INTO constructors VALUES
(1, 'Mercedes', 'German', 'Mercedes'),
(2, 'Red Bull', 'Austrian', 'Honda'),
(3, 'Ferrari', 'Italian', 'Ferrari'),
(4, 'McLaren', 'British', 'Mercedes');

-- Insert races
INSERT INTO races VALUES
(101, 'Bahrain Grand Prix', 'Bahrain International Circuit', '2023-03-05', 2023),
(102, 'Saudi Arabian GP', 'Jeddah Corniche Circuit', '2023-03-19', 2023),
(103, 'Australian GP', 'Albert Park', '2023-04-02', 2023);

-- Insert constructor results
INSERT INTO constructor_results VALUES
(1001, 101, 1, 25, 1),  -- Mercedes won Bahrain
(1002, 101, 2, 18, 2),  -- Red Bull 2nd
(1003, 101, 3, 15, 3),  -- Ferrari 3rd
(1004, 102, 2, 25, 1),   -- Red Bull won Saudi
(1005, 102, 1, 18, 2),   -- Mercedes 2nd
(1006, 102, 4, 12, 4),   -- McLaren 4th
(1007, 103, 3, 25, 1),    -- Ferrari won Australia
(1008, 103, 2, 18, 2),    -- Red Bull 2nd
(1009, 103, 1, 15, 3);    -- Mercedes 3rd