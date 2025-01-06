
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

CREATE TABLE health_facility (
    Facility_ID INT PRIMARY KEY,
    Facility_Name VARCHAR(100),
    Location_ID INT,
    Facility_Type_ID INT,
    Capacity INT,
    Contact_Details VARCHAR(100),
    Date_Added DATE,
    Date_Updated DATE,
    FOREIGN KEY (Location_ID) REFERENCES geographical_location(Location_ID)
);

CREATE TABLE resource (
    Resource_ID INT PRIMARY KEY,
    Facility_ID INT,
    Resource_Name VARCHAR(50),
    Quantity INT,
    Date_Added DATE,
    Update_Date DATE,
    FOREIGN KEY (Facility_ID) REFERENCES health_facility(Facility_ID)
);

CREATE TABLE supply_chain (
    Supply_ID INT PRIMARY KEY,
    Resource_ID INT,
    Facility_ID INT,
    County_Shipped VARCHAR(50),
    Shipment_Date DATE,
    Expected_Arrival_Date DATE,
    Shipped_By INT,
    Status VARCHAR(50),
    Update_Date DATE,
    FOREIGN KEY (Resource_ID) REFERENCES resource(Resource_ID),
    FOREIGN KEY (Facility_ID) REFERENCES health_facility(Facility_ID)
);

CREATE TABLE malaria_cases (
    Case_ID INT PRIMARY KEY,
    Patient_ID INT,
    Facility_ID INT,
    Date_of_Diagnosis DATE,
    Type_of_Malaria VARCHAR(50),
    Treatment_ID INT,
    Outcome_ID INT,
    FOREIGN KEY (Patient_ID) REFERENCES patient_data(Patient_ID),
    FOREIGN KEY (Facility_ID) REFERENCES health_facility(Facility_ID),
    FOREIGN KEY (Treatment_ID) REFERENCES treatment(Treatment_ID),
    FOREIGN KEY (Outcome_ID) REFERENCES treatment_outcome(Outcome_ID)
);

CREATE TABLE treatment (
    Treatment_ID INT PRIMARY KEY,
    Treatment_Name VARCHAR(50),
    Description TEXT,
    Dosage VARCHAR(50),
    Side_Effects TEXT,
    Date_Added DATE,
    Update_Date DATE
);

CREATE TABLE treatment_outcome (
    Outcome_ID INT PRIMARY KEY,
    Outcome_Name VARCHAR(50),
    Outcome_Description TEXT,
    Date_Added DATE,
    Update_Date DATE
);

CREATE TABLE user_role (
    Role_ID INT PRIMARY KEY,
    Role_Name VARCHAR(50),
    Role_Description TEXT,
    Date_Added DATE,
    Update_Date DATE
);

CREATE TABLE user (
    User_ID INT PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Role_ID INT,
    Username VARCHAR(50),
    Password VARCHAR(100),
    Added_By INT,
    Update_Date DATE,
    FOREIGN KEY (Role_ID) REFERENCES user_role(Role_ID)
);

CREATE TABLE visit_record (
    Visit_ID INT PRIMARY KEY,
    Patient_ID INT,
    Facility_ID INT,
    Visit_Date DATE,
    Test_ID INT,
    FOREIGN KEY (Patient_ID) REFERENCES patient_data(Patient_ID),
    FOREIGN KEY (Facility_ID) REFERENCES health_facility(Facility_ID),
    FOREIGN KEY (Test_ID) REFERENCES laboratory_tests(Test_ID)
);

CREATE TABLE laboratory_tests (
    Test_ID INT PRIMARY KEY,
    Case_ID INT,
    Test_Type VARCHAR(50),
    Test_Date DATE,
    Test_Result VARCHAR(50),
    Technician_ID INT,
    FOREIGN KEY (Case_ID) REFERENCES malaria_cases(Case_ID)
);

CREATE TABLE training (
    Training_ID INT PRIMARY KEY,
    User_ID INT,
    Training_Type VARCHAR(100),
    Training_Date DATE,
    Completion_Status VARCHAR(50),
    FOREIGN KEY (User_ID) REFERENCES user(User_ID)
);

CREATE TABLE system_log (
    Log_ID INT PRIMARY KEY,
    User_ID INT,
    Activity TEXT,
    Timestamp DATETIME,
    IP_Address VARCHAR(50),
    Location VARCHAR(100),
    FOREIGN KEY (User_ID) REFERENCES user(User_ID)
);
