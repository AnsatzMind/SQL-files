SELECT deptId , COUNT(empId) AS No_of_emp_per_dept
FROM tblEmployee
GROUP BY deptId


SELECT
      CASE
         WHEN GROUPING(deptId)= 1 THEN 'Grand Total'
         ELSE ISNULL(deptId , 'Unassigned') 
       END  AS Department,
COUNT(empId) AS No_of_emp_per_dept, (SELECT COUNT(empId) FROM tblEmployee) AS total_employees
FROM tblEmployee
GROUP BY ROLLUP(deptId)

SELECT 
    CASE 
        WHEN GROUPING(deptId) = 1 THEN 'GRAND TOTAL'
        ELSE ISNULL(deptId, 'Unassigned') 
    END AS Department, 
    COUNT(empId) AS No_of_emp_per_dept
FROM tblEmployee
GROUP BY ROLLUP(deptId);

SELECT tblEmployee.empName AS Name, ISNULL(tblDepartment.deptName,'*****') AS Department
FROM tblEmployee 
   LEFT JOIN tblDepartment
       ON tblEmployee.deptId = tblDepartment.deptId


SELECT DATENAME(WEEKDAY,empDOB )
FROM tblEmployee


;