-- SAMPLE DATA TO USE FOR THE DB

-- USE THE DB ALREADY CREATED
USE nutritional_clinic;
GO

-- INSERT PATIENTS
INSERT INTO Patient(name, lastName, dateOfBirth, gender, phone, email)
VALUES
('Jacques','Cousteau','1998-06-20','M', '+51932156578', 'jacquesC@email.com'),
('Ana', 'Lopez', '1995-03-14', 'F', '+51987654321', 'ana@email.com'),
('Carlos', 'Ramos', '1990-11-02', 'M', '+51912349876', 'carlos@email.com'),
('Maria', 'Gomez', '2000-01-25', 'F', '+51965432198', 'maria@email.com'),
('Luis', 'Fernandez', '1987-09-10', 'M', '+51911112222', 'luis@email.com');

-- INSERT NUTRITIONISTS
INSERT INTO Nutritionist(name, lastName, licenseNumber, phone, email)
VALUES
('Jessica','Alva','LIC123456','+519461234567', 'jessAlv@email.com'),
('Laura', 'Perez', 'LIC654321', '+51988887777', 'laura@clinic.com'),
('Miguel', 'Torres', 'LIC321987', '+51955554444', 'miguel@clinic.com');

-- INSERT APPOINTMENTS
INSERT INTO Appointment(patientID, nutritionistID, appointmentDate, reason, status)
VALUES
(1, 1, DATEADD(day, -10, GETDATE()), 'Initial evaluation', 'Completed'),
(2, 2, DATEADD(day, -5, GETDATE()), 'Weigh control', 'Completed'),
(3, 3, DATEADD(day, -3, GETDATE()), 'Diet follow-up', 'Completed'),
(4, 1, GETDATE(), 'Nutrition plan', 'Scheduled'),
(5, 2, DATEADD(day, 2, GETDATE()), 'Body composition', 'Scheduled');

-- INSERT NUTRITION PLANS
INSERT INTO NutriPlan(patientID, nutritionistID, startDate, endDate, goal)
VALUES
(1, 1, GETDATE(), DATEADD(day, 90, GETDATE()), 'Improve eating habits'),
(2, 2, GETDATE(), DATEADD(day, 60, GETDATE()), 'Lose 5kg'),
(3, 3, GETDATE(), DATEADD(day, 45, GETDATE()), 'Reduce body fat'),
(4, 1, GETDATE(), DATEADD(day, 30, GETDATE()), 'Control cholesterol'),
(5, 2, GETDATE(), DATEADD(day, 120, GETDATE()), 'Increase muscle mass');
-- INSERT PAYMENTS
INSERT INTO Payment(appointmentID, amount, payDate, payMethod, status)
VALUES
(1, 160.00, GETDATE(), 'Credit Card','Paid'),
(2, 100.00, GETDATE(), 'Cash','Paid'),
(3, 150.00, GETDATE(), 'Transfer','Paid'),
(4, 130.00, GETDATE(), 'Card','Pending'),
(5, 110.00, GETDATE(), 'Cash','Pending');