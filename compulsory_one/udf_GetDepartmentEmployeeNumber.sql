CREATE FUNCTION dbo.udf_GetDepartmentEmployeeNumber(
    @DNumber NUMERIC(9,0)
)
RETURNS INT
AS
BEGIN
    DECLARE @EmpCount NUMERIC(9,0)
    SET @EmpCount = (SELECT COUNT(*) FROM Employee WHERE Dno = @DNumber)
    RETURN @EmpCount
END