--1
CREATE OR REPLACE TRIGGER SetDefaultDeliveryStatus
BEFORE INSERT ON Packages
REFERENCING NEW AS NEW
FOR EACH ROW
BEGIN ATOMIC
    IF NEW.DELIVERY_STAT IS NULL OR NEW.DELIVERY_STAT = '' THEN
        SET NEW.DELIVERY_STAT = 'In Transit';
    END IF;
END;


--2
CREATE TRIGGER IncreaseEmployeeCount
AFTER INSERT ON DeliveryWorkers
REFERENCING NEW AS NEW
FOR EACH ROW
BEGIN ATOMIC
    UPDATE Offices
    SET EMPLOYEES_CNT = EMPLOYEES_CNT + 1
    WHERE OFFICE_NUMBER = NEW.OFFICE_NUMBER;
END;

--3
CREATE TRIGGER DecreaseEmployeeCount
AFTER DELETE ON DeliveryWorkers
REFERENCING OLD AS OLD
FOR EACH ROW
BEGIN ATOMIC
    UPDATE Offices
    SET EMPLOYEES_CNT = EMPLOYEES_CNT - 1
    WHERE OFFICE_NUMBER = OLD.OFFICE_NUMBER;
END;


