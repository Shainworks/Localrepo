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

3a. Retrieve the name and address of all employees who work for the ‘Research’ department. 
 
select Fname, Minit, Lname, Address  
    from EMPLOYEE e, DEPARTMENT d where 
    e.Dno=d.Dnumber 
    and 
    d.Dname="Research"; 
3b. For every project located in ‘Stafford’, list the project number, the controlling department 
number, and the department manager’s last name, address, and birth date. 
 
select e.Lname, e.Bdate, e.Address, p.pnumber, p.dnum 
    from EMPLOYEE e, PROJECT p, DEPARTMENT d  
    where p.plocation="Stafford" and p.dnum=d.Dnumber 
    and d.Mgr_ssn=e.Ssn; 
3c. For each employee, retrieve the employee’s first and last name and the first and last name   
     of   his or her immediate supervisor. 
    select e1.Fname, e1.Lname, e2.Fname as manager_Fname, e2.Lname as      
    manager_Lname 
    from EMPLOYEE as e1, EMPLOYEE as e2  
    where e2.Ssn=e1.Super_ssn; 
3d. Make a list of all project numbers for projects that involve an employee whose last name is    
     ‘Smith’, either as a worker or as a manager of the department that controls the project. 
 
(select distinct pnumber 
From PROJECT,DEPARTMENT,EMPLOYEE 
where Dnum=Dnumber AND Mgr_ssn=Ssn AND Lname="Smith") 
UNION 
(Select distinct pnumber 
From PROJECT,WORKS_ON,EMPLOYEE 
where pnumber=Pno AND Essn=Ssn AND Lname="Smith"); 
3e. Retrieve all employees whose address is in Houston, Texas. 
 
select Fname, Minit, Lname  
from EMPLOYEE  
where Address like "%Houston%TX%";   

3f. Retrieve all employees in department 5 whose salary is between $30,000 and $40,000. 
 
    select * 
    from EMPLOYEE e, DEPARTMENT d  
    where e.Dno=d.Dnumber and d.Dnumber=5 
    and e.Salary between 30000 and 40000; 
4a. Retrieve the names of all employees who do not have supervisors. 
 
         select Fname, Minit, Lname  
    from EMPLOYEE e  
    where  
    not exists(select * from EMPLOYEE as s where e.Super_ssn=s.Ssn); 
4b. Retrieve the name of each employee who has a dependent with the same first name and is  
     the same gender as the employee 
    select Fname, Minit, Lname  
    from EMPLOYEE e, DEPENDENT d where 
    e.Fname=d.Dependent_name 
    and  
    e.Sex=d.Sex; 
4c. Retrieve the names of employees who have no dependents. 
 
         select Fname, Minit, Lname  
    from EMPLOYEE where  
    not exists(select * from DEPENDENT where Ssn=Essn); 
4d. List the names of managers who have at least one dependent. 
 
         select Fname, Minit, Lname  
    from EMPLOYEE where  
    exists(select * from DEPARTMENT where Ssn=Mgr_ssn and Dno=Dnumber) 
    and 
    exists(select * from DEPENDENT where Ssn=Essn); 
4e. Retrieve the Social Security numbers of all employees who work on project numbers 1, 2,   
     or 3. 
 
         select distinct Essn from WORKS_ON where Pno in (1,2,3); 
4f. Find the sum of the salaries of all employees of the ‘Research’ department, as well as the  
     maximum salary, the minimum salary, and the average salary in this department. 
    select sum(Salary), max(Salary), min(Salary), avg(salary) 
    from EMPLOYEE, DEPARTMENT  
    where Dno=Dnumber and Dname="Research";
4g. For each department, retrieve the department number, the number of employees in the  
department, and their average salary. 
select Dno, count(*), avg(Salary) 
from EMPLOYEE  
group by Dno; 
