--CREATE TABLE EX62_DeletedCustomer
--(
--	--Note no PK or even IDENTITY as data are inserted "as is" 
--	Id INTEGER, 
--	FName NVARCHAR(40),
--	LName NVARCHAR(40),
--	Zip NVARCHAR(4)
--)

CREATE TRIGGER AfterDeleteCustomer ON EX62_Customer 
AFTER DELETE
AS
	DECLARE @customerID int;
	DECLARE @customerFName nvarchar(40);
	DECLARE @customerLName nvarchar(40);
	DECLARE @customerZip nvarchar(4);

	SELECT @customerID=d.Customer_Id FROM deleted d;	
	SELECT @customerFName=d.FName FROM deleted d;	
	SELECT @customerLName=d.LName FROM deleted d;	
	SELECT @customerZip=d.Zip FROM deleted d;	

	INSERT INTO EX62_DeletedCustomer 
		(Id, FName, LName, Zip)
	VALUES
		(@customerID, @customerFName, @customerLName, @customerZip);

	PRINT 'AFTER DELETE TRIGGER fired.'
GO