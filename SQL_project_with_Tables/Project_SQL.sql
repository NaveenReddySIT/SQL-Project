CREATE TABLE Worker(
WORKER_ID int NOT NULL PRIMARY KEY,
FIRST_NAME char(30),
LAST_NAME char(30),
SALARY int(20),
JOINING_DATE DATETIME,
DEPARTMENT char(30)
);

INSERT INTO Worker
(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
(001,'Monika','Arora',100000,'2014-02-20 09:00:00','HR'),
(002,'Niharika','Verma',80000,'2014-06-11 09:00:00','Admin'),
(003,'Vishal','Singhal',300000,'2014-02-20 09:00:00','HR'),
(004,'Amitabh','Singh',500000,'2014-02-20 09:00:00','Admin'),
(005,'Vivek','Bhati',500000,'2014-06-11 09:00:00','Admin'),
(006,'Vipul','Diwan',200000,'2014-06-11 09:00:00','Account'),
(007,'Satish','Kumar',750000,'2014-01-20 09:00:00','Account'),
(008,'Geetika','Chauhan',90000,'2014-04-11 09:00:00','Admin');

CREATE TABLE BONUS(
WORKER_REF_ID INT,
BONUS_DATE DATETIME,
BONUS_AMOUNT INT NOT NULL
);


INSERT INTO BONUS
 (WORKER_REF_ID, BONUS_DATE, BONUS_AMOUNT) VALUES
 (001, '2016-02-20 00:00:00', 5000),
 (002, '2016-06-11 00:00:00', 3000),
 (003, '2016-02-20 00:00:00', 4000),
 (001, '2016-02-20 00:00:00', 4500),
 (002, '2016-06-11 00:00:00', 3500);
select *from BONUS;


CREATE TABLE Title(
 WORKER_REF_ID INT,
 WORKER_TITLE CHAR(25),
 AFFECTED_FROM DATETIME
 );
 
 insert into Title
 (WORKER_REF_ID,WORKER_TITLE,AFFECTED_FROM) values
 (1,'Manager','2016-02-20 00:00:00'),
 (2,'Executive','2016-06-11 00:00:00'),
 (8,'Executive','2016-06-11 00:00:00'),
 (5,'Manager','2016-06-11 00:00:00'),
 (4,'Asst.Manager','2016-06-11 00:00:00'),
 (7,'Executive','2016-06-11 00:00:00'),
 (6,'Lead','2016-06-11 00:00:00'),
 (3,'Lead','2016-06-11 00:00:00');
 

#Q1 Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.

select FIRST_NAME As WORKER_NAME 
from worker;

#Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.

select upper(FIRST_NAME)  from worker;

#Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.

select DISTINCT(DEPARTMENT) from Worker;

#Q-4. Write an SQL query to print the first three characters of FIRST_NAME from Worker table.

select substring(FIRST_NAME,1,3) from Worker;

#Q-5. Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from Worker table.

select instr('Amitabh','a')position;

#Q-6 Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.

select rtrim(FIRST_NAME) from worker;

#Q-7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.

select ltrim(DEPARTMENT) from worker;

#Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.

select distinct(length(DEPARTMENT)) from worker;

#Q-9. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.

select replace(FIRST_NAME,'a','A') from worker;

#Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME. A space char should separate them.

select concat(FIRST_NAME,' ',LAST_NAME) as COMPLETE_NAME from worker;

#Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.

select *from worker order by FIRST_NAME asc ;

#Q-12. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.

select *from worker order by FIRST_NAME asc ,DEPARTMENT desc;

#Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.

select *from worker where FIRST_NAME in ('Vipul','Satish');

#Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.

select *from worker where FIRST_NAME not in ('Vipul','Satish');

#Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.

select *from worker where DEPARTMENT in ('Admin');

#Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.

select *from worker where FIRST_NAME like '%a%';

#Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.

select *from worker where FIRST_NAME like '%a';

#Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.

select *from worker where FIRST_NAME like '%h' and length(FIRST_NAME)=6;

#Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
select *from worker where SALARY between 100000 and 500000;

#Q-20. Write an SQL query to print details of the Workers who have joined in Feb’2014.

select *from worker where month(JOINING_DATE) = 2;

#Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.
select count(Worker_id) from worker where department ='Admin';

#Q-22. Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.

select first_name,last_name from worker where salary >=50000 and salary <=100000;

#Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.

select count(worker_id) as no_of_workers ,department from worker group by department order by no_of_workers desc;

#Q-25. Write an SQL query to fetch duplicate records having matching data in some fields of a table.

select WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT,count(*)
from worker group by WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT
having count(*) >1;
#Q-26. Write an SQL query to show only odd rows from a table.

select *from worker where worker_id %2!=0;

#Q-27. Write an SQL query to show only even rows from a table.

select *from worker where worker_id %2=0;

#Q-28. Write an SQL query to clone a new table from another table.

create table new_tab select *from worker;

#Q-29. Write an SQL query to fetch intersecting records of two tables.

select *from worker inner join bonus on worker.worker_id = bonus.worker_ref_id;

#Q-30. Write an SQL query to show records from one table that another table does not have.

select *from worker where worker_id  not in (select Worker_ref_id from bonus);

#Q-31. Write an SQL query to show the current date and time.

select sysdate();

#Q-32. Write an SQL query to show the top n (say 10) records of a table.

select *from worker limit 10;

#Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table

select *from worker order by salary desc limit 4,1;

#Q-34. Write an SQL query to determine the 5th highest salary without using TOP or limit method.

SELECT SALARY 
FROM worker w1 
WHERE 5-1 = ( 
      SELECT COUNT( DISTINCT ( w2.SALARY ) ) 
      FROM worker w2 
      WHERE w2.SALARY >  w1.SALARY );
      
#Q-35. Write an SQL query to fetch the list of employees with the same salary.

SELECT s1.WORKER_ID, s1.FIRST_NAME,s1.SALARY
FROM Worker s1
INNER JOIN Worker s2 ON s1.SALARY = s2.SALARY AND s1.FIRST_NAME <> s2.FIRST_NAME ;


#Q-36. Write an SQL query to show the second highest salary from a table.

select *from worker order by salary desc limit 1,1;

#Q-37. Write an SQL query to show one row twice in results from a table.

select *from worker union all select *from worker;

#Q-38. Write an SQL query to fetch intersecting records of two tables.

select *from worker inner join bonus where worker.worker_id = bonus.worker_ref_id;

#Q-39. Write an SQL query to fetch the first 50% records from a table.

select *from worker where worker_id <=(select count(worker_id)/2 from worker);

#Q-40. Write an SQL query to fetch the departments that have less than five people in it.

select any_value(department) from worker group by department having count(department)<5;


#Q-41. Write an SQL query to show all departments along with the number of people in there.

select any_value(worker_id) ,department,count(*) as no_of_people from worker group by department;

#Q-42Write an SQL query to show the last record from a table.

select *from worker where worker_id = (select max(worker_id) from worker);

#Q-43. Write an SQL query to fetch the first row of a table.

select *from worker where worker_id = (select min(worker_id) from worker);

#Q-44. Write an SQL query to fetch the last five records from a table.

select *from (select *from worker order by worker_id desc limit 5)var1 order by worker_id asc;

#Q-45. Write an SQL query to print the name of employees having the highest salary in each department.

select any_value(first_name),any_value(last_name),any_value(department) from worker group by department having max(salary); 

#Q-46. Write an SQL query to fetch three max salaries from a table.

select salary from worker group by salary order by salary desc limit 3;

#Q-47. Write an SQL query to fetch three min salaries from a table.
select salary from worker group by salary order by salary asc limit 3;

#Q-48. Write an SQL query to fetch nth max salaries from a table.

SELECT any_value(max(Salary))
FROM worker E1 
WHERE 5-1 = ( 
      SELECT COUNT( DISTINCT ( E2.max(Salary )) ) 
      FROM worker E2 
      WHERE E2.max(Salary) >  E1.max(Salary) );

#Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them.
select any_value(department) ,any_value(salary) from worker group by department ;

#Q-50. Write an SQL query to fetch the names of workers who earn the highest salary.
select first_name,last_name from worker where salary = (select max(salary) from worker);
