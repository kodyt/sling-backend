-- CREATE DATABASE IF NOT EXISTS healthApp;


-- Users Table
CREATE TABLE IF NOT EXISTS Users (
    UserID INTEGER PRIMARY KEY AUTOINCREMENT,
    First_Name VARCHAR(255) NOT NULL,
    Last_Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    ProfilePic VARCHAR(64) NOT NULL
);

-- Medications Table (storing all of the medications in our db)
CREATE TABLE IF NOT EXISTS Medications (
    MedID INTEGER PRIMARY KEY AUTOINCREMENT,
    MedicationName VARCHAR(255) NOT NULL,
    MedicationType VARCHAR(255) NOT NULL
);

-- UserMeds Table (connects users to all of the meds they are taking)
CREATE TABLE IF NOT EXISTS UserMeds (
    UserMedID INTEGER PRIMARY KEY AUTOINCREMENT,
    UserID INTEGER,
    -- Tag VARCHAR(255) NOT NULL,
    -- MedicationRecord BOOLEAN NOT NULL,
    MedID INTEGER,
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE,
    FOREIGN KEY (MedID) REFERENCES Medications(MedID)
);

-- MedLog stores logged information from user about each med the user is taking
CREATE TABLE IF NOT EXISTS MedLog (
    UserMedID INTEGER NOT NULL,
    DateTaken DATE NOT NULL,
    Dosage INTEGER NOT NULL,
    Notes TEXT,
    FOREIGN KEY (UserMedID) REFERENCES UserMeds(UserMedID)
);

-- Symptoms Table (storing all available symptoms in our db)
-- user can input their own symptoms as well
CREATE TABLE IF NOT EXISTS Symptoms (
    SymptomID INTEGER PRIMARY KEY AUTOINCREMENT,
    SymptomName VARCHAR(255) NOT NULL,
    Descriptions TEXT NOT NULL,
    Category INTEGER NOT NULL
);

-- UserSymptoms Table 
CREATE TABLE IF NOT EXISTS UserSymptoms (
    UserSymptomID INTEGER PRIMARY KEY AUTOINCREMENT,
    UserID INTEGER NOT NULL,
    SymptomID INTEGER NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE,
    FOREIGN KEY (SymptomID) REFERENCES Symptoms(SymptomID)
);

-- Log of Non Pain Symptoms
-- reminders --> later problem
CREATE TABLE IF NOT EXISTS NonPainLog (
    UserSymptomID INTEGER,
    Severity INTEGER,
    -- Descriptions are a list of different categories (i.e. dry cough, scratchy throat)
    Descriptions VARCHAR(255),
    StartTime DATETIME NOT NULL,
    EndTime DATETIME NOT NULL,
    -- Tags VARCHAR(255),
    Notes TEXT,
    FOREIGN KEY (UserSymptomID) REFERENCES UserSymptoms(UserSymptomID)
);

-- Log of Pain Symptoms 
CREATE TABLE IF NOT EXISTS PainLog (
    PainDescriptorID INTEGER PRIMARY KEY AUTOINCREMENT,
    UserSymptomID INTEGER,
    Severity INTEGER,
    MovedLocation VARCHAR(255),
    TypeOfPain VARCHAR(255), -- Sharp, dull, radiating
    StartTime DATETIME NOT NULL,
    EndTime DATETIME NOT NULL,
    FOREIGN KEY (UserSymptomID) REFERENCES UserSymptoms(UserSymptomID)
);
