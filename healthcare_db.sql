--  Database
CREATE DATABASE IF NOT EXISTS healthcare_db;
USE healthcare_db;

--  Geographical Location Table
CREATE TABLE geographical_location (
    Location_ID INT PRIMARY KEY,
    Village VARCHAR(100),
    Parish VARCHAR(100),
    Sub_County VARCHAR(100),
    County VARCHAR(100),
    Region VARCHAR(50),
    Population INT,
    Coordinates VARCHAR(100),
    Malaria_Risk_Level VARCHAR(50),
    Health_Facilities_Count INT,
    ITN_Coverage DECIMAL(5, 2),
    Reported_Cases INT
);

--  Patient Data Table
CREATE TABLE patient_data (
    Patient_ID INT PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Date_of_Birth DATE,
    Phone_Number VARCHAR(20),
    Next_of_Kin VARCHAR(100),
    Address TEXT,
    Date_Added DATE,
    Update_Date DATE
);

--  Health Facility Table
CREATE TABLE health_facility (
    Facility_ID INT PRIMARY KEY,
    Facility_Name VARCHAR(100),
    Location_ID INT,
    Facility_Type_ID INT,
    Capacity INT,
    Contact_Details VARCHAR(100),
    Date_Added DATE,
    Date_Updated DATE,
    FOREIGN KEY (Location_ID) REFERENCES geographical_location(Location_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Treatment Table
CREATE TABLE treatment (
    Treatment_ID INT PRIMARY KEY,
    Treatment_Name VARCHAR(100),
    Treatment_Description TEXT,
    Cost DECIMAL(10, 2),
    Date_Added DATE,
    Date_Updated DATE
);

--Treatment Outcome Table
CREATE TABLE treatment_outcome (
    Outcome_ID INT PRIMARY KEY,
    Outcome_Description VARCHAR(100),
    Outcome_Details TEXT,
    Date_Added DATE,
    Date_Updated DATE
);

--  Malaria Cases Table
CREATE TABLE malaria_cases (
    Case_ID INT PRIMARY KEY,
    Patient_ID INT,
    Facility_ID INT,
    Date_of_Diagnosis DATE,
    Type_of_Malaria VARCHAR(50),
    Treatment_ID INT,
    Outcome_ID INT,
    FOREIGN KEY (Patient_ID) REFERENCES patient_data(Patient_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Facility_ID) REFERENCES health_facility(Facility_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Treatment_ID) REFERENCES treatment(Treatment_ID) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (Outcome_ID) REFERENCES treatment_outcome(Outcome_ID) ON DELETE SET NULL ON UPDATE CASCADE
);

-- Sample Data

INSERT INTO geographical_location (Location_ID, Village, Parish, Sub_County, County, Region, Population, Coordinates, Malaria_Risk_Level, Health_Facilities_Count, ITN_Coverage, Reported_Cases)
VALUES (1, 'Village A', 'Parish A', 'Sub County A', 'County A', 'Region A', 5000, '00.0000, 00.0000', 'High', 2, 85.5, 120);

INSERT INTO patient_data (Patient_ID, First_Name, Last_Name, Date_of_Birth, Phone_Number, Next_of_Kin, Address, Date_Added, Update_Date)
VALUES (1, 'Mwesigwa', 'Gilbert', '2004-02-08', '0744987221', 'Mwesigwa Agasi', '123 Main St', '2025-01-01', '2025-01-02');

INSERT INTO health_facility (Facility_ID, Facility_Name, Location_ID, Facility_Type_ID, Capacity, Contact_Details, Date_Added, Date_Updated)
VALUES (1, 'Hospital A', 1, 1, 100, 'victoria@hospital.com', '2025-01-01', '2025-01-02');

INSERT INTO treatment (Treatment_ID, Treatment_Name, Treatment_Description, Cost, Date_Added, Date_Updated)
VALUES (1, 'Artemisinin-Based Therapy', 'Treatment for malaria', 50.00, '2025-01-01', '2025-01-02');

INSERT INTO treatment_outcome (Outcome_ID, Outcome_Description, Outcome_Details, Date_Added, Date_Updated)
VALUES (1, 'Recovered', 'Patient fully recovered', '2025-01-01', '2025-01-02');

INSERT INTO malaria_cases (Case_ID, Patient_ID, Facility_ID, Date_of_Diagnosis, Type_of_Malaria, Treatment_ID, Outcome_ID)
VALUES (1, 1, 1, '2025-01-01', 'Plasmodium Falciparum', 1, 1);

