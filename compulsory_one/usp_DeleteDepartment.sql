CREATE PROCEDURE dbo.usp_DeleteDepartment(
    @DNumber NUMERIC(9,0)
)
AS
BEGIN
    IF EXISTS (SELECT DNumber FROM Department WHERE DNumber = @DNumber)
        BEGIN
            DELETE FROM Department WHERE DNumber = @DNumber;
            
            DELETE FROM Dept_Locations WHERE DNumber = @DNumber;

            DECLARE @DepartmentProjects TABLE(PNumber NUMERIC(9,0) NOT NULL);
            
            INSERT INTO @DepartmentProjects (PNumber)
            SELECT PNumber 
            FROM Project
            WHERE DNum = @DNumber;
            
            DELETE FROM Project WHERE DNum = @DNumber;
            
            DELETE FROM Works_on 
            WHERE EXISTS (
                SELECT * 
                FROM @DepartmentProjects 
                JOIN Works_on ON PNumber = Pno 
            );

            UPDATE Employee SET Dno = NULL WHERE Dno = @DNumber;
        END
    ELSE
        THROW 50001, 'Department does not exist', 1;
END;