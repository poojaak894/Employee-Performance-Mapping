CREATE DATABASE project;
CREATE TABLE proj_table(
PROJECT_ID VARCHAR(50) PRIMARY KEY,
PROJ_NAME VARCHAR(50),	
DOMAIN VARCHAR(50),	
START_DATE DATE,	
CLOSURE_DATE DATE,	
DEV_QTR	VARCHAR(50),
STATUS VARCHAR(50));


CREATE TABLE emp_record_table(
EMP_ID VARCHAR(50) PRIMARY KEY,
FIRST_NAME VARCHAR(50),
LAST_NAME VARCHAR(50),
GENDER VARCHAR(50),
ROLE VARCHAR(50),
DEPT VARCHAR(50),
EXP INT,
COUNTRY VARCHAR(50),
CONTINENT VARCHAR(50),
SALARY DECIMAL(10,2),
EMP_RATING INT,
MANAGER_ID VARCHAR(50),
PROJ_ID VARCHAR(50),
FOREIGN KEY (PROJ_ID)
REFERENCES proj_table (PROJECT_ID));

CREATE TABLE data_science_team(
EMP_ID VARCHAR(50),
FIRST_NAME VARCHAR(50),
LAST_NAME VARCHAR(50),
GENDER VARCHAR(50),
ROLE VARCHAR(50),
DEPT VARCHAR(50),
EXP INT,
COUNTRY VARCHAR(50),
CONTINENT VARCHAR(50),
FOREIGN KEY (EMP_ID)
REFERENCES emp_record_table(EMP_ID));




/* -----------------------------
   1. EMP RATING FILTERS
   -----------------------------*/
-- less than two 
SELECT EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT, EMP_RATING
FROM emp_record_table
WHERE EMP_RATING < 2;
-- greater than four  
SELECT EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT, EMP_RATING
FROM emp_record_table
WHERE EMP_RATING > 4;
-- between two and four
SELECT EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT, EMP_RATING
FROM emp_record_table
WHERE EMP_RATING  BETWEEN 2 AND 4;

/* -------------------------------------
   2. FINANCE EMPLOYEE NAMES (CONCAT)
   -------------------------------------*/
SELECT concat(FIRST_NAME,' ', LAST_NAME) AS NAME
FROM emp_record_table
WHERE DEPT = "FINANCE";
   
/* --------------------------------------------
3. EMPLOYEES WHO HOLD LEADERSHIP POSITIONS.
-----------------------------------------------*/
SELECT EMP_ID, FIRST_NAME, ROLE, DEPT
FROM emp_record_table
WHERE ROLE IN ("MANAGER", "PRESIDENT", "CEO");

/* --------------------------------------------
   4. HEALTHCARE + FINANCE EMPLOYEES (UNION)
   --------------------------------------------*/
SELECT *
FROM emp_record_table
WHERE DEPT = "HEALTHCARE"
UNION
SELECT *
FROM emp_record_table
WHERE DEPT = "FINANCE";
 
/* ---------------------------------
   5. EMP RATING WITH MAX PER DEPT
   ---------------------------------*/
SELECT EMP_ID, FIRST_NAME, LAST_NAME, ROLE, DEPT, EMP_RATING,
MAX(EMP_RATING) OVER(PARTITION BY DEPT) MAX_DEPT_RATING
FROM emp_record_table;

/* -----------------------------
   6. MIN & MAX SALARY PER ROLE
   ----------------------------- */
SELECT ROLE, max(SALARY) AS MIN_SALARY, min(SALARY) AS MAX_SALARY
FROM emp_record_table
GROUP BY ROLE;

/* -------------------------
   7. RANK BY EXPERIENCE
   ------------------------- */
SELECT EMP_ID, CONCAT(FIRST_NAME, ' ', LAST_NAME) AS NAME, EXP,
RANK() OVER(ORDER BY EXP DESC) RANK_NO
FROM emp_record_table;

/* -------------------------------------------
   8. VIEW: HIGH SALARY EMPLOYEES BY COUNTRY
   ------------------------------------------- */
CREATE OR REPLACE VIEW emp_salary_view AS (
SELECT EMP_ID, FIRST_NAME, LAST_NAME, COUNTRY, SALARY
FROM emp_record_table
WHERE SALARY > 6000);

SELECT * FROM emp_salary_view;
/*-------------------------------------------------
9. Employees earning more than the average salary
---------------------------------------------------*/
SELECT *
FROM emp_record_table
WHERE SALARY > (SELECT AVG(SALARY)
                FROM emp_record_table);

/* --------------------------------------------
  10. STORED FUNCTION: JOB PROFILE VALIDATION
   -------------------------------------------- */
DELIMITER //
CREATE FUNCTION job_profile(exp_year INT)
RETURNS VARCHAR(50)
DETERMINISTIC
NO SQL
BEGIN
IF exp_year <= 2 THEN 
	RETURN 'JUNIOR DATA SCIENTIST';
ELSEIF exp_year > 2 and exp_year <= 5 THEN
	RETURN 'ASSOCIATE DATA SCIENTIST';
ELSEIF exp_year > 5 and exp_year <= 10 THEN
	RETURN 'SENIOR DATA SCIENTIST';
ELSEIF exp_year > 10 and exp_year <= 12 THEN
	RETURN 'LEAD DATA SCIENTIST';
ELSE 
	RETURN 'MANAGER';
END IF;
END //
DELIMITER ;

SELECT  job_profile(20); 


/* ----------------------------------
   11. INDEX FOR FIRST_NAME SEARCH
   ---------------------------------- */
EXPLAIN
SELECT *
FROM emp_record_table
WHERE FIRST_NAME = 'Eric';

CREATE INDEX inx_first_name
ON emp_record_table(FIRST_NAME);

EXPLAIN
SELECT *
FROM emp_record_table
WHERE FIRST_NAME = 'Eric';


/* -------------------------
   12. BONUS CALCULATION
   ------------------------- */

SELECT FIRST_NAME, 
LAST_NAME, 
SALARY, 
EMP_RATING,
(SALARY * 0.5) * EMP_RATING AS BONUS
FROM emp_record_table;

/* ------------------------------------------
   13. AVG SALARY BY CONTINENT & COUNTRY
   ------------------------------------------ */
SELECT CONTINENT, COUNTRY, AVG(SALARY)
FROM emp_record_table
GROUP BY CONTINENT, COUNTRY;









































































