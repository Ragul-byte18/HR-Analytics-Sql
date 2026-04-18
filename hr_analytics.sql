DROP DATABASE IF EXISTS hr_analytics;
CREATE DATABASE hr_analytics;
USE hr_analytics;


CREATE TABLE departments (
    dept_id   INT PRIMARY KEY AUTO_INCREMENT,
    dept_name VARCHAR(50),
    location  VARCHAR(50)
);

CREATE TABLE employees (
    emp_id     INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name  VARCHAR(50),
    gender     ENUM('Male','Female'),
    age        INT,
    dept_id    INT,
    job_role   VARCHAR(60),
    hire_date  DATE,
    status     ENUM('Active','Left') DEFAULT 'Active',
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

CREATE TABLE salaries (
    salary_id      INT PRIMARY KEY AUTO_INCREMENT,
    emp_id         INT,
    base_salary    DECIMAL(10,2),
    bonus          DECIMAL(10,2),
    effective_date DATE,
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

CREATE TABLE performance_reviews (
    review_id      INT PRIMARY KEY AUTO_INCREMENT,
    emp_id         INT,
    review_year    INT,
    rating         INT,
    promoted       TINYINT DEFAULT 0,
    overtime_hours INT DEFAULT 0,
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

CREATE TABLE attrition (
    attrition_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_id       INT,
    leave_date   DATE,
    reason       VARCHAR(100),
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);


INSERT INTO departments (dept_name, location) VALUES
('Human Resources', 'Chennai'),
('Engineering',     'Bangalore'),
('Sales',           'Mumbai'),
('Finance',         'Delhi'),
('Marketing',       'Hyderabad'),
('Operations',      'Pune');

INSERT INTO employees (first_name, last_name, gender, age, dept_id, job_role, hire_date, status) VALUES
('Arjun',     'Kumar',     'Male',   28, 2, 'Software Engineer',       '2021-03-10', 'Active'),
('Priya',     'Sharma',    'Female', 32, 1, 'HR Manager',              '2019-06-01', 'Active'),
('Ravi',      'Patel',     'Male',   45, 4, 'Senior Accountant',       '2015-01-15', 'Active'),
('Sneha',     'Nair',      'Female', 27, 3, 'Sales Executive',         '2022-07-20', 'Left'),
('Vikram',    'Reddy',     'Male',   35, 2, 'Tech Lead',               '2018-09-05', 'Active'),
('Ananya',    'Iyer',      'Female', 29, 5, 'Marketing Analyst',       '2021-11-01', 'Active'),
('Karthik',   'Menon',     'Male',   41, 6, 'Operations Manager',      '2016-04-22', 'Active'),
('Divya',     'Pillai',    'Female', 26, 3, 'Sales Executive',         '2023-01-10', 'Left'),
('Suresh',    'Babu',      'Male',   38, 4, 'Finance Analyst',         '2017-08-30', 'Active'),
('Meera',     'Krishnan',  'Female', 31, 2, 'Software Engineer',       '2020-05-14', 'Active'),
('Rohit',     'Singh',     'Male',   24, 3, 'Junior Sales Executive',  '2023-06-01', 'Left'),
('Lakshmi',   'Devi',      'Female', 44, 1, 'HR Business Partner',     '2014-02-18', 'Active'),
('Ajay',      'Verma',     'Male',   33, 5, 'Content Strategist',      '2020-10-09', 'Active'),
('Pooja',     'Joshi',     'Female', 30, 6, 'Logistics Coordinator',   '2021-03-25', 'Left'),
('Nikhil',    'Gupta',     'Male',   37, 2, 'Data Engineer',           '2018-12-11', 'Active'),
('Deepa',     'Rao',       'Female', 25, 3, 'Sales Executive',         '2023-08-15', 'Active'),
('Sanjay',    'Tiwari',    'Male',   50, 4, 'CFO',                     '2010-07-01', 'Active'),
('Asha',      'Bhatt',     'Female', 29, 5, 'Digital Marketing Exec',  '2022-02-14', 'Left'),
('Manohar',   'Das',       'Male',   40, 6, 'Supply Chain Analyst',    '2017-05-19', 'Active'),
('Kavitha',   'Suresh',    'Female', 27, 2, 'QA Engineer',             '2022-09-01', 'Active'),
('Rahul',     'Mishra',    'Male',   36, 1, 'Talent Acquisition Lead', '2019-03-03', 'Active'),
('Swathi',    'Narayan',   'Female', 28, 4, 'Junior Accountant',       '2023-01-20', 'Active'),
('Dinesh',    'Mohan',     'Male',   43, 3, 'Regional Sales Manager',  '2015-06-10', 'Active'),
('Rekha',     'Pillai',    'Female', 34, 6, 'Operations Analyst',      '2018-11-07', 'Left'),
('Siddharth', 'Shah',      'Male',   31, 2, 'Backend Developer',       '2020-04-16', 'Active'),
('Jyothi',    'Prasad',    'Female', 39, 5, 'Marketing Manager',       '2016-08-23', 'Active'),
('Arun',      'Kapoor',    'Male',   26, 3, 'Sales Intern',            '2024-01-05', 'Left'),
('Nisha',     'George',    'Female', 33, 1, 'HR Analyst',              '2020-07-27', 'Active'),
('Praveen',   'Choudhary', 'Male',   48, 4, 'Financial Controller',    '2013-09-14', 'Active'),
('Sindhu',    'Moorthi',   'Female', 22, 2, 'Junior Developer',        '2024-03-01', 'Active');

INSERT INTO salaries (emp_id, base_salary, bonus, effective_date) VALUES
(1,  72000,  8000,  '2024-01-01'),
(2,  85000,  10000, '2024-01-01'),
(3,  90000,  12000, '2024-01-01'),
(4,  55000,  4000,  '2024-01-01'),
(5,  115000, 18000, '2024-01-01'),
(6,  68000,  6000,  '2024-01-01'),
(7,  95000,  14000, '2024-01-01'),
(8,  50000,  3000,  '2024-01-01'),
(9,  80000,  9000,  '2024-01-01'),
(10, 74000,  8500,  '2024-01-01'),
(11, 42000,  2000,  '2024-01-01'),
(12, 92000,  13000, '2024-01-01'),
(13, 70000,  7000,  '2024-01-01'),
(14, 60000,  5000,  '2024-01-01'),
(15, 105000, 16000, '2024-01-01'),
(16, 54000,  4500,  '2024-01-01'),
(17, 180000, 30000, '2024-01-01'),
(18, 65000,  5500,  '2024-01-01'),
(19, 88000,  11000, '2024-01-01'),
(20, 67000,  6500,  '2024-01-01'),
(21, 83000,  9500,  '2024-01-01'),
(22, 48000,  3500,  '2024-01-01'),
(23, 98000,  15000, '2024-01-01'),
(24, 72000,  7500,  '2024-01-01'),
(25, 78000,  8800,  '2024-01-01'),
(26, 97000,  14500, '2024-01-01'),
(27, 38000,  1500,  '2024-01-01'),
(28, 76000,  8200,  '2024-01-01'),
(29, 135000, 22000, '2024-01-01'),
(30, 45000,  2500,  '2024-01-01');

INSERT INTO performance_reviews (emp_id, review_year, rating, promoted, overtime_hours) VALUES
(1,  2024, 4, 0, 12),
(2,  2024, 5, 1, 5),
(3,  2024, 4, 0, 8),
(4,  2024, 2, 0, 20),
(5,  2024, 5, 1, 10),
(6,  2024, 3, 0, 15),
(7,  2024, 4, 1, 7),
(8,  2024, 2, 0, 25),
(9,  2024, 3, 0, 9),
(10, 2024, 4, 0, 11),
(11, 2024, 1, 0, 30),
(12, 2024, 5, 1, 4),
(13, 2024, 3, 0, 14),
(14, 2024, 2, 0, 22),
(15, 2024, 5, 1, 6),
(16, 2024, 3, 0, 13),
(17, 2024, 5, 0, 3),
(18, 2024, 2, 0, 19),
(19, 2024, 4, 0, 8),
(20, 2024, 3, 0, 16),
(21, 2024, 4, 1, 7),
(22, 2024, 3, 0, 10),
(23, 2024, 5, 1, 5),
(24, 2024, 2, 0, 21),
(25, 2024, 4, 0, 9),
(26, 2024, 5, 1, 6),
(27, 2024, 1, 0, 28),
(28, 2024, 4, 0, 8),
(29, 2024, 5, 0, 2),
(30, 2024, 2, 0, 17);

INSERT INTO attrition (emp_id, leave_date, reason) VALUES
(4,  '2024-03-15', 'Better Opportunity'),
(8,  '2024-05-01', 'Personal Reasons'),
(11, '2024-02-10', 'Low Salary'),
(14, '2024-06-30', 'Work-Life Balance'),
(18, '2024-04-22', 'Better Opportunity'),
(24, '2024-07-15', 'Low Salary'),
(27, '2024-01-31', 'Performance Issues');


-- attrition rate by department
SELECT
    d.dept_name,
    COUNT(e.emp_id) AS total_employees,
    SUM(CASE WHEN e.status = 'Left' THEN 1 ELSE 0 END) AS left_count,
    ROUND(SUM(CASE WHEN e.status = 'Left' THEN 1 ELSE 0 END) * 100.0 / COUNT(e.emp_id), 2) AS attrition_pct
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
GROUP BY d.dept_name
ORDER BY attrition_pct DESC;


-- average salary by job role
SELECT
    e.job_role,
    ROUND(AVG(s.base_salary), 2) AS avg_salary,
    ROUND(AVG(s.bonus), 2) AS avg_bonus
FROM employees e
JOIN salaries s ON e.emp_id = s.emp_id
GROUP BY e.job_role
ORDER BY avg_salary DESC;


-- top performers in each department
SELECT * FROM (
    SELECT
        d.dept_name,
        CONCAT(e.first_name, ' ', e.last_name) AS emp_name,
        e.job_role,
        pr.rating,
        RANK() OVER (PARTITION BY d.dept_name ORDER BY pr.rating DESC) AS rnk
    FROM employees e
    JOIN departments d ON e.dept_id = d.dept_id
    JOIN performance_reviews pr ON e.emp_id = pr.emp_id
) t
WHERE rnk <= 2
ORDER BY dept_name, rnk;


-- employees earning below their department average
SELECT
    CONCAT(e.first_name, ' ', e.last_name) AS emp_name,
    d.dept_name,
    s.base_salary,
    ROUND(dept_avg.avg_sal, 2) AS dept_avg_salary
FROM employees e
JOIN salaries s ON e.emp_id = s.emp_id
JOIN departments d ON e.dept_id = d.dept_id
JOIN (
    SELECT e2.dept_id, AVG(s2.base_salary) AS avg_sal
    FROM employees e2
    JOIN salaries s2 ON e2.emp_id = s2.emp_id
    GROUP BY e2.dept_id
) dept_avg ON e.dept_id = dept_avg.dept_id
WHERE s.base_salary < dept_avg.avg_sal
ORDER BY d.dept_name;


-- gender salary comparison
SELECT
    gender,
    COUNT(*) AS total,
    ROUND(AVG(s.base_salary), 2) AS avg_salary
FROM employees e
JOIN salaries s ON e.emp_id = s.emp_id
GROUP BY gender;


-- department with highest overtime
SELECT
    d.dept_name,
    ROUND(AVG(pr.overtime_hours), 1) AS avg_overtime
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
JOIN performance_reviews pr ON e.emp_id = pr.emp_id
GROUP BY d.dept_name
ORDER BY avg_overtime DESC;


-- average tenure active vs left
SELECT
    e.status,
    ROUND(AVG(DATEDIFF(
        CASE WHEN e.status = 'Left' THEN a.leave_date ELSE CURDATE() END,
        e.hire_date
    ) / 365), 2) AS avg_tenure_years
FROM employees e
LEFT JOIN attrition a ON e.emp_id = a.emp_id
GROUP BY e.status;


-- why are employees leaving
SELECT
    reason,
    COUNT(*) AS total
FROM attrition
GROUP BY reason
ORDER BY total DESC;


-- salary rank within each department
SELECT
    d.dept_name,
    CONCAT(e.first_name, ' ', e.last_name) AS emp_name,
    s.base_salary,
    RANK() OVER (PARTITION BY d.dept_name ORDER BY s.base_salary DESC) AS salary_rank
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
JOIN salaries s ON e.emp_id = s.emp_id
ORDER BY d.dept_name, salary_rank;


-- flight risk employees
SELECT
    CONCAT(e.first_name, ' ', e.last_name) AS emp_name,
    d.dept_name,
    pr.rating,
    s.base_salary,
    CASE
        WHEN pr.rating <= 2 AND pr.promoted = 0 AND s.base_salary < 60000 THEN 'High Risk'
        WHEN pr.rating <= 3 AND pr.promoted = 0 THEN 'Medium Risk'
        ELSE 'Stable'
    END AS risk_level
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
JOIN performance_reviews pr ON e.emp_id = pr.emp_id
JOIN salaries s ON e.emp_id = s.emp_id
WHERE e.status = 'Active'
ORDER BY risk_level, pr.rating;
