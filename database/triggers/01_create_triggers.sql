-- USE DB ALREADY CREATED IN SETUP
USE nutrition_clinic;
GO

-- TRIGGERS FOR NUTRITION CLINIC DB

-- TRIGGER FOR COMPLETED PAYMENT TO UPDATE APPOINTMENT STATUS
CREATE TRIGGER trg_payment_completed_Appointment
ON Payment
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE a
    SET a.status = 'Completed'
    FROM Appointment a 
    JOIN inserted i ON a.appointmentID = i.appointmentID
    WHERE i.status = 'Completed';
END;
GO

-- TRIGGER TO PREVENT DUPLICATED 'COMPLETED' PAYMENTS 
CREATE TRIGGER trg_prevent_duplicate_completed_payment
ON Payment
AFTER INSERT, UPDATE
AS 
BEGIN 
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM inserted i
        WHERE i.status = 'Completed'
    )
    BEGIN
        IF EXISTS(
            SELECT 1
            FROM Payment p
            JOIN inserted i 
                ON p.appointmentID = i.appointmentID
            WHERE p.status = 'Completed'
              AND p.paymentID <> i.paymentID
        )
        BEGIN 
            RAISERROR ('Only one completed payment is allowed per appointment.', 16, 1);
            ROLLBACK TRANSACTION;
        END
    END
END;
GO

-- TRIGGER TO AVOID WRONG DATES ON APPOINTMENTS
CREATE TRIGGER trg_appointment_noPastDates
ON Appointment
AFTER INSERT
AS 
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM inserted i
        WHERE appointmentDate < CAST(GETDATE() AS DATE)
    )
    BEGIN 
        RAISERROR ('Appointment date cannot be in the past.',16,1);
        ROLLBACK TRANSACTION;
    END
END;
GO

-- TRIGGER TO LOG CHANGES IN PAYMENTS
CREATE TRIGGER trg_audit_log_paymets
ON Payment
AFTER INSERT, UPDATE
AS 
BEGIN
    SET NOCOUNT ON;

    -- INSERT
    INSERT INTO AuditLog (tableName, recordID, action, oldData, newData)
    SELECT 
        'Payment',
        i.paymentID,
        'INSERT',
        NULL,
        CONCAT(
            'amount=', i.amount,
            ',status=', i.status,
            ',method=', i.payMethod
        )
    FROM inserted i 
    LEFT JOIN deleted d ON i.paymentID = d.paymentID
    WHERE d.paymentID IS NULL;

    --UPDATE 
    INSERT INTO AuditLog (tableName, recordID, action, oldData, newData)
    SELECT
        'Payment',
        i.paymentID,
        'UPDATE',
        CONCAT(
            'amount=', d.amount,
            ',status=', d.status,
            ',method=', d.payMethod
        ),
        CONCAT(
            'amount=', i.amount,
            ',status=', i.status,
            ',method=', i.payMethod
        )
    FROM inserted i
    JOIN deleted d ON i.paymentID = d.paymentID;
END;
GO

-- TRIGGER TO LOG CHANGES IN APPOINTMENTS
CREATE TRIGGER trg_audit_log_appointments
ON Appointment
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    --INSERT
    INSERT INTO AuditLog (tableName, recordID, action, changedBy, oldData, newData)
    SELECT
        'Appointment',
        i.appointmentID,
        'INSERT',
        NULL,
        NULL,
        CONCAT(
            'date=', i.appointmentDate,
            ',status=', i.status,
            ',reason=', i.reason
        )
    FROM inserted i
    LEFT JOIN deleted d ON i.appointmentID = d.appointmentID
    WHERE d.appointmentID IS NULL;

    --DELETE
    INSERT INTO AuditLog (tableName, recordID, action, changedBy, oldData, newData)
    SELECT
        'Appointment',
        d.appointmentID,
        'DELETE',
        NULL,
        CONCAT(
            'date=', d.appointmentDate,
            ',status=', d.status,
            ',reason=', d.reason
        ),
        NULL
    FROM deleted d
    LEFT JOIN inserted i ON i.appointmentID = d.appointmentID
    WHERE i.appointmentID IS NULL;

    --UPDATE
    INSERT INTO AuditLog (tableName, recordID, action, changedBy, oldData, newData)
    SELECT
    'Appointment',
    d.appointmentID,
    'UPDATE',
    NULL,
    CONCAT('date=', d.appointmentDate,',status=', d.status,',reason=', d.reason),
    CONCAT('date=', i.appointmentDate,',status=', i.status,',reason=', i.reason)
    FROM inserted i
    JOIN deleted d ON i.appointmentID = d.appointmentID;
END;
GO