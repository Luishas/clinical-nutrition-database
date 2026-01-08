-- DATABASE CREATION SCRIPT FOR DEMO PURPOSES

IF NOT EXISTS (
    SELECT name
    FROM sys.databases
    WHERE name ='nutritional_clinic'
)
BEGIN
    CREATE DATABASE nutritional_clinic;
END
GO

USE nutritional_clinic;
GO