-- Table: Patient

CREATE TABLE Patient (
    patientID INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(50) NOT NULL,
    lastName NVARCHAR(50) NOT NULL,
    dateOfBirth DATE NOT NULL,
    gender CHAR(1) CHECK (genger IN ('M', 'F')),
    phone NVARCHAR(20),
    email NVARCHAR(100) UNIQUE
);

-- Table: Nutritionist 

CREATE TABLE Nutritionist (
    nutritionistID INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(50) NOT NULL,
    lastName NVARCHAR(50) NOT NULL,
    licenseNumber NVARCHAR(30) NOT NULL UNIQUE,
    phone NVARCHAR(20),
    email NVARCHAR(100) UNIQUE
);