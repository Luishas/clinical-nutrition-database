-- USE DB ALREADY CREATED
USE nutritional_clinic;
GO

-- BUSINESS QUERIES TESTS

-- MONTHLY REVENUE
SELECT 
    YEAR(payDate) AS YEAR,
    MONTH(payDate) AS MONTH,
    SUM(amount) AS totalRevenue
FROM Payment
WHERE status = 'Paid'
GROUP BY YEAR(payDate), MONTH(payDate)
ORDER BY YEAR, MONTH;

-- PENDING PAYMENTS
SELECT
    paymentID,
    appointmentID,
    amount,
    payMethod,
    payDate,
FROM Payment
WHERE status = 'Pending';

-- PATIENTS WITH MULTIPLE APPOINTMENTS
SELECT
    p.name,
    p.lastName,
    COUNT(a.appointmentID) AS totalAppointments
FROM Patient p
JOIN Appointment a ON p.patientID = a.patientID
GROUP BY p.name, p.lastName
ORDER BY totalAppointments DESC;

-- MOST ACTIVE NUTRITIONISTS
SELECT
    n.name,
    n.lastName,
    COUNT(a.appointmentID) AS totalAppointments
FROM Nutritionist n
JOIN Appointment a ON n.nutritionistID = a.nutritionistID
GROUP BY n.name, n.lastName
ORDER BY totalAppointments DESC;

-- CLINIC FUTURE AGENDA 
SELECT
    a.appointmentDate,
    p.name AS Patient,
    n.name AS Nutritionist,
    a.status
FROM Appointment a
JOIN Patient p ON a.patientID = p.patientID
JOIN Nutritionist n ON a.nutritionistID = n.nutritionistID
WHERE a.appointmentDate >= GETDATE()