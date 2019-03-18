USE C_DB10_2018;

GO

CREATE VIEW AllEmployees

AS

	SELECT employee.Emp_Id, employee.FName, employee.LName, employee.Zip,
			zipCity.City, department.Dept_Name, manager.Manager
	FROM EX62_Employee AS employee
		JOIN EX62_ZipCity AS zipCity ON employee.Zip = zipCity.Zip
		JOIN EX62_Department AS department ON employee.Dep_Id = department.Dep_Id
		JOIN EX62_Manager AS manager ON employee.Dep_Id = manager.Dep_Id

GO

-- Query the view  
SELECT Emp_Id, FName, LName, Zip, City, Dept_Name, Manager
FROM AllEmployees
ORDER BY Emp_Id;  