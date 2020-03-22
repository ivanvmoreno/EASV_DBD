CREATE PROCEDURE dbo.usp_GetDepartment(
    @DNumber NUMERIC(9,0)
)
AS
BEGIN
    SELECT DName, COUNT(*) AS total_employees
    FROM Employee 
        LEFT JOIN Department ON Employee.Dno = Department.DNumber
    WHERE Employee.Dno = @DNumber
    GROUP BY DName;
END;