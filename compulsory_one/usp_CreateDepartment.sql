CREATE PROCEDURE dbo.usp_CreateDepartment (
    @DName VARCHAR(50),
    @MgrSSN NUMERIC(9,0)
)
AS
BEGIN
    DECLARE @DNumber NUMERIC(3,0) = (
        SELECT TOP 1 (DNumber + 1) 
        FROM Department
        ORDER BY DNumber DESC
    );
    DECLARE @StartDate DATE = GETDATE();
	INSERT INTO Department VALUES (@DName, @DNumber, @MgrSSN, @StartDate);
END;