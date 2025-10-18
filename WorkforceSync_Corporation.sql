
DROP DATABASE IF EXISTS WorkforceSync_Corporation;
CREATE DATABASE WorkforceSync_Corporation;

USE WorkforceSync_Corporation;

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Gender ENUM('M', 'F') NOT NULL,
    DateOfBirth DATE NOT NULL,
    State VARCHAR(10)
);

CREATE TABLE Department (
    DepartmentCode INT PRIMARY KEY AUTO_INCREMENT,
    DepartmentName VARCHAR(100) NOT NULL,
    DepartmentType VARCHAR(50) NOT NULL
);

CREATE TABLE EmploymentType (
    EmploymentTypeCode INT PRIMARY KEY AUTO_INCREMENT,
    EmploymentTypeName VARCHAR(10) NOT NULL
);

CREATE TABLE Employment (
    EmploymentID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeID INT NOT NULL,
    HireDate DATE NOT NULL,
    Terminationdate DATE NULL,
    DepartmentCode INT NOT NULL,
    EmploymentTypeCode INT NOT NULL,
    FOREIGN KEY (EmployeeID)
        REFERENCES Employee (EmployeeID),
    FOREIGN KEY (DepartmentCode)
        REFERENCES Department (DepartmentCode),
    FOREIGN KEY (EmploymentTypeCode)
        REFERENCES EmploymentType (EmploymentTypeCode)
);

CREATE TABLE Salary (
    SalaryID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeID INT NOT NULL,
    SalaryAmount DECIMAL(10 , 2 ) NOT NULL,
    EffectiveDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    FOREIGN KEY (EmployeeID)
        REFERENCES Employee (EmployeeID)
);

CREATE TABLE Project (
    ProjectID INT PRIMARY KEY AUTO_INCREMENT,
    ProjectName VARCHAR(100),
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    DepartmentCode INT NOT NULL,
    FOREIGN KEY (DepartmentCode)
        REFERENCES Department (DepartmentCode)
);

CREATE TABLE ProjectAssignment (
    AssignmentID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeID INT NOT NULL,
    ProjectID INT NOT NULL,
    AssignmentStartDate DATE NOT NULL,
    AssignmentEndDate DATE NOT NULL,
    FOREIGN KEY (EmployeeID)
        REFERENCES Employee (EmployeeID),
    FOREIGN KEY (ProjectID)
        REFERENCES Project (ProjectID)
);

INSERT INTO Employee (FirstName, LastName, Gender, DateOfBirth, State)
VALUES
('Chinedu', 'Okafor', 'M', '1985-03-12', 'Anambra'),
('Ngozi', 'Okoye', 'F', '1986-07-13', 'Anambra'),
('Aisha', 'Bello', 'F', '1992-03-08', 'Kano'),
('Tunde', 'Olawale', 'M', '1990-07-25', 'Lagos'),
('Yakubu', 'Abdullahi', 'M', '1978-01-09', 'Kano'),
('Yetunde', 'Ogunleye', 'F', '1985-11-02', 'Lagos'),
('Bassey', 'Essien', 'M', '1983-06-18', 'Akwa Ibom'),
('Emeka', 'Nwosu', 'M', '1988-12-03', 'Enugu'),
('Segun', 'Adebayo', 'M', '1975-09-11', 'Ogun'),
('Hauwa', 'Abubakar', 'F', '1990-05-21', 'Kaduna'),
('Funke', 'Adeniran', 'F', '1979-09-19', 'Oyo'),
('Ifeanyi', 'Okeke', 'M', '1992-11-27', 'Imo'),
('Adanna', 'Ezeani', 'F', '1993-12-17', 'Enugu'),
('Bala', 'Mohammed', 'M', '1980-02-14', 'Bauchi'),
('Ruth', 'Udo', 'F', '1984-04-06', 'Akwa Ibom'),
('Adebayo', 'Adelaja', 'M', '1995-08-19', 'Oyo'),
('Oluchi', 'Okeke', 'F', '1991-06-15', 'Imo'),
('Usman', 'Bello', 'M', '1987-10-05', 'Kaduna'),
('Zainab', 'Aliyu', 'F', '1988-10-01', 'Sokoto'),
('Bisi', 'Adewale', 'F', '1983-02-11', 'Ogun'),
('Fatima', 'Ibrahim', 'F', '1987-08-25', 'Kano'),
('Femi', 'Akinyemi', 'M', '1976-04-23', 'Ekiti'),
('Ibrahim', 'Sule', 'M', '1991-07-17', 'Sokoto'),
('Oluwatoyin', 'Adeola', 'F', '1994-05-03', 'Ekiti'),
('Chukwuma', 'Eze', 'M', '1984-05-09', 'Ebonyi'),
('Amaka', 'Nwachukwu', 'F', '1981-01-29', 'Abia'),
('Musa', 'Yusuf', 'M', '1979-12-30', 'Niger'),
('Maryam', 'Yahaya', 'F', '1986-09-12', 'Kano'),
('Oluwaseun', 'Adeyemi', 'M', '1993-09-04', 'Ondo'),
('Sade', 'Bamigbade', 'F', '1990-12-05', 'Ondo'),
('Sunday', 'Okoro', 'M', '1982-08-16', 'Cross R.'),
('Efe', 'Okotie', 'F', '1992-07-08', 'Delta'),
('Omolola', 'Ajayi', 'F', '1984-03-19', 'Osun'),
('Olatunji', 'Fashola', 'M', '1989-03-27', 'Osun'),
('Ijeoma', 'Okoroafor', 'F', '1989-10-14', 'Ebonyi'),
('Ahmed', 'Garba', 'M', '1981-06-22', 'Gombe'),
('Aminat', 'Balogun', 'F', '1982-06-23', 'Lagos'),
('Kingsley', 'Onyeka', 'M', '1990-01-15', 'Delta'),
('Blessing', 'Etim', 'F', '1995-09-27', 'Cross R.'),
('Chigozie', 'Emeh', 'M', '1994-10-29', 'Abia'),
('Chisom', 'Umeh', 'F', '1987-02-05', 'Anambra'),
('Ayomide', 'Ojo', 'M', '1991-12-11', 'Oyo'),
('Kehinde', 'Adekunle', 'M', '1983-08-17', 'Ogun'),
('Suleiman', 'Usman', 'M', '1977-01-08', 'Kano'),
('Samuel', 'Ike', 'M', '1989-05-04', 'Imo'),
('Victoria', 'Ogunbiyi', 'F', '1994-11-18', 'Ekiti'),
('Patience', 'Okorie', 'F', '1985-06-07', 'Abia'),
('Umar', 'Danjuma', 'M', '1992-03-15', 'Borno'),
('Obinna', 'Nwankwo', 'M', '1988-09-21', 'Enugu'),
('Esther', 'Bamidele', 'F', '1993-12-28', 'Ondo'),
('Ishaya', 'Tanko', 'M', '1979-10-10', 'Plateau'),
('Modupe', 'Adebanjo', 'F', '1990-07-02', 'Ogun'),
('Okechukwu', 'Ibe', 'M', '1986-04-14', 'Imo'),
('Adebimpe', 'Owolabi', 'F', '1982-05-26', 'Osun'),
('Ibrahim', 'Maiyaki', 'M', '1978-08-31', 'Niger'),
('Anietie', 'Udoh', 'M', '1985-02-12', 'Akwa Ibom'),
('Chiamaka', 'Nnaji', 'F', '1991-01-06', 'Enugu'),
('Opeyemi', 'Adeoti', 'F', '1993-09-09', 'Ekiti'),
('Moses', 'Eboh', 'M', '1987-06-25', 'Delta'),
('Halima', 'Shuaibu', 'F', '1984-08-16', 'Kano'),
('Gbenga', 'Ogunlade', 'M', '1992-04-22', 'Oyo'),
('Juliet', 'Okon', 'F', '1995-11-03', 'Akwa Ibom'),
('Chuka', 'Onwuka', 'M', '1986-05-14', 'Abia'),
('Lilian', 'Oparah', 'F', '1990-03-18', 'Rivers'),
('Ibrahim', 'Lawal', 'M', '1977-12-21', 'Kwara'),
('Adebayo', 'Odetola', 'M', '1988-02-27', 'Lagos'),
('Janet', 'Adeyinka', 'F', '1992-07-15', 'Osun'),
('Oluwafemi', 'Ogunjobi', 'M', '1985-10-30', 'Ekiti'),
('Bilkisu', 'Ahmed', 'F', '1993-11-07', 'Kaduna'),
('Oluwadamilola', 'Fadeyi', 'F', '1989-06-12', 'Oyo'),
('Chinedum', 'Okorie', 'M', '1981-04-05', 'Enugu'),
('Mary', 'Akinsola', 'F', '1994-09-23', 'Ogun'),
('Isa', 'Abubakar', 'M', '1979-07-19', 'Kano'),
('Gladys', 'Umeh', 'F', '1987-01-13', 'Anambra'),
('Ayodele', 'Salami', 'M', '1991-08-09', 'Ondo'),
('Florence', 'Ezeh', 'F', '1985-02-28', 'Enugu'),
('Sani', 'Dogo', 'M', '1980-10-04', 'Borno'),
('Peace', 'Okonjo', 'F', '1993-05-06', 'Rivers'),
('Abubakar', 'Shehu', 'M', '1986-09-16', 'Sokoto'),
('Loveth', 'Akpan', 'F', '1988-11-25', 'Akwa Ibom'),
('Olamide', 'Ogunmola', 'M', '1990-03-11', 'Lagos'),
('Mariam', 'Onwudiwe', 'F', '1994-12-13', 'Imo'),
('Emmanuel', 'Philips', 'M', '1984-07-07', 'Rivers'),
('Chinyere', 'Okpala', 'F', '1989-05-19', 'Anambra'),
('Baba', 'Tijani', 'M', '1976-11-14', 'Kano'),
('Rebecca', 'Ojo', 'F', '1987-08-08', 'Oyo'),
('Philip', 'Etuk', 'M', '1982-01-22', 'Cross R.'),
('Aisha', 'Gusau', 'F', '1991-06-02', 'Zamfara'),
('Gabriel', 'Okoh', 'M', '1985-12-27', 'Delta'),
('Kemi', 'Adepoju', 'F', '1990-04-16', 'Osun'),
('Raphael', 'Ikechukwu', 'M', '1992-09-29', 'Enugu'),
('Ozioma', 'Ezeonu', 'F', '1984-02-10', 'Imo'),
('Bashir', 'Abdulkadir', 'M', '1979-06-18', 'Kaduna'),
('Sandra', 'Okafor', 'F', '1993-11-30', 'Anambra'),
('Akin', 'Oshodi', 'M', '1988-08-20', 'Lagos'),
('Jennifer', 'Iloh', 'F', '1994-01-03', 'Abia'),
('Simeon', 'Udo', 'M', '1983-10-15', 'Akwa Ibom'),
('Chidinma', 'Okorie', 'F', '1986-05-09', 'Enugu'),
('Hassan', 'Gambo', 'M', '1981-12-06', 'Gombe'),
('Prisca', 'Nwankwo', 'F', '1992-07-27', 'Imo');

INSERT INTO Department (DepartmentName, DepartmentType)
VALUES
('Human Resources', 'Administration'),
('Finance & Accounts', 'Administration'),
('Information Technology', 'Technical'),
('Network & Systems', 'Technical'),
('Operations', 'Operations'),
('Sales & Marketing', 'Commercial'),
('Customer Service', 'Commercial'),
('Logistics & Supply Chain', 'Operations'),
('Legal & Compliance', 'Specialized'),
('Research & Development', 'Specialized');

INSERT INTO EmploymentType (EmploymentTypeName)
VALUES
('Full-Time'),
('Part-Time'),
('Contract'),
('Intern');

INSERT INTO Employment (EmployeeID, HireDate, TerminationDate, DepartmentCode, EmploymentTypeCode)
VALUES
(1, '2010-04-12', '2018-06-15', 3, 1),
(2, '2015-07-19', NULL, 5, 1),
(3, '2012-03-09', '2017-08-20', 2, 2),
(4, '2019-09-01', NULL, 4, 1),
(5, '2014-01-22', '2019-04-17', 6, 3),
(6, '2021-11-12', NULL, 7, 1),
(7, '2022-02-17', NULL, 1, 4),
(8, '2013-08-23', '2020-02-28', 8, 2),
(9, '2016-12-02', NULL, 9, 1),
(10, '2017-06-09', '2022-11-05', 2, 1),
(11, '2018-03-15', NULL, 3, 1),
(12, '2011-05-21', '2016-07-18', 4, 2),
(13, '2020-10-05', NULL, 5, 1),
(14, '2014-09-14', '2020-01-09', 6, 1),
(15, '2015-11-07', NULL, 7, 3),
(16, '2013-01-29', '2018-03-15', 8, 1),
(17, '2022-06-11', NULL, 9, 4),
(18, '2017-07-04', NULL, 1, 1),
(19, '2019-05-26', NULL, 2, 2),
(20, '2012-02-08', '2017-05-14', 3, 1),
(21, '2014-04-16', '2020-06-25', 4, 1),
(22, '2018-12-09', NULL, 5, 1),
(23, '2016-08-02', '2021-09-30', 6, 2),
(24, '2010-07-18', '2015-11-22', 7, 3),
(25, '2019-02-27', NULL, 8, 1),
(26, '2020-01-12', NULL, 9, 1),
(27, '2011-06-15', '2016-09-19', 1, 2),
(28, '2014-05-28', '2019-08-13', 2, 1),
(29, '2023-03-03', NULL, 3, 1),
(30, '2012-09-07', '2018-01-04', 4, 1),
(31, '2015-10-19', NULL, 5, 1),
(32, '2021-12-14', NULL, 6, 1),
(33, '2013-04-09', '2019-07-21', 7, 3),
(34, '2022-09-01', NULL, 8, 1),
(35, '2011-08-30', '2017-10-16', 9, 2),
(36, '2018-05-18', NULL, 1, 1),
(37, '2010-11-05', '2015-02-27', 2, 1),
(38, '2016-06-12', NULL, 3, 1),
(39, '2013-07-22', '2018-12-11', 4, 2),
(40, '2020-02-15', NULL, 5, 1),
(41, '2012-12-03', '2018-05-28', 6, 1),
(42, '2019-08-25', NULL, 7, 3),
(43, '2014-10-09', '2019-12-19', 8, 1),
(44, '2021-05-20', NULL, 9, 1),
(45, '2010-06-27', '2015-09-14', 1, 2),
(46, '2013-03-18', '2018-08-08', 2, 1),
(47, '2018-09-06', NULL, 3, 1),
(48, '2016-04-23', '2021-07-11', 4, 2),
(49, '2014-02-10', '2019-05-15', 5, 1),
(50, '2020-08-29', NULL, 6, 1),
(51, '2011-09-25', '2016-12-07', 7, 3),
(52, '2017-01-13', NULL, 8, 1),
(53, '2015-06-05', '2020-09-28', 9, 1),
(54, '2012-01-19', '2017-04-30', 1, 2),
(55, '2013-09-14', NULL, 2, 1),
(56, '2018-11-03', NULL, 3, 1),
(57, '2016-10-27', '2021-01-18', 4, 1),
(58, '2022-08-17', NULL, 5, 4),
(59, '2010-05-08', '2014-08-12', 6, 1),
(60, '2019-04-15', NULL, 7, 1),
(61, '2011-12-11', '2016-03-09', 8, 2),
(62, '2014-06-30', '2019-10-04', 9, 1),
(63, '2020-07-07', NULL, 1, 1),
(64, '2013-11-16', '2018-02-22', 2, 3),
(65, '2017-05-29', NULL, 3, 1),
(66, '2015-01-25', '2020-03-11', 4, 1),
(67, '2012-04-14', '2017-07-09', 5, 2),
(68, '2018-06-22', NULL, 6, 1),
(69, '2010-09-19', '2015-01-06', 7, 1),
(70, '2016-03-02', NULL, 8, 1),
(71, '2014-08-11', '2019-12-28', 9, 3),
(72, '2011-01-17', '2016-05-24', 1, 2),
(73, '2015-09-03', NULL, 2, 1),
(74, '2022-04-28', NULL, 3, 4),
(75, '2013-05-20', '2018-08-29', 4, 1),
(76, '2017-12-15', NULL, 5, 1),
(77, '2012-08-04', '2017-10-31', 6, 2),
(78, '2019-01-22', NULL, 7, 1),
(79, '2010-10-26', '2014-12-19', 8, 1),
(80, '2016-07-06', NULL, 9, 1),
(81, '2011-04-01', '2016-06-11', 1, 3),
(82, '2018-02-08', NULL, 2, 1),
(83, '2014-11-25', '2019-03-05', 3, 1),
(84, '2013-02-14', '2018-06-27', 4, 2),
(85, '2015-12-09', NULL, 5, 1),
(86, '2020-05-14', NULL, 6, 1),
(87, '2012-07-23', '2017-09-02', 7, 3),
(88, '2019-09-30', NULL, 8, 1),
(89, '2010-08-18', '2015-10-08', 9, 1),
(90, '2016-01-05', NULL, 1, 1),
(91, '2011-10-12', '2016-12-20', 2, 2),
(92, '2014-03-26', '2019-07-15', 3, 1),
(93, '2017-08-09', NULL, 4, 1),
(94, '2013-12-21', '2018-04-18', 5, 2),
(95, '2018-10-02', NULL, 6, 1),
(96, '2015-02-17', '2020-05-22', 7, 1),
(97, '2012-06-08', '2017-08-14', 8, 1),
(98, '2019-07-25', NULL, 9, 1),
(99, '2011-03-04', '2016-06-10', 1, 3),
(100, '2014-01-18', '2019-04-23', 2, 1);


INSERT INTO Salary (EmployeeID, SalaryAmount, EffectiveDate, EndDate)
VALUES
(1, 350000.00, '2019-03-12', '2022-03-12'),
(2, 280000.00, '2020-07-01', '2023-07-01'),
(3, 180000.00, '2021-01-15', '2024-01-14'),
(4, 600000.00, '2018-05-22', '2021-05-22'),
(5, 280000.00, '2020-09-10', '2023-09-09'),
(6, 450000.00, '2019-02-05', '2022-02-04'),
(7, 300000.00, '2020-06-18', '2023-06-18'),
(8, 220000.00, '2021-11-01', '2024-11-01'),
(9, 400000.00, '2018-08-25', '2021-08-24'),
(10, 150000.00, '2022-04-07', '2025-04-06'),
(11, 500000.00, '2017-02-10', '2020-02-09'),
(12, 275000.00, '2020-08-15', '2023-08-14'),
(13, 320000.00, '2019-01-05', '2022-01-04'),
(14, 650000.00, '2018-10-20', '2021-10-19'),
(15, 295000.00, '2020-03-12', '2023-03-11'),
(16, 240000.00, '2021-09-23', '2024-09-22'),
(17, 380000.00, '2019-06-02', '2022-06-01'),
(18, 270000.00, '2020-11-11', '2023-11-10'),
(19, 550000.00, '2018-04-14', '2021-04-13'),
(20, 310000.00, '2020-12-05', '2023-12-04'),
(21, 260000.00, '2021-07-09', '2024-07-08'),
(22, 340000.00, '2019-05-15', '2022-05-14'),
(23, 420000.00, '2018-02-20', '2021-02-19'),
(24, 275000.00, '2020-08-02', '2023-08-01'),
(25, 300000.00, '2021-06-17', '2024-06-16'),
(26, 200000.00, '2022-01-29', '2025-01-28'),
(27, 370000.00, '2019-10-14', '2022-10-13'),
(28, 450000.00, '2017-12-12', '2020-12-11'),
(29, 330000.00, '2019-09-19', '2022-09-18'),
(30, 285000.00, '2020-05-06', '2023-05-05'),
(31, 240000.00, '2021-03-21', '2024-03-20'),
(32, 360000.00, '2018-07-18', '2021-07-17'),
(33, 410000.00, '2019-11-23', '2022-11-22'),
(34, 280000.00, '2020-02-14', '2023-02-13'),
(35, 295000.00, '2021-08-29', '2024-08-28'),
(36, 180000.00, '2022-06-03', '2025-06-02'),
(37, 370000.00, '2018-03-09', '2021-03-08'),
(38, 400000.00, '2019-04-25', '2022-04-24'),
(39, 350000.00, '2020-09-13', '2023-09-12'),
(40, 275000.00, '2021-12-07', '2024-12-06'),
(41, 500000.00, '2017-05-18', '2020-05-17'),
(42, 320000.00, '2019-08-26', '2022-08-25'),
(43, 270000.00, '2020-01-11', '2023-01-10'),
(44, 295000.00, '2021-04-30', '2024-04-29'),
(45, 600000.00, '2018-10-08', '2021-10-07'),
(46, 380000.00, '2019-07-16', '2022-07-15'),
(47, 220000.00, '2020-11-28', '2023-11-27'),
(48, 350000.00, '2021-02-22', '2024-02-21'),
(49, 275000.00, '2022-05-09', '2025-05-08'),
(50, 420000.00, '2018-06-14', '2021-06-13'),
(51, 330000.00, '2019-03-19', '2022-03-18'),
(52, 260000.00, '2020-12-01', '2023-11-30'),
(53, 295000.00, '2021-07-24', '2024-07-23'),
(54, 500000.00, '2017-09-04', '2020-09-03'),
(55, 280000.00, '2019-05-30', '2022-05-29'),
(56, 360000.00, '2020-08-17', '2023-08-16'),
(57, 310000.00, '2021-11-06', '2024-11-05'),
(58, 200000.00, '2022-02-27', '2025-02-26'),
(59, 400000.00, '2018-09-15', '2021-09-14'),
(60, 275000.00, '2019-12-21', '2022-12-20'),
(61, 350000.00, '2020-04-04', '2023-04-03'),
(62, 240000.00, '2021-06-19', '2024-06-18'),
(63, 380000.00, '2017-11-12', '2020-11-11'),
(64, 295000.00, '2019-02-07', '2022-02-06'),
(65, 280000.00, '2020-09-25', '2023-09-24'),
(66, 300000.00, '2021-05-13', '2024-05-12'),
(67, 500000.00, '2018-03-27', '2021-03-26'),
(68, 420000.00, '2019-10-09', '2022-10-08'),
(69, 270000.00, '2020-12-16', '2023-12-15'),
(70, 295000.00, '2021-08-01', '2024-07-31'),
(71, 600000.00, '2017-04-06', '2020-04-05'),
(72, 380000.00, '2019-07-21', '2022-07-20'),
(73, 240000.00, '2020-11-05', '2023-11-04'),
(74, 350000.00, '2021-02-18', '2024-02-17'),
(75, 275000.00, '2022-05-30', '2025-05-29'),
(76, 320000.00, '2018-06-25', '2021-06-24'),
(77, 260000.00, '2019-03-03', '2022-03-02'),
(78, 295000.00, '2020-12-10', '2023-12-09'),
(79, 500000.00, '2021-07-28', '2024-07-27'),
(80, 280000.00, '2017-09-14', '2020-09-13'),
(81, 360000.00, '2019-05-17', '2022-05-16'),
(82, 310000.00, '2020-08-23', '2023-08-22'),
(83, 200000.00, '2021-11-12', '2024-11-11'),
(84, 400000.00, '2018-09-06', '2021-09-05'),
(85, 275000.00, '2019-12-19', '2022-12-18'),
(86, 350000.00, '2020-04-02', '2023-04-01'),
(87, 240000.00, '2021-06-21', '2024-06-20'),
(88, 380000.00, '2017-11-10', '2020-11-09'),
(89, 295000.00, '2019-02-09', '2022-02-08'),
(90, 280000.00, '2020-09-28', '2023-09-27'),
(91, 300000.00, '2021-05-15', '2024-05-14'),
(92, 500000.00, '2018-03-25', '2021-03-24'),
(93, 420000.00, '2019-10-07', '2022-10-06'),
(94, 270000.00, '2020-12-18', '2023-12-17'),
(95, 295000.00, '2021-08-03', '2024-08-02'),
(96, 600000.00, '2017-04-08', '2020-04-07'),
(97, 380000.00, '2019-07-19', '2022-07-18'),
(98, 240000.00, '2020-11-07', '2023-11-06'),
(99, 350000.00, '2021-02-20', '2024-02-19'),
(100, 275000.00, '2022-05-28', '2025-05-27');

INSERT INTO Project (ProjectName, StartDate, EndDate, DepartmentCode)
VALUES
('Network Upgrade Initiative', '2023-02-01', '2023-05-15', 1),
('Cybersecurity Audit Phase 1', '2024-01-10', '2024-03-20', 1),
('Talent Acquisition Drive', '2023-07-01', '2023-08-15', 2),
('Employee Wellness Week', '2024-05-05', '2024-05-12', 2),
('Annual Financial Audit', '2022-11-01', '2023-01-20', 3),
('Budget Optimization Program', '2024-06-10', '2024-08-25', 3),
('Market Expansion Research', '2023-04-01', '2023-06-30', 4),
('Brand Repositioning Strategy', '2024-02-05', '2024-04-15', 4),
('Hospital Expansion Project', '2022-09-15', '2023-03-30', 5),
('Surgical Equipment Upgrade', '2024-07-01', '2024-09-10', 5),
('Staff Training Program', '2023-01-15', '2023-02-15', 6),
('Patient Care Quality Review', '2024-03-01', '2024-05-01', 6),
('IT Infrastructure Overhaul', '2023-08-01', '2023-10-30', 7),
('Mobile App Development', '2024-05-10', '2024-07-15', 7),
('New Product Launch - Coffee Blend', '2023-02-15', '2023-04-20', 8),
('Customer Loyalty Program', '2024-09-01', '2024-11-15', 8),
('Safety Compliance Upgrade', '2023-06-01', '2023-07-30', 9),
('Energy Efficiency Initiative', '2024-03-15', '2024-06-15', 9),
('Community Outreach Program', '2023-05-01', '2023-06-20', 10),
('Sustainability Awareness Campaign', '2024-08-01', '2024-09-30', 10);

INSERT INTO ProjectAssignment (EmployeeID, ProjectID, AssignmentStartDate, AssignmentEndDate)
VALUES
(1, 1, '2023-02-05', '2023-03-10'),
(2, 1, '2023-02-10', '2023-04-15'),
(3, 2, '2024-01-12', '2024-02-28'),
(4, 2, '2024-01-15', '2024-03-15'),
(5, 3, '2023-07-03', '2023-07-30'),
(6, 3, '2023-07-05', '2023-08-10'),
(7, 4, '2024-05-06', '2024-05-12'),
(8, 4, '2024-05-07', '2024-05-12'),
(9, 5, '2022-11-02', '2022-12-20'),
(10, 5, '2022-11-10', '2023-01-15'),
(11, 6, '2024-06-12', '2024-08-15'),
(12, 6, '2024-06-15', '2024-08-20'),
(13, 7, '2023-04-02', '2023-05-15'),
(14, 7, '2023-04-05', '2023-06-20'),
(15, 8, '2024-02-06', '2024-04-10'),
(16, 8, '2024-02-10', '2024-04-12'),
(17, 9, '2022-09-20', '2022-12-15'),
(18, 9, '2022-09-25', '2023-03-25'),
(19, 10, '2024-07-03', '2024-08-20'),
(20, 10, '2024-07-05', '2024-09-05'),
(21, 11, '2023-01-16', '2023-02-10'),
(22, 11, '2023-01-20', '2023-02-14'),
(23, 12, '2024-03-05', '2024-04-20'),
(24, 12, '2024-03-10', '2024-05-01'),
(25, 13, '2023-08-02', '2023-09-10'),
(26, 13, '2023-08-05', '2023-10-20'),
(27, 14, '2024-05-12', '2024-06-30'),
(28, 14, '2024-05-15', '2024-07-10'),
(29, 15, '2023-02-16', '2023-03-30'),
(30, 15, '2023-02-20', '2023-04-15'),
(31, 16, '2024-09-03', '2024-09-30'),
(32, 16, '2024-09-05', '2024-09-28'),
(33, 17, '2023-06-02', '2023-07-20'),
(34, 17, '2023-06-05', '2023-07-28'),
(35, 18, '2024-03-16', '2024-05-20'),
(36, 18, '2024-03-20', '2024-06-10'),
(37, 19, '2023-05-03', '2023-06-10'),
(38, 19, '2023-05-05', '2023-06-18'),
(39, 20, '2024-08-02', '2024-09-15'),
(40, 20, '2024-08-05', '2024-09-28'),
(41, 1, '2023-02-06', '2023-03-15'),
(42, 1, '2023-02-12', '2023-04-05'),
(43, 2, '2024-01-14', '2024-03-05'),
(44, 2, '2024-01-18', '2024-03-12'),
(45, 3, '2023-07-04', '2023-08-05'),
(46, 3, '2023-07-08', '2023-08-12'),
(47, 4, '2024-05-06', '2024-05-12'),
(48, 4, '2024-05-08', '2024-05-12'),
(49, 5, '2022-11-03', '2022-12-18'),
(50, 5, '2022-11-12', '2023-01-10'),
(51, 6, '2024-06-14', '2024-08-18'),
(52, 6, '2024-06-17', '2024-08-21'),
(53, 7, '2023-04-04', '2023-05-10'),
(54, 7, '2023-04-08', '2023-06-15'),
(55, 8, '2024-02-08', '2024-04-08'),
(56, 8, '2024-02-12', '2024-04-14'),
(57, 9, '2022-09-22', '2022-12-10'),
(58, 9, '2022-09-28', '2023-03-15'),
(59, 10, '2024-07-05', '2024-08-18'),
(60, 10, '2024-07-07', '2024-09-08'),
(61, 11, '2023-01-18', '2023-02-08'),
(62, 11, '2023-01-22', '2023-02-12'),
(63, 12, '2024-03-07', '2024-04-15'),
(64, 12, '2024-03-12', '2024-04-28'),
(65, 13, '2023-08-04', '2023-09-05'),
(66, 13, '2023-08-08', '2023-10-15'),
(67, 14, '2024-05-14', '2024-06-20'),
(68, 14, '2024-05-18', '2024-07-05'),
(69, 15, '2023-02-18', '2023-03-25'),
(70, 15, '2023-02-22', '2023-04-10'),
(71, 16, '2024-09-04', '2024-09-25'),
(72, 16, '2024-09-06', '2024-09-26'),
(73, 17, '2023-06-03', '2023-07-18'),
(74, 17, '2023-06-07', '2023-07-26'),
(75, 18, '2024-03-18', '2024-05-15'),
(76, 18, '2024-03-22', '2024-06-08'),
(77, 19, '2023-05-04', '2023-06-08'),
(78, 19, '2023-05-06', '2023-06-15'),
(79, 20, '2024-08-03', '2024-09-10'),
(80, 20, '2024-08-06', '2024-09-25'),
(81, 1, '2023-02-07', '2023-03-12'),
(82, 2, '2024-01-16', '2024-02-28'),
(83, 3, '2023-07-06', '2023-08-02'),
(84, 4, '2024-05-07', '2024-05-12'),
(85, 5, '2022-11-05', '2022-12-15'),
(86, 6, '2024-06-13', '2024-08-19'),
(87, 7, '2023-04-06', '2023-05-05'),
(88, 8, '2024-02-09', '2024-04-09'),
(89, 9, '2022-09-24', '2023-03-10'),
(90, 10, '2024-07-06', '2024-09-02'),
(91, 11, '2023-01-19', '2023-02-09'),
(92, 12, '2024-03-09', '2024-04-19'),
(93, 13, '2023-08-06', '2023-09-02'),
(94, 14, '2024-05-16', '2024-07-01'),
(95, 15, '2023-02-19', '2023-04-01'),
(96, 16, '2024-09-04', '2024-09-20'),
(97, 17, '2023-06-04', '2023-07-15'),
(98, 18, '2024-03-19', '2024-05-12'),
(99, 19, '2023-05-05', '2023-06-12'),
(100, 20, '2024-08-04', '2024-09-18');


-- List of all employees
SELECT *
FROM Employee;

-- Total number of employees
SELECT EmployeeID,
COUNT(*) AS TotalEmploymentRecords
FROM Employee
GROUP BY EmployeeID;

-- Maximum length of employment
SELECT 
MAX(DATEDIFF(e.TerminationDate, e.HireDate)) AS MaxLen
FROM Employment e
JOIN Department d
ON e.DepartmentCode = d.DepartmentCode
JOIN EmploymentType et
ON e.EmploymentTypeCode = et.EmploymentTypeCode
WHERE d.DepartmentName = 'Information Technology'
AND et.EmploymentTypeName = 'Full-Time'
AND TerminationDate BETWEEN '2018-04-01' AND '2019-03-31';

-- Total number of employment records
SELECT 
d.DepartmentName,
COUNT(*) AS TotalEmploymentRecords
FROM Employment e
JOIN Department d 
ON e.DepartmentCode = d.DepartmentCode
WHERE e.HireDate BETWEEN '2021-04-01' AND '2022-03-31'
GROUP BY DepartmentName
ORDER BY TotalEmploymentRecords;

-- Salary and performance analysis
SELECT 
    MIN(s.SalaryAmount) AS MinSalary,
    MAX(s.SalaryAmount) AS MaxSalary
FROM Salary s
JOIN Employee e
    ON s.EmployeeID = e.EmployeeID
JOIN Employment ep
    ON e.EmployeeID = ep.EmployeeID
JOIN EmploymentType et
    ON ep.EmploymentTypeCode = et.EmploymentTypeCode
WHERE ep.TerminationDate BETWEEN '2014-04-01' AND '2022-03-31'
  AND et.EmploymentTypeName = 'Contract'
  AND e.State = 'Lagos';
  
-- Salary range
SELECT 
    CASE 
		WHEN s.SalaryAmount < 250000 THEN 'Under 250K'
        WHEN s.SalaryAmount BETWEEN 250000 AND 349999 THEN '250K - 349K'
        WHEN s.SalaryAmount BETWEEN 350000 AND 449999 THEN '350K - 449K'
        WHEN s.SalaryAmount BETWEEN 450000 AND 549999 THEN '450K - 549K'
        ELSE '550K and above'
    END AS SalaryRange,
COUNT(*) AS NumOfEmployees,
AVG(DATEDIFF(e.TerminationDate, e.HireDate)) AS AvgLenOfEmployment
FROM Salary s
JOIN Employment e 
ON s.EmployeeID = e.EmployeeID
JOIN EmploymentType et
ON e.EmploymentTypeCode = et.EmploymentTypeCode
WHERE et.EmploymentTypeName IN ('Contract', 'Part-Time')
AND e.TerminationDate BETWEEN '2021-04-01' AND '2022-03-31'
GROUP BY SalaryRange
HAVING COUNT(*) >=2;

-- Department & project analysis
SELECT d.DepartmentName,
COUNT(DISTINCT pa.AssignmentID) AS NumOfProAss
FROM Department d
JOIN Employment e
ON d.DepartmentCode = e.DepartmentCode
JOIN EmploymentType et
ON e.EmploymentTypeCode = et.EmploymentTypeCode
JOIN ProjectAssignment pa
ON e.EmployeeID = pa.EmployeeID
WHERE e.HireDate BETWEEN '2021-04-01' AND '2022-03-31'
AND et.EmploymentTypeName = 'Full-Time'
GROUP BY DepartmentName
ORDER BY NumOfProAss DESC;

-- Additional data retrieval
SELECT e.EmployeeID, e.FirstName, e.LastName, 
COUNT(ep.EmploymentID) AS NumOfEmpRecords
FROM Employee e
JOIN Employment ep
ON e.EmployeeID = ep.EmployeeID
WHERE ep.HireDate BETWEEN '2021-04-01' AND '2022-03-31'
GROUP BY e.EmployeeID, e.FirstName, e.LastName
HAVING COUNT(ep.EmploymentID) >=1;

-- Average length of employment
SELECT 
    d.DepartmentName,
    AVG(DATEDIFF(COALESCE(e.TerminationDate, CURDATE()), e.HireDate)) AS AvgEmploymentLength,
    COUNT(e.EmploymentID) AS NumOfEmployments
FROM Employment e 
JOIN Department d
    ON e.DepartmentCode = d.DepartmentCode
WHERE e.HireDate BETWEEN '2021-04-01' AND '2022-03-31'
GROUP BY d.DepartmentName;

-- Top 5 departments with highest number of project assignments
SELECT DepartmentName,
	COUNT(pa.AssignmentID) AS TotalNumOfProjects
FROM Department d
JOIN Employment e
ON d.DepartmentCode = e.DepartmentCode
LEFT JOIN ProjectAssignment pa
ON e.EmployeeID = pa.EmployeeID
WHERE pa.AssignmentStartDate BETWEEN '2022-04-01' AND '2023-03-31'
GROUP BY DepartmentName
ORDER BY TotalNumOfProjects DESC
LIMIT 5;

-- Employee with the most project assignment
SELECT e.EmployeeId, e.FirstName, e.LastName,
COUNT(pa.AssignmentID) AS NumOfAssignments
FROM Employee e
JOIN ProjectAssignment pa 
ON e.EmployeeID = pa.EmployeeID
WHERE pa.AssignmentStartDate BETWEEN '2022-04-01' AND '2023-03-31'
GROUP BY e.EmployeeId, e.FirstName, e.LastName
ORDER BY NumOfAssignments DESC
LIMIT 1;

-- List of employees who were assigned to IT department
SELECT e.EmployeeId, e.FirstName, e.LastName,
       d.DepartmentName, p.ProjectName
FROM Employee e
JOIN Employment ep
    ON e.EmployeeID = ep.EmployeeID
JOIN Department d
    ON ep.DepartmentCode = d.DepartmentCode
JOIN ProjectAssignment pa
    ON e.EmployeeID = pa.EmployeeID
JOIN Project p
    ON pa.ProjectID = p.ProjectID
WHERE d.DepartmentName = 'Information Technology'
  AND p.ProjectName LIKE 'IT%';
