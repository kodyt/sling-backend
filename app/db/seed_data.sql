-- Inserting data into the Users table
INSERT INTO Users (FirstName, LastName, Email) VALUES
('John', 'Doe', 'john.doe@example.com'),
('Jane', 'Doe', 'jane.doe@example.com');

-- Inserting data into the Medications table
INSERT INTO Medications (MedicationName, MedicationType) VALUES
('Amoxicillin', 'Antibiotic'),
('Ibuprofen', 'Anti-inflammatory');

-- Inserting data into the Symptoms table
INSERT INTO Symptoms (SymptomName, Descriptions) VALUES
('Headache', 'A pain in the head with the pain being above the eyes or the ears, behind the head (occipital), or in the back of the upper neck.'),
('Cough', 'A sudden and often repetitively occurring reflex which helps to clear the large breathing passages from fluids, irritants, foreign particles and microbes.');

-- Assuming you have Users with UserID 1 and 2, and Medications with MedID 1 and 2
-- Inserting data into the UserMeds table linking Users to Medications
INSERT INTO UserMeds (UserID, MedID, DateTaken, NumberOfTimesTaken, Notes) VALUES
(1, 1, CURDATE(), 3, 'Taken after meals'),
(2, 2, CURDATE(), 2, 'Taken with water');

-- Assuming Symptoms with SymptomID 1 and 2
-- Inserting data into the UserSymptoms table linking Users to Symptoms
INSERT INTO UserSymptoms (UserID, SymptomID, StartTime, EndTime, Notes) VALUES
(1, 1, NOW(), NULL, 'Mild headache started this morning'),
(2, 2, NOW(), NULL, 'Persistent cough for the last 3 days');

-- Assuming UserSymptoms with UserSymptomID 1 and 2
-- Inserting data into the PainDescriptors table
INSERT INTO PainDescriptors (UserSymptomID, Severity, Location, TypeOfPain) VALUES
(1, 'Moderate', 'Forehead', 'Throbbing'),
(2, 'Mild', 'Throat', 'Scratchy');
