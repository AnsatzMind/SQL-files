DROP PROCEDURE IF EXISTS top_salary_employees
GO

CREATE PROCEDURE top_salary_employees
       @param1 VARCHAR(10)
   AS
BEGIN 

SELECT
    e.empId AS Employee_Id,
    e.empName AS Employee_Name,
    ISNULL(empDesignation,'UNASSIGNED') AS Designation,
    CASE 
        WHEN GROUPING(e.empId) = 1 THEN 'Grand Total'
        ELSE ISNULL(d.deptName,'EMPTY')
    END AS Department,
    SUM(ISNULL(e.empSalary,0)) AS Salary
FROM tblEmployee AS e
LEFT JOIN tblDepartment AS d
    ON e.deptId = d.deptId
WHERE e.empStatus = @param1 AND e.empSalary > 10000
GROUP BY ROLLUP((e.empId, e.empName, d.deptName, e.empDesignation))
ORDER BY GROUPING(e.empId) , Salary DESC;
END
;
GO