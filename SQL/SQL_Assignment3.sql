-- Problem 1
GO
CREATE VIEW view_product_order_Zhang
AS
SELECT p.ProductID, p.ProductName, COUNT(od.Quantity) [TotalQuantity]
FROM dbo.Products p JOIN dbo.[Order Details] od ON p.ProductID = od.ProductID
GROUP BY p.ProductID, p.ProductName
GO
-- test
SELECT *
FROM dbo.view_product_order_Zhang 

-- Problem 2
GO
CREATE PROC sp_product_order_quantity_Zhang
@pid int,  
@tq int out
AS 
BEGIN 
	SELECT @tq = TotalQuantity
	FROM dbo.view_product_order_Zhang v
	WHERE v.ProductID = @pid
END
GO

-- test
BEGIN 
	DECLARE @total_quantity int 
	EXEC dbo.sp_product_order_quantity_Zhang 1, @total_quantity out
	SELECT @total_quantity
END

-- Problem 3
GO
CREATE PROC sp_product_order_city_Zhang
@pname varchar(20)
AS
BEGIN
	SELECT TOP 5 o.ShipCity, COUNT(od.Quantity) [TotalQuantity]
	FROM dbo.Products p JOIN dbo.[Order Details] od ON p.ProductID = od.ProductID 
		JOIN  dbo.Orders o ON o.OrderID = od.OrderID 
	WHERE p.ProductName = @pname
	GROUP BY o.ShipCity 
	ORDER BY [TotalQuantity] DESC 
END

-- test
EXEC dbo.sp_product_order_city_Zhang Chai

-- Problem 4
CREATE TABLE people_Zhang(
	Id  int NOT NULL IDENTITY(1,1),
	Name nvarchar(30) NOT NULL,
	City int NOT NULL,
	PRIMARY KEY (Id)
)

CREATE TABLE city_Zhang (
	Id int NOT NULL IDENTITY(1,1),
	City nvarchar(15) NOT NULL,
	PRIMARY KEY (Id)
)

INSERT INTO dbo.people_Zhang 
VALUES
('Aaron Rodgers', 2), 
('Russell Wilson', 1),
('Jody Nelson', 2)

INSERT INTO dbo.city_Zhang
VALUES
('Seattle'),
('Green Bay')

DELETE dbo.city_Zhang 
WHERE CIty = 'Seattle'

INSERT INTO dbo.city_Zhang
SELECT 'Madison'
FROM dbo.people_Zhang p LEFT JOIN dbo.city_Zhang c ON p.City = c.Id
WHERE c.Id IS NULL

UPDATE dbo.people_Zhang
SET City = (
    SELECT TOP 1 Id
    FROM dbo.city_Zhang
    ORDER BY Id DESC
)
WHERE City NOT IN (
    SELECT Id
    FROM dbo.city_Zhang
)

GO
CREATE VIEW Packers_Zhang
AS
SELECT p.Id, p.Name 
FROM dbo.people_Zhang p LEFT JOIN dbo.city_Zhang c ON p.City = c.Id
WHERE c.City = 'Green Bay'
GO

DROP TABLE dbo.people_Zhang
DROP TABLE dbo.city_Zhang
DROP VIEW  dbo.Packers_Zhang

-- Problem 5
GO
CREATE PROC sp_birthday_employees_Zhang
AS 
BEGIN 
	SELECT * INTO birthday_employees_Zhang
	FROM dbo.Employees e
	WHERE MONTH (e.BirthDate) = 2;
	DROP TABLE birthday_employees_Zhang;
END

-- test
EXEC dbo.sp_birthday_employees_Zhang 

SELECT * 
FROM dbo.Employees e
WHERE MONTH (e.BirthDate) = 2


-- Problem 6
SELECT * FROM dbo.Employees
MINUS 
SELECT * FROM dbo.Employees