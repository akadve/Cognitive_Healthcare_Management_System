--Name:Annmay Manasi Manoj Kadve
--Subject: IFT 511
--Instructor: Ashish Gulati
--Project: Psychological Disorders Management System.
--Date of Submission: November 28 20233


-----------------Creating Database----------

-- Create the database
CREATE DATABASE ANNMA900;

-- Use the created database
USE ANNMA900;

-----------------Creating Tables---------------
-- Create the Patient table
CREATE TABLE Patient (
    PatientID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Gender VARCHAR(10),
    ContactNumber VARCHAR(15),
    Email VARCHAR(100),
    Address VARCHAR(255),
    EmergencyContactID INT,
    InsuranceID INT
);


-- Create the Therapist table
CREATE TABLE Therapist (
    TherapistID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Specialty VARCHAR(100),
    ContactNumber VARCHAR(15),
    Email VARCHAR(100),
    LicenseNumber VARCHAR(50)
);

-- Create the Appointment table
CREATE TABLE Appointment (
    AppointmentID INT PRIMARY KEY,
    PatientID INT,
    TherapistID INT,
    AppointmentDate DATE,
    StartTime TIME,
    EndTime TIME,
    Status VARCHAR(20),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (TherapistID) REFERENCES Therapist(TherapistID)
);

-- Create the Diagnosis table
CREATE TABLE Diagnosis (
    DiagnosisID INT PRIMARY KEY,
    PatientID INT,
    TherapistID INT,
    DiagnosisDate DATE,
    Description TEXT,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (TherapistID) REFERENCES Therapist(TherapistID)
);

-- Create the Assessment table
CREATE TABLE Assessment (
    AssessmentID INT PRIMARY KEY,
    PatientID INT,
    TherapistID INT,
    AssessmentDate DATE,
    AssessmentType VARCHAR(50),
    Score INT,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (TherapistID) REFERENCES Therapist(TherapistID)
);

-- Create the TreatmentPlan table
CREATE TABLE TreatmentPlan (
    TreatmentPlanID INT PRIMARY KEY,
    PatientID INT,
    TherapistID INT,
    StartDate DATE,
    EndDate DATE,
    Interventions TEXT,
    Medication TEXT,
    Goals TEXT,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (TherapistID) REFERENCES Therapist(TherapistID)
);

-- Create the Medication table
CREATE TABLE Medication (
    MedicationID INT PRIMARY KEY,
    PatientID INT,
    TherapistID INT,
    MedicationName VARCHAR(100),
    Dosage VARCHAR(50),
    Frequency VARCHAR(50),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (TherapistID) REFERENCES Therapist(TherapistID)
);

-- Create the EmergencyContact table
CREATE TABLE EmergencyContact (
    EmergencyContactID INT PRIMARY KEY,
    PatientID INT,
    EmergencyContactName VARCHAR(100),
    Relationship VARCHAR(50),
    ContactNumber VARCHAR(15),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);
-----------------------------------------------------------------------
-- Populating Data
-- Populate Patient table

INSERT INTO Patient (PatientID, FirstName, LastName, DateOfBirth, Gender, ContactNumber, Email, Address, EmergencyContactID, InsuranceID)
VALUES
    (1, 'John', 'Doe', '1980-01-15', 'Male', '123-456-7890', 'john.doe@email.com', '123 Main St, Cityville', 1, 1),
    (2, 'Jane', 'Smith', '1995-05-22', 'Female', '987-654-3210', 'jane.smith@email.com', '456 Oak St, Townsville', 2, 2),
    (3, 'David', 'Johnson', '1988-09-10', 'Male', '555-123-4567', 'david.johnson@email.com', '789 Pine St, Villagetown', 3, 3),
    (4, 'Emily', 'Brown', '1992-03-07', 'Female', '777-888-9999', 'emily.brown@email.com', '101 Cedar St, Hamletsville', 4, 4),
    (5, 'Michael', 'Jones', '1985-12-20', 'Male', '111-222-3333', 'michael.jones@email.com', '202 Elm St, Countryside', 5, 5),
    (6, 'Amanda', 'Taylor', '1990-06-18', 'Female', '444-555-6666', 'amanda.taylor@email.com', '303 Maple St, Suburbia', 6, 6),
    (7, 'Daniel', 'White', '1982-11-25', 'Male', '666-777-8888', 'daniel.white@email.com', '404 Birch St, Uptown', 7, 7),
    (8, 'Olivia', 'Miller', '1998-04-30', 'Female', '999-000-1111', 'olivia.miller@email.com', '505 Walnut St, Downtown', 8, 8),
    (9, 'William', 'Moore', '1987-08-14', 'Male', '222-333-4444', 'william.moore@email.com', '606 Oak St, Outskirts', 9, 9),
    (10, 'Sophia', 'Lee', '1994-02-03', 'Female', '333-444-5555', 'sophia.lee@email.com', '707 Pine St, Riverside', 10, 10);
	select*from Patient

-- Populate Therapist table


-- Insert data into the Therapist table
INSERT INTO Therapist (TherapistID, FirstName, LastName, Specialty, ContactNumber, Email, LicenseNumber)
VALUES
    (1, 'Dr. Emily', 'Anderson', 'Clinical Psychologist', '555-777-8888', 'emily.anderson@email.com', 'DEF456'),
    (2, 'Dr. Christopher', 'Moore', 'Counselor', '555-111-2222', 'christopher.moore@email.com', 'GHI789'),
    (3, 'Dr. Amanda', 'Taylor', 'Psychiatrist', '555-444-5555', 'amanda.taylor@email.com', 'JKL012'),
    (4, 'Dr. Daniel', 'White', 'Therapist', '555-666-7777', 'daniel.white@email.com', 'MNO345'),
    (5, 'Dr. Jessica', 'Clark', 'Psychologist', '555-888-9999', 'jessica.clark@email.com', 'PQR678'),
    (6, 'Dr. Kevin', 'Baker', 'Counseling Psychologist', '555-222-3333', 'kevin.baker@email.com', 'STU901'),
    (7, 'Dr. Nicole', 'Hill', 'Mental Health Counselor', '555-333-4444', 'nicole.hill@email.com', 'VWX234'),
    (8, 'Dr. David', 'Ward', 'Clinical Therapist', '555-555-6666', 'david.ward@email.com', 'YZA567'),
    (9, 'Dr. Sarah', 'Evans', 'Psychiatrist', '555-999-0000', 'sarah.evans@email.com', 'BCD890'),
    (10, 'Dr. Matthew', 'Fisher', 'Counselor', '555-000-1111', 'matthew.fisher@email.com', 'EFG123');

	select*from Therapist

-- Populate Appointment table
INSERT INTO Appointment (AppointmentID, PatientID, TherapistID, AppointmentDate, StartTime, EndTime, Status)
VALUES
    (1, 1, 1, '2023-01-15', '11:30:00', '12:30:00', 'Scheduled'),
    (2, 2, 2, '2023-01-18', '15:30:00', '16:30:00', 'Completed'),
    (3, 1, 1, '2023-01-22', '10:00:00', '11:00:00', 'Canceled'),
    (4, 2, 2, '2023-01-25', '14:30:00', '15:30:00', 'Scheduled'),
    (5, 1, 1, '2023-01-28', '12:00:00', '13:00:00', 'Completed'),
    (6, 2, 2, '2023-02-01', '16:00:00', '17:00:00', 'Scheduled'),
    (7, 1, 1, '2023-02-05', '09:30:00', '10:30:00', 'Scheduled'),
    (8, 2, 2, '2023-02-08', '14:00:00', '15:00:00', 'Completed'),
    (9, 1, 1, '2023-02-12', '11:00:00', '12:00:00', 'Scheduled'),
    (10, 2, 2, '2023-02-15', '15:00:00', '16:00:00', 'Scheduled'),
	(11, 1, 1, '2023-02-19', '11:30:00', '12:30:00', 'Canceled'),
    (12, 2, 2, '2023-02-22', '15:30:00', '16:30:00', 'Scheduled'),
    (13, 1, 1, '2023-02-26', '10:00:00', '11:00:00', 'Scheduled'),
    (14, 2, 2, '2023-03-01', '14:30:00', '15:30:00', 'Completed'),
    (15, 1, 1, '2023-03-04', '12:00:00', '13:00:00', 'Scheduled'),
    (16, 2, 2, '2023-03-08', '16:00:00', '17:00:00', 'Scheduled'),
    (17, 1, 1, '2023-03-12', '09:30:00', '10:30:00', 'Completed'),
    (18, 2, 2, '2023-03-15', '14:00:00', '15:00:00', 'Scheduled'),
    (19, 1, 1, '2023-03-19', '11:00:00', '12:00:00', 'Scheduled'),
    (20, 2, 2, '2023-03-22', '15:00:00', '16:00:00', 'Canceled');
	select*from Appointment


-- Populate Diagnosis table
-- Continue inserting data into the Diagnosis table
INSERT INTO Diagnosis (DiagnosisID, PatientID, TherapistID, DiagnosisDate, Description)
VALUES
	(1, 1, 1, '2023-01-10', 'Major Depressive Disorder'),
    (2, 2, 2, '2023-01-12', 'Generalized Anxiety Disorder'),
    (3, 1, 1, '2023-02-05', 'Social Anxiety Disorder'),
    (4, 2, 2, '2023-02-10', 'Panic Disorder'),
    (5, 1, 1, '2023-02-20', 'Bipolar Disorder'),
    (6, 2, 2, '2023-03-05', 'Obsessive-Compulsive Disorder'),
    (7, 1, 1, '2023-03-15', 'Post-Traumatic Stress Disorder'),
    (8, 2, 2, '2023-03-20', 'Attention-Deficit/Hyperactivity Disorder'),
    (9, 1, 1, '2023-04-02', 'Schizophrenia'),
    (10, 2, 2, '2023-04-10', 'Eating Disorder'),
	(11, 1, 1, '2023-04-15', 'Borderline Personality Disorder'),
    (12, 2, 2, '2023-04-22', 'Substance Use Disorder'),
    (13, 1, 1, '2023-05-01', 'Autism Spectrum Disorder'),
    (14, 2, 2, '2023-05-10', 'Schizoaffective Disorder'),
    (15, 1, 1, '2023-05-18', 'Hoarding Disorder'),
    (16, 2, 2, '2023-06-02', 'Body Dysmorphic Disorder'),
    (17, 1, 1, '2023-06-15', 'Insomnia Disorder'),
    (18, 2, 2, '2023-06-22', 'Disruptive Mood Dysregulation Disorder'),
    (19, 1, 1, '2023-07-05', 'Specific Phobia'),
    (20, 2, 2, '2023-07-12', 'Adjustment Disorder');
	select*from Diagnosis

-- Populate Assessment table
INSERT INTO Assessment (AssessmentID, PatientID, TherapistID, AssessmentDate, AssessmentType, Score)
VALUES
	(1, 1, 1, '2023-01-12', 'Beck Depression Inventory', 20),
	(2, 2, 2, '2023-01-14', 'Hamilton Anxiety Rating Scale', 25),
	(3, 1, 1, '2023-02-15', 'PHQ-9', 12),
    (4, 2, 2, '2023-02-18', 'GAD-7', 14),
    (5, 1, 1, '2023-03-05', 'Beck Anxiety Inventory', 20),
    (6, 2, 2, '2023-03-10', 'Hamilton Depression Rating Scale', 28),
    (7, 1, 1, '2023-04-01', 'MADRS', 15),
    (8, 2, 2, '2023-04-05', 'Yale-Brown Obsessive Compulsive Scale', 10),
    (9, 1, 1, '2023-04-20', 'PANSS', 32),
    (10, 2, 2, '2023-04-25', 'PTSD Checklist for DSM-5', 25),
	(11, 1, 1, '2023-05-10', 'Montgomery-Asberg Depression Rating Scale', 18),
    (12, 2, 2, '2023-05-15', 'State-Trait Anxiety Inventory', 22),
    (13, 1, 1, '2023-06-02', 'Zung Self-Rating Depression Scale', 14),
    (14, 2, 2, '2023-06-10', 'Obsessive-Compulsive Inventory - Revised', 30),
    (15, 1, 1, '2023-07-01', 'Generalized Anxiety Disorder 7', 16),
    (16, 2, 2, '2023-07-05', 'Columbia-Suicide Severity Rating Scale', 2),
    (17, 1, 1, '2023-08-20', 'Patient Health Questionnaire-15', 10),
    (18, 2, 2, '2023-08-25', 'Rosenberg Self-Esteem Scale', 28),
    (19, 1, 1, '2023-09-10', 'Social Phobia Inventory', 24),
    (20, 2, 2, '2023-09-15', 'Childhood Trauma Questionnaire', 35);
	select*from Assessment

-- Populate TreatmentPlan table
INSERT INTO TreatmentPlan (TreatmentPlanID, PatientID, TherapistID, StartDate, EndDate, Interventions, Medication, Goals)
VALUES
	(1, 1, 1, '2023-01-15', '2023-02-15', 'Cognitive Behavioral Therapy', 'SSRI Antidepressant', 'Improve mood and daily functioning'),
	(2, 2, 2, '2023-01-17', '2023-02-17', 'Mindfulness Meditation', 'Benzodiazepine', 'Reduce anxiety symptoms'),
	(3, 1, 1, '2023-03-01', '2023-04-30', 'Mindfulness-Based Stress Reduction', 'None', 'Stress reduction and relaxation'),
    (4, 2, 2, '2023-04-01', '2023-05-31', 'Dialectical Behavior Therapy', 'Antipsychotic Medication', 'Emotion regulation and interpersonal effectiveness'),
    (5, 1, 1, '2023-05-01', '2023-06-30', 'Family Therapy', 'Mood Stabilizer', 'Improve family dynamics and communication'),
    (6, 2, 2, '2023-06-01', '2023-07-31', 'Narrative Therapy', 'Selective Serotonin-Norepinephrine Reuptake Inhibitor', 'Explore personal narratives and coping strategies'),
    (7, 1, 1, '2023-08-01', '2023-09-30', 'Art Therapy', 'Atypical Antipsychotic', 'Creative expression and emotional exploration'),
    (8, 2, 2, '2023-10-01', '2023-11-30', 'Play Therapy', 'Anxiolytic Medication', 'Childhood trauma processing and anxiety reduction'),
    (9, 1, 1, '2023-12-01', '2024-01-31', 'Solution-Focused Brief Therapy', 'SSRI Antidepressant', 'Goal setting and solution-focused strategies'),
    (10, 2, 2, '2024-02-01', '2024-03-31', 'Gestalt Therapy', 'Antianxiety Medication', 'Holistic self-awareness and present-focused exploration'),
	 (11, 1, 1, '2024-04-01', '2024-05-31', 'Acceptance and Commitment Therapy', 'Mood Stabilizer', 'Mindfulness and values-driven actions'),
    (12, 2, 2, '2024-06-01', '2024-07-31', 'Person-Centered Therapy', 'Anxiolytic Medication', 'Client-centered exploration of self'),
    (13, 1, 1, '2024-08-01', '2024-09-30', 'Couples Therapy', 'Antidepressant Medication', 'Enhance communication and relational satisfaction'),
    (14, 2, 2, '2024-10-01', '2024-11-30', 'Schema Therapy', 'Atypical Antipsychotic', 'Address maladaptive cognitive patterns and behaviors'),
    (15, 1, 1, '2024-12-01', '2025-01-31', 'Biofeedback Therapy', 'SSRI Antidepressant', 'Enhance self-regulation and stress management'),
    (16, 2, 2, '2025-02-01', '2025-03-31', 'Equine-Assisted Psychotherapy', 'Selective Serotonin Reuptake Inhibitor', 'Explore emotions through interaction with horses'),
    (17, 1, 1, '2025-04-01', '2025-05-31', 'Neurofeedback Therapy', 'Antipsychotic Medication', 'Train brain patterns for improved mental functioning'),
    (18, 2, 2, '2025-06-01', '2025-07-31', 'Music Therapy', 'Anxiolytic Medication', 'Utilize music for emotional expression and coping'),
    (19, 1, 1, '2025-08-01', '2025-09-30', 'Transcranial Magnetic Stimulation (TMS)', 'Mood Stabilizer', 'Non-invasive brain stimulation for mood improvement'),
    (20, 2, 2, '2025-10-01', '2025-11-30', 'Reality Therapy', 'Antidepressant Medication', 'Focus on present behavior and choices for personal fulfillment');
	select*from TreatmentPlan

-- Populate Medication table
INSERT INTO Medication (MedicationID, PatientID, TherapistID, MedicationName, Dosage, Frequency)
VALUES
	(1, 1, 1, 'Prozac', '20mg', 'Once a day'),
	(2, 2, 2, 'Xanax', '0.5mg', 'As needed'),
	(3, 1, 1, 'Wellbutrin', '150mg', 'Once daily'),
    (4, 2, 2, 'Lexapro', '10mg', 'Once daily'),
    (5, 1, 1, 'Zoloft', '50mg', 'Once daily'),
    (6, 2, 2, 'Ativan', '1mg', 'As needed'),
    (7, 1, 1, 'Celexa', '20mg', 'Once daily'),
    (8, 2, 2, 'Klonopin', '0.5mg', 'As needed'),
    (9, 1, 1, 'Effexor', '75mg', 'Once daily'),
    (10, 2, 2, 'Valium', '5mg', 'As needed'),
	(11, 1, 1, 'Paxil', '30mg', 'Once daily'),
    (12, 2, 2, 'Buspar', '15mg', 'Twice daily'),
    (13, 1, 1, 'Trintellix', '20mg', 'Once daily'),
    (14, 2, 2, 'Risperdal', '1mg', 'Once daily'),
    (15, 1, 1, 'Abilify', '10mg', 'Once daily'),
    (16, 2, 2, 'Seroquel', '50mg', 'Once daily'),
    (17, 1, 1, 'Remeron', '15mg', 'Once daily'),
    (18, 2, 2, 'Lamictal', '25mg', 'Once daily'),
    (19, 1, 1, 'Geodon', '80mg', 'Twice daily'),
    (20, 2, 2, 'Lyrica', '75mg', 'Twice daily');
	select*from Medication


-- Populate EmergencyContact table
INSERT INTO EmergencyContact (EmergencyContactID, PatientID, EmergencyContactName, Relationship, ContactNumber)
VALUES
	(1, 1, 'Alice Doe', 'Spouse', '1112223333'),
	(2, 2, 'Bob Smith', 'Sibling', '4445556666'),
	(3, 1, 'David Doe', 'Brother', '555-555-5555'),
    (4, 2, 'Emily Smith', 'Friend', '555-666-6666'),
    (5, 1, 'Susan Johnson', 'Aunt', '555-777-7777'),
    (6, 2, 'Daniel Williams', 'Cousin', '555-888-8888'),
    (7, 1, 'Chris Doe', 'Father', '555-999-9999'),
    (8, 2, 'Olivia Smith', 'Sister', '555-000-0000'),
    (9, 1, 'Grace Johnson', 'Grandmother', '555-111-2222'),
    (10, 2, 'William Williams', 'Grandfather', '555-333-4444');
	SELECT*FROM EmergencyContact



----------------------------Creating Views----------------------
--------------------------------1-----------------------------------
CREATE VIEW PatientAppointments AS
SELECT a.AppointmentID, a.AppointmentDate, a.StartTime, a.EndTime, a.Status
FROM Appointment a
WHERE a.PatientID = 1;
SELECT * FROM PatientAppointments;


-------------------------------2-------------------------------------
CREATE VIEW PatientTherapistPrescriptions AS
SELECT m.MedicationName, m.Dosage, m.Frequency  
FROM Medication m
JOIN Patient p ON m.PatientID = p.PatientID
JOIN Therapist t ON m.TherapistID = t.TherapistID
WHERE p.PatientID = 1 AND t.TherapistID = 1;
SELECT * FROM PatientTherapistPrescriptions;


------------------------------3---------------------------------------
CREATE VIEW HighRiskPatients AS
SELECT p.PatientID, p.FirstName, p.LastName, a.AssessmentDate, a.AssessmentType, a.Score
FROM Patient p
JOIN Assessment a ON a.PatientID = p.PatientID
WHERE a.Score > 15;

SELECT * FROM HighRiskPatients;

---------------------------Audit Tables------------
 -- Create TherapistAudit table for auditing changes to the Therapist table
CREATE TABLE TherapistAudit (

    TherapistID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Specialty VARCHAR(100),
    ContactNumber VARCHAR(15),
    Email VARCHAR(100),
    LicenseNumber VARCHAR(50),
    DateTimeChanged DATETIME
);

-- Trigger for INSERT operation on Therapist table
CREATE TRIGGER AfterInsertTherapist
AFTER INSERT ON Therapist
FOR EACH ROW
INSERT INTO TherapistAudit (TherapistID, FirstName, LastName, Specialty, ContactNumber, Email, LicenseNumber, DateTimeChanged)
VALUES (NEW.TherapistID, NEW.FirstName, NEW.LastName, NEW.Specialty, NEW.ContactNumber, NEW.Email, NEW.LicenseNumber, NOW());

-- Trigger for UPDATE operation on Therapist table
CREATE TRIGGER AfterUpdateTherapist
AFTER UPDATE ON Therapist
FOR EACH ROW
INSERT INTO TherapistAudit (TherapistID, FirstName, LastName, Specialty, ContactNumber, Email, LicenseNumber, DateTimeChanged)
VALUES (OLD.TherapistID, OLD.FirstName, OLD.LastName, OLD.Specialty, OLD.ContactNumber, OLD.Email, OLD.LicenseNumber, NOW());

-- Trigger for DELETE operation on Therapist table
CREATE TRIGGER AfterDeleteTherapist
AFTER DELETE ON Therapist
FOR EACH ROW
INSERT INTO TherapistAudit (TherapistID, FirstName, LastName, Specialty, ContactNumber, Email, LicenseNumber, DateTimeChanged)
VALUES (OLD.TherapistID, OLD.FirstName, OLD.LastName, OLD.Specialty, OLD.ContactNumber, OLD.Email, OLD.LicenseNumber, NOW());

--------Testing Audit Results------------
-- Insert a new therapist
INSERT INTO Therapist (TherapistID, FirstName, LastName, Specialty, ContactNumber, Email, LicenseNumber)
VALUES (11, 'Dr. Sarah', 'Williams', 'Family Therapist', '555-333-2222', 'sarah.williams@email.com', 'XYZ789');
Select*from Therapist

-- Update an existing therapist
UPDATE Therapist
SET Specialty = 'Updated Specialty'
WHERE TherapistID = 11;
Select*from Therapist

-- Delete a therapist
DELETE FROM Therapist
WHERE TherapistID = 11;

-- View entries in the TherapistAudit table
SELECT * FROM Therapist;
------------------------------------


---------------Two Stored Procedures For Database---------------
--------------- Create a stored procedure to insert a new---------
CREATE PROCEDURE spAddPatient
@PatientID INT, 
@FirstName VARCHAR(50),  
@LastName VARCHAR(50),
@DateOfBirth DATE,
@Gender VARCHAR(10),
@ContactNumber VARCHAR(15),
@Email VARCHAR(100), 
@Address VARCHAR(255),
@EmergencyContactID INT,
@InsuranceID INT
AS  
BEGIN
  INSERT INTO Patient (PatientID,FirstName, LastName, DateOfBirth, Gender, ContactNumber, Email, Address, EmergencyContactID, InsuranceID)
  VALUES (@PatientID, @FirstName, @LastName, @DateOfBirth, @Gender, @ContactNumber, @Email, @Address, @EmergencyContactID, @InsuranceID);
END

---- TO CALL----
select*from Patient

EXEC spAddPatient
@PatientID = 11,
  @FirstName = 'Nora',
  @LastName = 'Dev',
  @DateOfBirth = '1990-05-15',  
  @Gender = 'Female',
  @ContactNumber = '123-654-7890',
  @Email = 'Nora@email.com',
  @Address = '321 Main St, tempe',
  @EmergencyContactID = 9, 
  @InsuranceID = 11;
 
 select*from Patient

---------------cURSORS----------------------
USE ANNMA900
-- Cursor 1 - Get list of patients and their appointments

DECLARE @PatientID int, @FirstName varchar(50), @AppointmentDate date

DECLARE patient_cursor CURSOR FOR 
SELECT p.PatientID, p.FirstName, a.AppointmentDate
FROM Patient p JOIN Appointment a ON a.PatientID = p.PatientID

OPEN patient_cursor
FETCH NEXT FROM patient_cursor INTO @PatientID, @FirstName, @AppointmentDate

WHILE @@FETCH_STATUS = 0  
BEGIN
   PRINT 'Patient ' + @FirstName + ' (ID=' + CAST(@PatientID AS varchar) + ') has an appointment on ' + CAST(@AppointmentDate AS varchar)
   FETCH NEXT FROM patient_cursor INTO @PatientID, @FirstName, @AppointmentDate
END

CLOSE patient_cursor
DEALLOCATE patient_cursor


-- Cursor 2 - Get list of high risk patients based on assessment score 

DECLARE @PatientID int, @FirstName varchar(50), @Score int

DECLARE high_risk_cursor CURSOR FOR
SELECT p.PatientID, p.FirstName, a.Score 
FROM Patient p JOIN Assessment a ON a.PatientID = p.PatientID
WHERE a.Score > 15

OPEN high_risk_cursor
FETCH NEXT FROM high_risk_cursor INTO @PatientID, @FirstName, @Score

WHILE @@FETCH_STATUS = 0
BEGIN
   PRINT 'High risk patient ' + @FirstName + ' (ID=' + CAST(@PatientID AS varchar) + ') has score of ' + CAST(@Score AS varchar)
   FETCH NEXT FROM high_risk_cursor INTO @PatientID, @FirstName, @Score
END

CLOSE high_risk_cursor  
DEALLOCATE high_risk_cursor



-----------DROP---------------

DROP DATABASE ANNMA900