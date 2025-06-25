CREATE TABLE EMPLOYEE 
( Fname           VARCHAR(10)   NOT NULL, 
  Minit           CHAR, 
  Lname           VARCHAR(20)      NOT NULL, 
  Ssn             CHAR(9)          NOT NULL, 
  Bdate           DATE, 
  Address         VARCHAR(30), 
  Sex             CHAR(1), 
  Salary          DECIMAL(5), 
  Super_ssn       CHAR(9), 
  Dno             INT               NOT NULL, 
  PRIMARY KEY(Ssn)); 
 
 
CREATE TABLE DEPARTMENT 
( Dname           VARCHAR(15)       NOT NULL, 
  Dnumber         INT               NOT NULL, 
  Mgr_ssn         CHAR(9)           NOT NULL, 
  Mgr_start_date  DATE, 
  PRIMARY KEY (Dnumber), 
  UNIQUE      (Dname), 
  FOREIGN KEY (Mgr_ssn) REFERENCES EMPLOYEE(Ssn) ); 
 
 
CREATE TABLE DEPT_LOCATIONS 
( Dnumber         INT               NOT NULL, 
  Dlocation       VARCHAR(15)       NOT NULL, 
  PRIMARY KEY (Dnumber, Dlocation), 
  FOREIGN KEY (Dnumber) REFERENCES DEPARTMENT(Dnumber) ); 
 
 
Create table PROJECT 
( pname       varchar(25) not nullunique, 
  pnumber     int not null primary key, 
  plocation   varchar(15), 
  dnum        int not null, 
  foreign key(dnum) references DEPARTMENT(Dnumber)); 
    
  
CREATE TABLE WORKS_ON 
( Essn            CHAR(9)           NOT NULL, 
  Pno             INT               NOT NULL, 
  Hours           DECIMAL(3,1)      NOT NULL, 
  PRIMARY KEY (Essn, Pno), 
  FOREIGN KEY (Essn) REFERENCES EMPLOYEE(Ssn), 
  FOREIGN KEY (Pno) REFERENCES PROJECT(Pnumber) ); 
 
 
CREATE TABLE DEPENDENT 
( Essn            CHAR(9)           NOT NULL, 
  Dependent_name  VARCHAR(15)       NOT NULL, 
  Sex             CHAR, 
  Bdate           DATE, 
  Relationship    VARCHAR(8), 
  PRIMARY KEY (Essn, Dependent_name), 
  FOREIGN KEY (Essn) REFERENCES EMPLOYEE(Ssn) ); 
 
 
INSERT INTO EMPLOYEE 
VALUES ('Franklin','T','Wong',333445555,'1965-12-08','638 Voss, 
Houston TX','M',40000,888665555,5), 
            ('Alicia','J','Zelaya',999887777,'1968-01-19','3321 
Castle, Spring TX','F',25000,987654321,4), 
            ('Jennifer','S','Wallace',987654321,'1941-06-20','291 
Berry, Bellaire TX','F',43000,888665555,4), 
            ('Ramesh','K','Narayan',666884444,'1962-09-15','975 Fire 
Oak, Humble TX','M',38000,333445555,5), 
            ('Joyce','A','English',453453453,'1972-07-31','5631 Rice, 
Houston TX','F',25000,333445555,5), 
            ('Ahmad','V','Jabbar',987987987,'1969-03-29','980 Dallas, 
Houston TX','M',25000,987654321,4), 
            ('James','E','Borg',888665555,'1937-11-10','450 Stone, 
Houston TX','M',55000,,1); 
 
INSERT INTO DEPARTMENT 
VALUES      ('Research',5,333445555,'1988-05-22'), 
            ('Administration',4,987654321,'1995-01-01'), 
            ('Headquarters',1,888665555,'1981-06-19'); 
 
INSERT INTO PROJECT 
VALUES      ('ProductX',1,'Bellaire',5), 
            ('ProductY',2,'Sugarland',5), 
            ('ProductZ',3,'Houston',5), 
            ('Computerization',10,'Stafford',4), 
            ('Reorganization',20,'Houston',1), 
            ('Newbenefits',30,'Stafford',4); 
 
INSERT INTO WORKS_ON 
VALUES     (123456789,1,32.5), 
           (123456789,2,7.5), 
           (666884444,3,40.0), 
           (453453453,1,20.0), 
           (453453453,2,20.0), 
           (333445555,2,10.0), 
           (333445555,3,10.0), 
           (333445555,10,10.0), 
           (333445555,20,10.0), 
           (999887777,30,30.0); 
 
            
 
INSERT INTO DEPENDENT 
VALUES      (333445555,'Alice','F','1986-04-04','Daughter'), 
            (333445555,'Theodore','M','1983-10-25','Son'), 
            (333445555,'Joy','F','1958-05-03','Spouse'), 
            (987654321,'Abner','M','1942-02-28','Spouse'), 
            (123456789,'Michael','M','1988-01-04','Son'), 
            (123456789,'Alice','F','1988-12-30','Daughter'), 
            (123456789,'Elizabeth','F','1967-05-05','Spouse'); 
 
INSERT INTO DEPT_LOCATIONS 
VALUES      (1,'Houston'), 
            (4,'Stafford'), 
            (5,'Bellaire'), 
            (5,'Sugarland'), 
            (5,'Houston'); 



### ✅ 1. Retrieve the name and address of all employees who work for the ‘Research’ department.

```sql
SELECT Fname, Minit, Lname, Address
FROM EMPLOYEE e, DEPARTMENT d
WHERE e.Dno = d.Dnumber AND d.Dname = "Research";
```

---

### ✅ 2. For every project located in ‘Stafford’, list the project number, the controlling department number, and the department manager’s last name, address, and birth date.

```sql
SELECT e.Lname, e.Bdate, e.Address, p.Pnumber, p.Dnum
FROM EMPLOYEE e, PROJECT p, DEPARTMENT d
WHERE p.Plocation = "Stafford" AND p.Dnum = d.Dnumber AND d.Mgr_ssn = e.Ssn;
```

---

### ✅ 3. For each employee, retrieve the employee’s first and last name and the first and last name of their immediate supervisor.

```sql
SELECT e1.Fname, e1.Lname, e2.Fname AS manager_Fname, e2.Lname AS manager_Lname
FROM EMPLOYEE AS e1, EMPLOYEE AS e2
WHERE e2.Ssn = e1.Super_ssn;
```

---

### ✅ 4. Make a list of all project numbers for projects that involve an employee whose last name is ‘Smith’, either as a worker or as a manager of the department that controls the project.

```sql
(SELECT DISTINCT Pnumber
 FROM PROJECT, DEPARTMENT, EMPLOYEE
 WHERE Dnum = Dnumber AND Mgr_ssn = Ssn AND Lname = "Smith")

UNION

(SELECT DISTINCT Pnumber
 FROM PROJECT, WORKS_ON, EMPLOYEE
 WHERE Pnumber = Pno AND Essn = Ssn AND Lname = "Smith");
```

---

### ✅ 5. Retrieve all employees whose address is in Houston, Texas.

```sql
SELECT Fname, Minit, Lname
FROM EMPLOYEE
WHERE Address LIKE "%Houston%TX%";
```

---

### ✅ 6. Retrieve all employees in department 5 whose salary is between \$30,000 and \$40,000.

```sql
SELECT *
FROM EMPLOYEE e, DEPARTMENT d
WHERE e.Dno = d.Dnumber AND d.Dnumber = 5
  AND e.Salary BETWEEN 30000 AND 40000;
```

---

### ✅ 7. Retrieve the names of all employees who do not have supervisors.

```sql
SELECT Fname, Minit, Lname
FROM EMPLOYEE e
WHERE NOT EXISTS (
  SELECT * FROM EMPLOYEE AS s WHERE e.Super_ssn = s.Ssn
);
```

---

### ✅ 8. Retrieve the name of each employee who has a dependent with the same first name and gender.

```sql
SELECT Fname, Minit, Lname
FROM EMPLOYEE e, DEPENDENT d
WHERE e.Fname = d.Dependent_name AND e.Sex = d.Sex;
```

---

### ✅ 9. Retrieve the names of employees who have no dependents.

```sql
SELECT Fname, Minit, Lname
FROM EMPLOYEE
WHERE NOT EXISTS (
  SELECT * FROM DEPENDENT WHERE Ssn = Essn
);
```

---

### ✅ 10. List the names of managers who have at least one dependent.

```sql
SELECT Fname, Minit, Lname
FROM EMPLOYEE
WHERE EXISTS (
  SELECT * FROM DEPARTMENT WHERE Ssn = Mgr_ssn AND Dno = Dnumber
)
AND EXISTS (
  SELECT * FROM DEPENDENT WHERE Ssn = Essn
);
```

---

### ✅ 11. Retrieve the Social Security numbers of all employees who work on project numbers 1, 2, or 3.

```sql
SELECT DISTINCT Essn
FROM WORKS_ON
WHERE Pno IN (1, 2, 3);
```

---

### ✅ 12. Find the sum, maximum, minimum, and average salary of employees in the ‘Research’ department.

```sql
SELECT SUM(Salary), MAX(Salary), MIN(Salary), AVG(Salary)
FROM EMPLOYEE, DEPARTMENT
WHERE Dno = Dnumber AND Dname = "Research";
```

---

### ✅ 13. For each department, retrieve the department number, the number of employees, and their average salary.

```sql
SELECT Dno, COUNT(*), AVG(Salary)
FROM EMPLOYEE
GROUP BY Dno;
```

---


