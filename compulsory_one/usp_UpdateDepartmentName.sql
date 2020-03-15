CREATE PROCEDURE usp_UpdateDepartmentName(
    @DNumber NUMERIC(9,0),
    @DName VARCHAR(50)
)
AS
BEGIN
    IF NOT EXISTS (SELECT DName FROM Company.dbo.Department WHERE DName = @DName)
        UPDATE Company.dbo.Department SET DName = @DName WHERE DNumber = @DNumber;
    ELSE 
        THROW 50001, 'Department name already in use', 1;
END;