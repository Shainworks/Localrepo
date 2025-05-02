CREATE TABLE Department (
    Dnumber INT PRIMARY KEY,
    Dname VARCHAR(50),
    mgr_ssn INT,
    mgr_start_date DATE
);

CREATE TABLE Employee (
    Fname VARCHAR(30),
    Minit CHAR(1),
    Lname VARCHAR(30),
    Ssn INT PRIMARY KEY,
    Bdate DATE,
    Address VARCHAR(100),
    Sex CHAR(1),
    Salary DECIMAL(10,2),
    Super_ssn INT,
    Dno INT,
    FOREIGN KEY (Super_ssn) REFERENCES Employee(Ssn),
    FOREIGN KEY (Dno) REFERENCES Department(Dnumber)
);

CREATE TABLE Dept_Location (
    Dnumber INT,
    Dlocation VARCHAR(50),
    PRIMARY KEY (Dnumber, Dlocation),
    FOREIGN KEY (Dnumber) REFERENCES Department(Dnumber)
);

CREATE TABLE Project (
    Pname VARCHAR(50),
    Pnumber INT PRIMARY KEY,
    Plocation VARCHAR(50),
    Dnum INT,
    FOREIGN KEY (Dnum) REFERENCES Department(Dnumber)
);

CREATE TABLE Works_On (
    Essn INT,
    Pno INT,
    Hours DECIMAL(4,1),
    PRIMARY KEY (Essn, Pno),
    FOREIGN KEY (Essn) REFERENCES Employee(Ssn),
    FOREIGN KEY (Pno) REFERENCES Project(Pnumber)
);

CREATE TABLE Dependent (
    Essn INT,
    Dependent_name VARCHAR(50),
    Sex CHAR(1),
    Bdate DATE,
    Relationship VARCHAR(30),
    PRIMARY KEY (Essn, Dependent_name),
    FOREIGN KEY (Essn) REFERENCES Employee(Ssn)
);
1. Employees in Research department:

SELECT E.Fname, E.Lname, E.Address
FROM Employee E
JOIN Department D ON E.Dno = D.Dnumber
WHERE D.Dname = 'Research';

2. Projects in Stafford with manager details:

SELECT P.Pnumber, P.Dnum, E.Lname, E.Address, E.Bdate
FROM Project P
JOIN Department D ON P.Dnum = D.Dnumber
JOIN Employee E ON D.mgr_ssn = E.Ssn
WHERE P.Plocation = 'Stafford';

3. Each employee and their supervisor’s name:

SELECT E.Fname AS Emp_Fname, E.Lname AS Emp_Lname,
       S.Fname AS Sup_Fname, S.Lname AS Sup_Lname
FROM Employee E
LEFT JOIN Employee S ON E.Super_ssn = S.Ssn;

4. Projects involving employees or managers named 'Smith':

SELECT DISTINCT P.Pnumber
FROM Project P
JOIN Department D ON P.Dnum = D.Dnumber
JOIN Employee M ON D.mgr_ssn = M.Ssn
LEFT JOIN Works_On W ON P.Pnumber = W.Pno
LEFT JOIN Employee E ON W.Essn = E.Ssn
WHERE M.Lname = 'Smith' OR E.Lname = 'Smith';

5. Employees in Houston, Texas:

SELECT Fname, Lname FROM Employee
WHERE Address LIKE '%Houston, Texas%';

6. Employees in department 5 with salary between 30k and 40k:

SELECT Fname, Lname FROM Employee
WHERE Dno = 5 AND Salary BETWEEN 30000 AND 40000;

7. Employees with no supervisors:

SELECT Fname, Lname FROM Employee
WHERE Super_ssn IS NULL;

8. Employees with dependents of same first name and same gender:

SELECT E.Fname, E.Lname
FROM Employee E
JOIN Dependent D ON E.Ssn = D.Essn
WHERE E.Fname = D.Dependent_name AND E.Sex = D.Sex;

9. Employees with no dependents:

SELECT Fname, Lname
FROM Employee
WHERE Ssn NOT IN (SELECT Essn FROM Dependent);

10. Managers with at least one dependent:

SELECT DISTINCT E.Fname, E.Lname
FROM Employee E
JOIN Department D ON E.Ssn = D.mgr_ssn
JOIN Dependent Dp ON E.Ssn = Dp.Essn;

11. SSNs of employees working on project 1, 2, or 3:

SELECT DISTINCT Essn
FROM Works_On
WHERE Pno IN (1, 2, 3);

12. Research dept salary stats:

SELECT SUM(E.Salary) AS TotalSalary,
       MAX(E.Salary) AS MaxSalary,
       MIN(E.Salary) AS MinSalary,
       AVG(E.Salary) AS AvgSalary
FROM Employee E
JOIN Department D ON E.Dno = D.Dnumber
WHERE D.Dname = 'Research';

13. Dept no, count of employees, and avg salary per department:

SELECT Dno, COUNT(*) AS NumEmployees, AVG(Salary) AS AvgSalary
FROM Employee
GROUP BY Dno;