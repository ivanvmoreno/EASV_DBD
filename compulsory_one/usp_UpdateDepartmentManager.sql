CREATE PROCEDURE usp_UpdateDepartmentManager(
    @DNumber NUMERIC(9,0),
    @MgrSSN NUMERIC(9, 0)
)
AS
BEGIN
    IF @MgrSSN <> (SELECT MgrSSN FROM Company.dbo.Department WHERE DNumber = @DNumber)
        BEGIN
            UPDATE Company.dbo.Department SET MgrSSN = @MgrSSN WHERE DNumber = @DNumber;
            UPDATE Company.dbo.Employee SET SuperSSN = @MgrSSN WHERE Dno = @DNumber AND SSN <> @MgrSSN;
        END
    ELSE
        THROW 50001, 'Department name already in use', 1;
END;