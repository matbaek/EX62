USE C_DB10_2018;

GO

CREATE VIEW AllOrderLines

AS

	SELECT _order.Order_Id, customer.FName, customer.LName, _order.Order_Date, 
			product.Prod_Name, product.Price, orderLine.Amount
	FROM EX62_OrderLine AS orderLine
		JOIN EX62_Order AS _order ON orderLine.Order_Id = _order.Order_Id
		JOIN EX62_Product AS product ON orderLine.Product_Id = product.Product_Id
		JOIN EX62_Customer AS customer ON _order.Customer = customer.Customer_Id

GO

-- Query the view  
SELECT Order_Id, FName, LName, CONVERT(DATE, Order_Date) AS Order_date, Prod_Name, Price, Amount
FROM AllOrderLines
ORDER BY Order_Id;  