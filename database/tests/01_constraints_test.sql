-- USE THE DB ALREADY CREATED
USE nutritional_clinic;
GO

-- CONSTRAINT TESTS

-- 1. VALID PATIENT (SUCCEEDS)
INSERT INTO Patient(name, lastName, dateOfBirth, gender, phone, email)
VALUES ('Juan','Leon', '1999-12-20', 'M', '+51946794469', 'jdleon199@gmail.com');

-- 2. INVALID PATIENT (FAILS due to duplicate email)
INSERT INTO Patient(name, lastName, dateOfBirth, gender, phone, email)
VALUES ('Sarah','Connor','1998-10-18', 'F', '+51777999666', 'jdleon199@gmail.com');

--3. INVALID PATIENT (FAILS due to invalid gender)
INSERT INTO Patient(name, lastName, dateOfBirth, gender, phone, email)
VALUES ('Michael','Jackson','1967-08-29', 'X', '+51123456789', 'michalej@email.com');

--4. VALID NUTRITIONIST (SUCCEEDS)
INSERT INTO Nutritionist(name, lastName, licenseNumber, phone, email)
VALUES ('Karla','Morales','010NY123456','+51987654321', 'k.mora@email.com');

--5. VALID APPOINTMENT (SUCCEEDS)
INSERT INTO Appointment(patientID, nutritionistID, appointmentDate, reason, status)
VALUES (1,1,GETDATE(), 'Scheduling appointment to reduce weight gains', 'Scheduled');

--6. VALID PAYMENT (SUCCEEDS)
INSERT INTO Payment(appointmentID, amount, payDate, payMethod)
VALUES (1, 150.50, GETDATE(), 'Credit Card');

--7. INVALID PAYMENT (FAILS due to non-existing appointmentID)
INSERT INTO Payment(appointmentID, amount, payDate, payMethod)
VALUES (10, 120.00, GETDATE(), 'Cash');