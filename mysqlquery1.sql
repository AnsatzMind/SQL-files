
USE mysqldb
GO 
IF OBJECT_ID('tblDepartment','U') IS NULL
  BEGIN
CREATE TABLE tblDepartment (
    deptId VARCHAR(10) PRIMARY KEY,
    deptName VARCHAR(100),
    deptAddress VARCHAR(100)
);
  END
GO
IF OBJECT_ID('tblGrade','U') IS NULL
  BEGIN
CREATE TABLE tblGrade (
    empGrade CHAR(1) PRIMARY KEY,
    minSalary INT,
    maxSalary INT
);
  END
GO
IF OBJECT_ID('tblEmployee','U') IS NULL
  BEGIN
CREATE TABLE tblEmployee (
    empId VARCHAR(10) PRIMARY KEY,
    empPwd VARCHAR(10),
    empStatus VARCHAR(10),
    empName VARCHAR(100),
    empDOB DATE,
    empQualification VARCHAR(100),
    empEmail VARCHAR(100),
    empPhone VARCHAR(10),
    empDesignation VARCHAR(100),
    empSalary INT,
    empManager VARCHAR(10),
    deptId VARCHAR(10) FOREIGN KEY REFERENCES tblDepartment(deptId)
);
END
GO

INSERT INTO tblDepartment (deptId, deptName, deptAddress)
VALUES 
    ('D001', 'HR', '31 WillowVistaDr,Saginaw,Tx'),
    ('D002', 'Sales', '421 CedarValleyDr,Kingwood,Tx'),
    ('D003', 'Marketing', '67 LagoDr,Amarillo,Tx'),
    ('D004', 'Maintenance', '501 ForstCodeDr,WichitaFall,Tx'),
    ('D005', 'Finance', '400 WillowTrl,GrandPrairie,Tx'),
    ('D006', 'Training', '19 BellaireStreet,Denton,Tx'),
    ('D007', 'Purchase', '203 RenoLane,Spring,Tx');
GO


INSERT INTO tblGrade (empGrade, minSalary, maxSalary)
VALUES 
    ('A', 40001, 50000),
    ('B', 30001, 40000),
    ('C', 20001, 30000),
    ('D', 10001, 20000),
    ('E', 5000, 10000);
GO


INSERT INTO tblEmployee (empId, empPwd, empStatus, empName, empDOB, empEmail, empPhone, empQualification, empDesignation, empSalary, empManager, deptId)
VALUES 
    ('E0001', '1@Hr', 'Active', 'Alice', '1984-11-24', 'alice@gmail.com', '9129569949', 'MBA', 'Manager', 42500, NULL, 'D001'),
    ('E0002', '1@Sales', 'Active', 'Mathew', '1986-03-03', 'mathew@yahoo.com', '9129569939', 'MBA', 'Manager', 44000, NULL, 'D002'),
    ('E0003', '1@Market', 'Active', 'Smith', '1984-02-05', 'smith@rediff.com', '9129569929', 'MBA', 'Manager', 49000, NULL, 'D003'),
    ('E0004', '1@Finacne', 'Active', 'Ronald', '1980-09-08', 'ronald@gmail.com', '9129569979', 'MBA', 'Manager', 41000, NULL, 'D005'),
    ('E0005', '1@Training', 'Active', 'Maria', '1982-09-28', 'maria@rediff.com', '9129569965', 'MBA', 'Manager', 32000, NULL, 'D006'),
    ('E0006', '1@Purchase', 'Active', 'Brian', '1985-10-15', 'brian@yahoo.com', '9129569989', 'MBA', 'Manager', 36000, NULL, 'D007'),
    ('E0007', '2@Hr', 'Active', 'Bob', '1984-08-08', 'bob@gmail.com', '9631234578', 'MSc', 'Executive', 26000, 'E0001', 'D001'),
    ('E0008', '2@Sales', 'Active', 'William', '1986-05-03', 'william@yahoo.com', '7893214789', 'MA', 'Assistant', 28000, 'E0002', 'D002'),
    ('E0009', '2@Market', 'Active', 'Jones', '1980-10-12', 'jones@gmail.com', '9863245678', 'BSc', 'Assistant', 27000, 'E0003', 'D003'),
    ('E0010', '2@Finance', 'Active', 'Anthony', '1987-11-15', 'anthony@yahoo.com', '8874587842', 'MCom', 'Chief', NULL, NULL, NULL),
    ('E0011', '2@Training', 'Active', 'Melissa', '1982-01-18', 'melisssa@rediff.com', '7894544561', 'BCA', 'Trainer', 22000, 'E0005', 'D006'),
    ('E0012', '2@Purchase', 'Active', 'James', '1983-08-30', 'james@yahoo.com', '9631234789', 'MA', 'Executive', 29000, 'E0006', 'D007'),
    ('E0013', '3@Hr', 'Active', 'Charles', '1988-12-12', 'charles@yahoo.com', '9124567894', 'BCA', 'Administrator', 18000, 'E0001', 'D001'),
    ('E0014', '3@Sales', 'Active', 'Jacob', '1979-02-03', 'jacob@yahoo.com', '4569632789', 'BA', 'Coordinator', 9000, 'E0002', 'D002'),
    ('E0015', '3@Market', 'Active', 'Micheal', '1981-10-12', 'micheal@yahoo.com', '9316541789', 'BA', 'Coordinator', 9500, 'E0003', 'D003'),
    ('E0016', '3@Finance', 'Active', 'Jennifer', '1989-12-29', 'jennifer@yahoo.com', '8976579874', 'BCom', 'Jr.', NULL, NULL, NULL),
    ('E0017', '3@Training', 'Active', 'Susan', '1978-03-24', 'susan@yahoo.com', '7631234598', 'BTech', 'Trainer', 18000, 'E0005', 'D006'),
    ('E0018', '3@Purchase', 'Active', 'Mark', '1983-05-12', 'mark@gmail.com', '7419632789', 'BA', 'Coordinator', 10000, 'E0006', 'D007'),
    ('E0019', '4@Hr', 'Active', 'Daniel', '1986-07-09', 'danieln@yahoo.com', '4561247965', 'BSc', 'Coordinator', 7000, 'E0001', 'D001'),
    ('E0020', '4@Sales', 'Active', 'Sophia', '1983-09-21', 'sophia@yahoo.com', '8517864789', 'BA', 'Coordinator', 8000, 'E0002', 'D002'),
    ('E0021', '4@Market', 'Active', 'Joseph', '1988-01-17', 'joseph@yahoo.com', '6914973218', 'BSc', 'Coordinator', 8000, 'E0003', 'D003'),
    ('E0022', '4@Finance', 'Active', 'Eric', '1986-04-10', 'eric@yahoo.com', '9873567895', 'BA', 'Cashier', 11000, 'E0004', 'D005'),
    ('E0023', '4@Purchase', 'Active', 'Paul', '1990-10-10', 'paul@gmail.com', '6543219854', 'BCA', 'Coordinator', 9000, 'E0006', 'D007'),
    ('E0024', '5@Hr', 'Active', 'Jackson', '1986-10-18', 'jackson@gmail.com', '9314562131', 'BCA', 'Coordinator', 7000, 'E0001', 'D001'),
    ('E0025', '5@Sales', 'Active', 'Lily', '1988-12-15', 'lily@gmail.com', '9124567874', 'BA', 'Coordinator', 8000, 'E0002', 'D002'),
    ('E0026', '5@Purchase', 'Active', 'Jim', '1986-12-15', 'jim@gmail.com', '9124784569', 'BA', 'Trainee', 6000, NULL, 'D007');
GO