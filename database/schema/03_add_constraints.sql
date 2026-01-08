-- USE THE DB ALREADY CREATED
USE nutritional_clinic;
GO

-- BUSINESS CONSTRAINTS

ALTER TABLE Payment
ADD CONSTRAINT CK_Payment_Amount
CHECK (amount > 0);

ALTER TABLE Payment
ADD CONSTRAINT CK_Payment_Method
CHECK (payMethod IN ('Cash','Credit Card','Transfer'));

ALTER TABLE Payment
ADD CONSTRAINT CK_Payment_Status
CHECK (status IN ('Pending','Completed','Failed'));

ALTER TABLE Payment
ADD CONSTRAINT DF_Payment_PayDate
DEFAULT GETDATE() FOR payDate;

-- DEFAULT VALUES

ALTER TABLE Appointment
ADD CONSTRAINT DF_Appointment_appointmentDate
DEFAULT GETDATE() FOR appointmentDate;

ALTER TABLE Payment
ADD CONSTRAINT DF_Payment_payDate
DEFAULT GETDATE() FOR payDate;