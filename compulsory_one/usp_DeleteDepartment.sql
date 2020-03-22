CREATE PROCEDURE dbo.usp_DeleteDepartment(
    @DNumber NUMERIC(9,0)
)
AS
BEGIN
    IF EXISTS (SELECT DNumber FROM Department WHERE DNumber = @DNumber)
        BEGIN
            BEGIN TRANSACTION
                DELETE FROM Dept_Locations WHERE DNumber = @DNumber;
                
                DELETE FROM Works_on 
                WHERE EXISTS (
                    SELECT *
                    FROM Project 
                    JOIN Works_on ON PNumber = Pno
                    WHERE Project.DNum = @DNumber 
                );

                DELETE FROM Project WHERE DNum = @DNumber;

                UPDATE Employee SET Dno = NULL WHERE Dno = @DNumber;

                DELETE FROM Department WHERE DNumber = @DNumber;
            COMMIT
        END
    ELSE
        THROW 50001, 'Department does not exist', 1;
END;