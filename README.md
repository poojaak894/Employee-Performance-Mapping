# Employee Performance Mapping (SQL Project)

## Overview
This project focuses on analyzing employee performance using SQL. It simulates a real-world HR analytics system for a data science company, where employee data, project data, and performance ratings are evaluated to support appraisal decisions and organizational planning.

The project demonstrates the use of SQL for data extraction, transformation, analysis, and optimization using advanced concepts like joins, subqueries, views, functions, and indexing.

---

## Problem Statement
ScienceQtech, a data science startup, requires a structured analysis of employee performance for its annual appraisal cycle. The HR department needs insights into employee roles, salaries, performance ratings, experience levels, and project assignments to make informed decisions regarding promotions, training, and bonuses.

---

## Objectives
- Analyze employee performance based on ratings and experience
- Identify salary distribution across roles and regions
- Validate role assignment standards
- Calculate employee bonuses
- Improve query performance using indexing
- Generate HR insights using SQL queries

---

## Database Structure

### 1. emp_record_table
Contains detailed employee information such as:
- EMP_ID
- FIRST_NAME
- LAST_NAME
- GENDER
- ROLE
- DEPT
- EXP
- COUNTRY
- CONTINENT
- SALARY
- EMP_RATING
- MANAGER_ID
- PROJ_ID

---

### 2. proj_table
Contains project-related details:
- PROJECT_ID
- PROJ_NAME
- DOMAIN
- START_DATE
- CLOSURE_DATE
- DEV_QTR
- STATUS

---

### 3. data_science_team
Contains data science team employee records:
- EMP_ID
- FIRST_NAME
- LAST_NAME
- GENDER
- ROLE
- DEPT
- EXP
- COUNTRY
- CONTINENT

---

## Key SQL Concepts Used
- Database and Table Creation
- Data Import (CSV)
- SELECT Queries
- WHERE Conditions
- GROUP BY and Aggregations
- JOINS and UNION
- Subqueries
- Views
- Stored Functions
- Indexing
- Ranking Functions

---

## Key Tasks Performed
- Retrieved employee and department details
- Filtered employees based on performance ratings
- Concatenated employee names for specific departments
- Identified leadership roles
- Combined department data using UNION
- Calculated max/min salary by role
- Ranked employees based on experience
- Created views for high-salary employees
- Implemented role validation using functions
- Created index for performance optimization
- Calculated employee bonuses
- Analyzed salary distribution by region

---

## Key Insights
- Employees can be categorized effectively based on experience and performance ratings
- Salary distribution varies significantly across roles and continents
- Indexing improves query performance for large datasets
- Bonus calculations provide fair incentive structures
- Structured SQL analysis supports better HR decision-making

---

## Technologies Used
- MySQL

  


