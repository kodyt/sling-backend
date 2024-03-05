INSERT INTO Users (First_Name, Last_Name, Email, ProfilePic) VALUES 
('John', 'Doe', 'johndoe@example.com', 'default.jpg'),
('Jane', 'Smith', 'janesmith@example.com', 'default.jpg');

INSERT INTO Medications (MedicationName, MedicationType) VALUES 
('Ibuprofen', 'NSAID'),
('Paracetamol', 'Analgesic');

INSERT INTO UserMeds (UserID, MedID) VALUES 
(1, 1),
(2, 2);

INSERT INTO MedLog (UserMedID, DateTaken, Dosage, Notes) VALUES 
(1, '2024-02-14', 400, 'No side effects'),
(2, '2024-02-14', 500, 'Felt better after an hour');

INSERT INTO Symptoms (SymptomName, Descriptions, Category) VALUES 
('Cough', 'A reflex action to clear your airways', 1),
('Headache', 'Pain in the head or upper neck', 2);

INSERT INTO UserSymptoms (UserID, SymptomID) VALUES 
(1, 1),
(2, 2);

INSERT INTO NonPainLog (UserSymptomID, Severity, Descriptions, StartTime, EndTime, Notes) VALUES 
(1, 3, 'Dry cough', '2024-02-14 08:00:00', '2024-02-14 12:00:00', 'Persisted for several hours'),
(2, 2, 'Mild headache', '2024-02-14 09:00:00', '2024-02-14 15:00:00', 'Relieved after taking medication'),
(1, 2, 'Persistent cough', '2024-02-15 09:00:00', '2024-02-15 11:00:00', 'Coughing more at night'),
(1, 4, 'Sneezing', '2024-02-16 10:00:00', '2024-02-16 10:30:00', 'Allergic reaction'),
(2, 1, 'Nausea', '2024-02-15 13:00:00', '2024-02-15 14:00:00', 'Felt sick after eating'),
(2, 3, 'Fatigue', '2024-02-17 08:00:00', '2024-02-17 20:00:00', 'Felt tired throughout the day');


INSERT INTO PainLog (UserSymptomID, Severity, MovedLocation, TypeOfPain, StartTime, EndTime) VALUES 
(1, 5, 'No', 'Sharp', '2024-02-14 10:00:00', '2024-02-14 11:00:00'),
(2, 4, 'Yes', 'Dull', '2024-02-14 11:30:00', '2024-02-14 16:00:00'),
(1, 6, 'Yes', 'Throbbing', '2024-02-15 12:00:00', '2024-02-15 14:00:00'),
(1, 7, 'No', 'Piercing', '2024-02-16 15:00:00', '2024-02-16 15:30:00'),
(2, 5, 'Yes', 'Aching', '2024-02-15 16:00:00', '2024-02-15 18:00:00'),
(2, 2, 'No', 'Stabbing', '2024-02-17 10:00:00', '2024-02-17 11:00:00');

