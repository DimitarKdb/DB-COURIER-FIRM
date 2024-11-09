-- Insert data into Customers table
INSERT INTO Customers (UCN, ADDRESS, PHONE_NUMBER, FIRST_NAME, LAST_NAME)
VALUES
('1234567890', '123 Main St', '123-456-7890', 'John', 'Doe'),
('0987654321', '456 Elm St', '098-765-4321', 'Jane', 'Smith'),
('1122334455', '789 Oak St', '112-233-4455', 'Mike', 'Johnson'),
('2233445566', '101 Maple St', '223-344-5566', 'Sara', 'Williams'),
('3344556677', '202 Birch St', '334-455-6677', 'Paul', 'Brown'),
('4455667788', '303 Pine St', '445-566-7788', 'Emily', 'Davis'),
('5566778899', '404 Cedar St', '556-677-8899', 'David', 'Miller'),
('6677889900', '505 Spruce St', '667-788-9900', 'Emma', 'Wilson'),
('7788990011', '606 Fir St', '778-899-0011', 'James', 'Taylor'),
('8899001122', '707 Chestnut St', '889-900-1122', 'Olivia', 'Anderson');

-- Insert data into Offices table
INSERT INTO Offices (ADDRESS, EMPLOYEES_CNT, CITY_LOCATION, OFFICE_NUMBER, OFFICE_RATING)
VALUES
('789 Pine St', 50, 'New York', 'OF001', 5),
('321 Oak St', 30, 'Los Angeles', 'OF002', 4),
('456 Cedar St', 40, 'Chicago', 'OF003', 4),
('678 Spruce St', 20, 'Houston', 'OF004', 3),
('123 Fir St', 25, 'Phoenix', 'OF005', 3),
('789 Maple St', 35, 'Philadelphia', 'OF006', 5),
('987 Birch St', 15, 'San Antonio', 'OF007', 4),
('654 Elm St', 10, 'San Diego', 'OF008', 3),
('321 Chestnut St', 45, 'Dallas', 'OF009', 5),
('987 Oak St', 60, 'San Jose', 'OF010', 4);

-- Insert data into DeliveryWorkers table
INSERT INTO DeliveryWorkers (WORKER_ID, YEARS_EXP, FIRST_NAME, SERVICE_RATING, SALARY, OFFICE_NUMBER)
VALUES
('DW001', 5, 'Alice', 4, 50000, 'OF001'),
('DW002', 3, 'Bob', 3, 40000, 'OF002'),
('DW003', 4, 'Charlie', 5, 45000, 'OF003'),
('DW004', 2, 'Diana', 4, 38000, 'OF004'),
('DW005', 6, 'Ethan', 5, 52000, 'OF005'),
('DW006', 1, 'Fiona', 3, 36000, 'OF006'),
('DW007', 7, 'George', 5, 55000, 'OF007'),
('DW008', 2, 'Hannah', 4, 37000, 'OF008'),
('DW009', 4, 'Ian', 5, 48000, 'OF009'),
('DW010', 3, 'Jill', 4, 41000, 'OF010');

-- Insert data into Course table
INSERT INTO Course (COURSE_ID, COURSE_STATUS, STARTED_FROM, ENDED_AT, COURSE_WEIGHT, START_DATE, END_DATE, WORKER_ID)
VALUES
(1, 'Completed', 'New York', 'Boston', 100, '2024-01-01', '2024-01-02', 'DW001'),
(2, 'In Progress', 'Los Angeles', 'San Francisco', 200, '2024-02-01', '2024-02-03', 'DW002'),
(3, 'Completed', 'Chicago', 'Detroit', 150, '2024-03-01', '2024-03-02', 'DW003'),
(4, 'Pending', 'Houston', 'Austin', 180, '2024-04-01', '2024-04-03', 'DW004'),
(5, 'Completed', 'Phoenix', 'Tucson', 120, '2024-05-01', '2024-05-02', 'DW005'),
(6, 'In Progress', 'Philadelphia', 'Pittsburgh', 110, '2024-06-01', '2024-06-02', 'DW006'),
(7, 'Pending', 'San Antonio', 'Dallas', 190, '2024-07-01', '2024-07-03', 'DW007'),
(8, 'Completed', 'San Diego', 'Los Angeles', 130, '2024-08-01', '2024-08-02', 'DW008'),
(9, 'In Progress', 'Dallas', 'Houston', 140, '2024-09-01', '2024-09-03', 'DW009'),
(10, 'Pending', 'San Jose', 'San Francisco', 170, '2024-10-01', '2024-10-03', 'DW010');

-- Insert data into Packages table
INSERT INTO Packages (PACKAGE_ID, DELIVERY_ADDR, ESTIMATED_DELIVERY, DELIVERY_STAT, DELIVERY_FEE, COURSE_ID, WORKER_ID, OFFICE_NUMBER, DATE_COLLECTED, DATE_SENT, RECEIVER_UCN, SENDER_UCN)
VALUES
('PK001', '789 Maple St', 2, 'Delivered', 25, 1, 'DW001', 'OF001', '2024-01-02', '2024-01-01', '1234567890', '0987654321'),
('PK002', '123 Birch St', 3, 'Pending', 30, 2, 'DW002', 'OF002', '2024-02-03', '2024-02-01', '0987654321', '1234567890'),
('PK003', '456 Cedar St', 4, 'Delivered', 28, 3, 'DW003', 'OF003', '2024-03-02', '2024-03-01', '1122334455', '2233445566'),
('PK004', '789 Spruce St', 5, 'Pending', 32, 4, 'DW004', 'OF004', '2024-04-03', '2024-04-01', '2233445566', '3344556677'),
('PK005', '123 Fir St', 2, 'Delivered', 27, 5, 'DW005', 'OF005', '2024-05-02', '2024-05-01', '3344556677', '4455667788'),
('PK006', '789 Maple St', 3, 'Pending', 29, 6, 'DW006', 'OF006', '2024-06-02', '2024-06-01', '4455667788', '5566778899'),
('PK007', '987 Birch St', 4, 'Delivered', 26, 7, 'DW007', 'OF007', '2024-07-03', '2024-07-01', '5566778899', '6677889900'),
('PK008', '654 Elm St', 5, 'Pending', 31, 8, 'DW008', 'OF008', '2024-08-02', '2024-08-01', '6677889900', '7788990011'),
('PK009', '321 Chestnut St', 2, 'Delivered', 24, 9, 'DW009', 'OF009', '2024-09-03', '2024-09-01', '7788990011', '8899001122'),
('PK010', '987 Oak St', 3, 'Pending', 33, 10, 'DW010', 'OF010', '2024-10-03', '2024-10-01', '8899001122', '1234567890');
