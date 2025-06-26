create table branch( 
 branch_name varchar(25), 
 branch_city varchar(25), 
 assets int, 
 primary key(branch_name)); 
 
create table account( 
 accno int, 
 branch_name varchar(25), 
 balance int, 
 primary key(accno)); 
 
create table customer( 
 customer_name varchar(25), 
 customer_street varchar(25), 
 customer_city varchar(25), 
 primary key(customer_name)); 
  
create table depositor( 
 customer_name varchar(25), 
 accno int, 
 primary key(customer_name,accno), 
 foreign key(customer_name) references customer(customer_name), 
 foreign key(accno) references account(accno) on delete cascade); 
   
create table loan( 
 loan_number int, 
 branch_name varchar(25), 
 amount int, 
 primary key(loan_number), 
 foreign key(branch_name) references branch(branch_name)); 
 
insert into branch values('jaynagar','bangalore',15000000), 
                         ('basavanagudi','bangalore',25000000), 
                         ('noida','delhi',50000000), 
                         ('marine drive','mumbai',40000000), 
                         ('green park','delhi',30000000); 
 
insert into account values(123,'jaynagar',25000); 
insert into account values(156,'jaynagar',30000); 
insert into account values(456,'basavanagudi',15000); 
insert into account values(789,'noida',25000); 
insert into account values(478,'marine drive',48000); 
insert into account values(778,'green park',60000); 
insert into account values(189,'basavanagudi',50000); 
 
insert into customer values('ramu','jaynagar','bangalore'); 
insert into customer values('kumar','basavanagudi','bangalore'); 
insert into customer values('john','noida','delhi'); 
insert into customer values('mike','marine drive','mumbai'); 
insert into customer values('sachin','green park','delhi'); 
insert into depositor values('ramu',123); 
insert into depositor values('ramu',156); 
insert into depositor values('ramu',189); 
insert into depositor values('kumar',456); 
insert into depositor values('john',789); 
insert into depositor values('mike','478'); 
insert into depositor values('sachin','778'); 
insert into loan values(1111,'jaynagar',250000); 
insert into loan values(2222,'basavanagudi',350000); 
insert into loan values(3333,'noida',150000); 
insert into loan values(4444,'marine drive',1500000); 
insert into loan values(5555,'green park',7500000); 
Here is your SQL code in a `.md` (Markdown) format:




## 5a. Find all the customers who have at least two accounts at the main branch

```sql
SELECT d.customer_name, COUNT(*)  
FROM account a, depositor d  
WHERE a.accno = d.accno  
  AND d.accno IN (SELECT accno FROM account WHERE branch_name = 'jaynagar')  
GROUP BY d.customer_name  
HAVING COUNT(*) >= 2;
````

---

## 5b. Find all the customers who have an account at all the branches located in a specified city

```sql
SELECT d.customer_name  
FROM account a, depositor d, branch b  
WHERE b.branch_name = a.branch_name  
  AND a.accno = d.accno  
  AND b.branch_city = 'bangalore'  
GROUP BY d.customer_name  
HAVING COUNT(DISTINCT b.branch_name) = (
  SELECT COUNT(branch_name)  
  FROM branch  
  WHERE branch_city = 'bangalore'
);
```

---

## 5c. Delete all account tuples at every branch located in a specified city

```sql
DELETE FROM account  
WHERE branch_name IN (
  SELECT branch_name  
  FROM branch  
  WHERE branch_city = 'delhi'
);
```


