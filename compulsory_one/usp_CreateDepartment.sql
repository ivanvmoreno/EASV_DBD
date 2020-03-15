CREATE PROCEDURE usp_CreateDepartment (
    @DName VARCHAR(50),
    @MgrSSN NUMERIC(9,0)
)
AS
BEGIN
    DECLARE @DNumber NUMERIC(3,0) = (
        SELECT TOP 1 (DNumber + 1) 
        FROM Company.dbo.Department
        ORDER BY DNumber DESC
    );
    DECLARE @StartDate DATE = GETDATE();
	INSERT INTO Company.dbo.Department VALUES (@DName, @DNumber, @MgrSSN, @StartDate);
END;