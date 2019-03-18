USE C_DB10_2018;

GO

CREATE VIEW Administration

AS

	SELECT employee.FName, employee.LName, employee.Zip, zipCity.City
	FROM EX62_Employee AS employee
		JOIN EX62_ZipCity AS zipCity ON employee.Zip = zipCity.Zip
		JOIN EX62_Department AS department ON employee.Dep_Id = department.Dep_Id
	WHERE department.Dept_Name = 'Administration'
GO

-- Query the view  
SELECT FName, LName, Zip, City
FROM Administration