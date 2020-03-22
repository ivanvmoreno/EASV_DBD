CREATE PROCEDURE dbo.usp_GetAllDepartment
AS
BEGIN
    SELECT DName, COUNT(*) AS total_employees
    FROM Employee 
        LEFT JOIN Department ON Employee.Dno = Department.DNumber
    GROUP BY DName;
END