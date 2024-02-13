-- CREATE DATABASE IF NOT EXISTS healthApp;


-- Users Table
CREATE TABLE IF NOT EXISTS Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    First_Name VARCHAR(255) NOT NULL,
    Last_Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL
);

-- Medications Table
CREATE TABLE IF NOT EXISTS Medications (
    MedID INT AUTO_INCREMENT PRIMARY KEY,
    MedicationName VARCHAR(255) NOT NULL,
    MedicationType VARCHAR(255) NOT NULL
);

-- UserMeds Table
CREATE TABLE IF NOT EXISTS UserMeds (
    UserMedID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    MedID INT,
    DateTaken DATE NOT NULL,
    NumberOfTimesTaken INT NOT NULL,
    Notes TEXT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (MedID) REFERENCES Medications(MedID)
);

-- Symptoms Table
CREATE TABLE IF NOT EXISTS Symptoms (
    SymptomID INT AUTO_INCREMENT PRIMARY KEY,
    SymptomName VARCHAR(255) NOT NULL,
    Descriptions TEXT NOT NULL
);

-- UserSymptoms Table
CREATE TABLE IF NOT EXISTS UserSymptoms (
    UserSymptomID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    SymptomID INT,
    StartTime DATETIME NOT NULL,
    EndTime DATETIME,
    Notes TEXT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (SymptomID) REFERENCES Symptoms(SymptomID)
);

-- PainDescriptors Table
CREATE TABLE IF NOT EXISTS PainDescriptors (
    PainDescriptorID INT AUTO_INCREMENT PRIMARY KEY,
    UserSymptomID INT,
    Severity VARCHAR(255) NOT NULL,
    Location VARCHAR(255) NOT NULL,
    TypeOfPain VARCHAR(255) NOT NULL,
    FOREIGN KEY (UserSymptomID) REFERENCES UserSymptoms(UserSymptomID)
);
