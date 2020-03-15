CREATE PROCEDURE usp_DeleteDepartment(
    @DNumber NUMERIC(9,0)
)
AS
BEGIN
    IF EXISTS (SELECT DNumber FROM Company.dbo.Department WHERE DNumber = @DNumber)
        BEGIN
            DELETE FROM Company.dbo.Department WHERE DNumber = @DNumber;
            
            DELETE FROM Company.dbo.Dept_Locations WHERE DNumber = @DNumber;

            DECLARE @DepartmentProjects TABLE(PNumber NUMERIC(9,0) NOT NULL);
            
            INSERT INTO @DepartmentProjects (PNumber)
            SELECT PNumber 
            FROM Company.dbo.Project
            WHERE DNum = @DNumber;
            
            DELETE FROM Company.dbo.Project WHERE DNum = @DNumber;
            
            DELETE FROM Company.dbo.Works_on 
            WHERE EXISTS (
                SELECT * 
                FROM @DepartmentProjects 
                JOIN Company.dbo.Works_on ON PNumber = Pno 
            );

            UPDATE Company.dbo.Employee SET Dno = NULL WHERE Dno = @DNumber;
        END
    ELSE
        THROW 50001, 'Department does not exist', 1;
END;