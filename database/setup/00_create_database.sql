-- DATABASE CREATION SCRIPT FOR DEMO/TESTING PURPOSES

IF NOT EXISTS (
    SELECT name
    FROM sys.databases
    WHERE name ='nutrition_clinic'
)
BEGIN
    CREATE DATABASE nutrition_clinic;
END
GO

USE nutrition_clinic;
GO