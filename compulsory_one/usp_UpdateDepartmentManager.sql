CREATE PROCEDURE dbo.usp_UpdateDepartmentManager(
    @DNumber NUMERIC(9,0),
    @MgrSSN NUMERIC(9, 0)
)
AS
BEGIN
    IF @MgrSSN <> (SELECT MgrSSN FROM Department WHERE DNumber = @DNumber)
        BEGIN
            BEGIN TRANSACTION
                UPDATE Department SET MgrSSN = @MgrSSN WHERE DNumber = @DNumber;
                UPDATE Employee SET SuperSSN = @MgrSSN WHERE Dno = @DNumber AND SSN <> @MgrSSN;
            COMMIT
        END
    ELSE
        THROW 50001, 'Employee is already the department manager', 1;
END;