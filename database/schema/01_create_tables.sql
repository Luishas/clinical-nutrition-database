-- USE THE DB ALREADY CREATED
USE nutritional_clinic;
GO

-- TABLE: Patient

CREATE TABLE Patient (
    patientID INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(50) NOT NULL,
    lastName NVARCHAR(50) NOT NULL,
    dateOfBirth DATE NOT NULL,
    gender CHAR(1) CHECK (genger IN ('M', 'F')),
    phone NVARCHAR(20),
    email NVARCHAR(100) UNIQUE
);

-- TABLE: Nutritionist 

CREATE TABLE Nutritionist (
    nutritionistID INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(50) NOT NULL,
    lastName NVARCHAR(50) NOT NULL,
    licenseNumber NVARCHAR(30) NOT NULL UNIQUE,
    phone NVARCHAR(20),
    email NVARCHAR(100) UNIQUE
);

-- TABLE: Appointment

CREATE TABLE Appointment (
    appointmentID INT IDENTITY (1,1) PRIMARY KEY,
    patientID INT NOT NULL,
    nutritionistID INT NOT NULL,
    appointmentDate DATETIME NOT NULL,
    reason NVARCHAR(200),
    status NVARCHAR(20) CHECK (status IN('Scheduled','Completed','Cancelled')),

    CONSTRAINT FK_Appointment_Patient
        FOREIGN KEY (patientID) REFERENCES Patient(patientID),
    
    CONSTRAINT FK_Appointment_Nutritionist
        FOREIGN KEY (nutritionistID) REFERENCES Nutritionist(nutritionistID)
);

-- TABLE: NutritionPlan 

CREATE TABLE NutriPlan (
    planID INT IDENTITY(1,1) PRIMARY KEY,
    patientID INT NOT NULL,
    nutritionistID INT NOT NULL,
    startDate DATE NOT NULL,
    endDate DATE,
    goal NVARCHAR(200),

    CONSTRAINT FK_NutriPlan_Patient
        FOREIGN KEY (patientID) REFERENCES Patient(patientID),
    
    CONSTRAINT FK_NutriPlan_Nutritionist
        FOREIGN KEY (nutritionistID) REFERENCES Nutritionist(nutritionistID)        
);

-- TABLE: Payment

CREATE TABLE Payment(
    paymentID INT IDENTITY(1,1) PRIMARY KEY,
    appointmentID INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payDate DATETIME NOT NULL,
    payMethod NVARCHAR(50) NOT NULL,
    status NVARCHAR(20) NOT NULL,

    CONSTRAINT FK_Payment_Appointment
        FOREIGN KEY (appointmentID) REFERENCES Appointment(appointmentID)
);