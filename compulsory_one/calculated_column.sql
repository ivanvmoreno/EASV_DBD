ALTER TABLE Department ADD EmpCount AS dbo.udf_GetDepartmentEmployeeNumber(DNumber);