-- Problem 1
SELECT cr.[Name] AS [Country], sp.[Name] AS [Province]
FROM person.[CountryRegion] AS cr JOIN person.[StateProvince] AS sp 
    ON cr.[CountryRegionCode] = sp.[CountryRegionCode]

-- answer
SELECT c.Name AS Country, s.Name AS Province  
FROM Person.CountryRegion c  JOIN Person.StateProvince s 
    ON c.CountryRegionCode = s.CountryRegionCode;

-- Problem 2
SELECT cr.[Name] AS [Country], sp.[Name] AS [Province]
FROM person.[CountryRegion] AS cr JOIN person.[StateProvince] AS sp 
    ON cr.[CountryRegionCode] = sp.[CountryRegionCode]
WHERE cr.[Name] IN ('Germany', 'Canada')

-- answer
SELECT c.Name AS Country, s.Name AS Province  
FROM Person.CountryRegion c  JOIN Person.StateProvince s 
    ON c.CountryRegionCode = s.CountryRegionCode 
WHERE c.Name NOT IN ('Germany', 'Canada');

-- Problem 3
SELECT DISTINCT p.[ProductID], p.[ProductName], p.[UnitPrice]
FROM dbo.[Orders] AS o JOIN dbo.[Order Details] AS od ON o.[OrderID] = od.[OrderID]
    JOIN dbo.[Products] AS p ON od.[ProductID] = p.[ProductID]
WHERE o.[OrderDate] > DATEADD(year,-25,GETDATE())

-- Problem 4
SELECT dt.[ShipPostalCode]
FROM
(SELECT TOP 5 o.[ShipPostalCode], COUNT(o.[ShipPostalCode]) AS Num
FROM dbo.[Orders] AS o
WHERE o.[ShipPostalCode] IS NOT NULL AND o.[OrderDate] > DATEADD(year,-25,GETDATE())
GROUP BY o.[ShipPostalCode]
ORDER BY Num DESC) AS dt

-- Problem 5
SELECT dt.[ShipCity], COUNT(dt.[CustomerID]) AS [CustmoerNum]
FROM 
(SELECT DISTINCT o.[ShipCity], c.[CustomerID]
FROM dbo.[Orders] AS o JOIN dbo.[Customers] AS c ON o.[CustomerID] = c.[CustomerID]) AS dt
GROUP BY dt.[ShipCity]

-- Problem 6
SELECT dt.[ShipCity], COUNT(dt.[CustomerID]) AS [CustomerNum]
FROM 
(SELECT DISTINCT o.[ShipCity], c.[CustomerID]
FROM dbo.[Orders] AS o JOIN dbo.[Customers] AS c ON o.[CustomerID] = c.[CustomerID]) AS dt
GROUP BY dt.[ShipCity]
HAVING COUNT(dt.[CustomerID]) > 2

-- Problem 7
SELECT c.[ContactName], SUM(od.[Quantity]) AS [BoughtNum]
FROM dbo.[Orders] AS o JOIN dbo.[Order Details] AS od ON o.[OrderID] = od.[OrderID]
    JOIN dbo.[Customers] AS c ON o.[CustomerID] = c.[CustomerID]
GROUP BY c.[ContactName]

-- Problem 8
SELECT c.[CustomerID], SUM(od.[Quantity]) AS [BoughtNum]
FROM dbo.[Orders] AS o JOIN dbo.[Order Details] AS od ON o.[OrderID] = od.[OrderID]
    JOIN dbo.[Customers] AS c ON o.[CustomerID] = c.[CustomerID]
GROUP BY c.[CustomerID]
HAVING SUM(od.[Quantity]) > 100

-- Problem 9
WITH [order_product]
AS
(
    SELECT DISTINCT p.[SupplierID], o.[ShipVia]
    FROM dbo.[Orders] AS o JOIN dbo.[Order Details] AS od ON o.[OrderID] = od.[OrderID]
    JOIN dbo.[Products] AS p ON od.[ProductID] = p.[ProductID]
)
SELECT sup.[CompanyName] AS [Supplier Company Name], sh.[CompanyName] AS [Shipping Company Name]
FROM [order_product] AS op JOIN dbo.[Suppliers] AS sup ON op.[SupplierID] = sup.[SupplierID]
    JOIN dbo.[Shippers] AS sh ON op.[Shipvia] = sh.[ShipperID]

-- Problem 10
SELECT o.[OrderDate], p.[ProductName]
FROM dbo.[Orders] AS o JOIN dbo.[Order Details] AS od ON o.[OrderID] = od.[OrderID]
    JOIN dbo.[Products] AS p ON od.[ProductID] = p.[ProductID]

-- Problem 11
SELECT e1.[FirstName] + ' ' + e1.[LastName] AS [First Employee], 
    e2.[FirstName] + ' ' + e2.[LastName] AS [Second Employee]
FROM dbo.[Employees] AS e1 CROSS JOIN dbo.[Employees] AS e2 
WHERE e1.[Title] = e2.[Title] AND e1.[EmployeeID] <> e2.[EmployeeID]

-- Problem 12
SELECT e.[FirstName] + ' ' + e.[LastName] AS [Manager]
FROM
(SELECT e1.[ReportsTo], COUNT(e1.[ReportsTo]) AS [ReportNum]
FROM dbo.[Employees] AS e1 JOIN dbo.[Employees] AS e2 ON e1.[ReportsTo] = e2.[EmployeeID]
GROUP BY e1.[ReportsTo]
HAVING COUNT(e1.[ReportsTo]) > 2) AS dt, dbo.[Employees] AS e 
WHERE dt.[ReportsTo] = e.[EmployeeID]

-- Problem 13
SELECT [City], [CompanyName] AS [Name], [ContactName], 'Customer' [Type]
FROM dbo.[Customers]
UNION
SELECT [City], [CompanyName] AS [Name], [ContactName], 'Supplier' [Type]
FROM dbo.[Suppliers]

-- Problem 14
SELECT DISTINCT e.[City]
FROM dbo.[Employees] AS e JOIN dbo.[Customers] AS c ON e.[City] = c.[City]

-- Problem 15
-- a.
SELECT DISTINCT c.[City]
FROM dbo.[Customers] AS c 
WHERE c.[City] NOT IN (
    SELECT e.[City]
    FROM dbo.[Employees] AS e 
)
-- b.
SELECT DISTINCT c.[City]
FROM dbo.[Customers] AS c LEFT JOIN dbo.[Employees] AS e ON c.[City] = e.[City]
WHERE e.[EmployeeID] IS NULL
-- Problem 16
SELECT p.[ProductName], SUM(od.[Quantity]) AS [TotalNum]
FROM dbo.[Orders] AS o JOIN dbo.[Order Details] AS od ON o.[OrderID] = od.[OrderID]
    JOIN dbo.[Products] AS p ON od.[ProductID] = p.[ProductID]
GROUP BY p.[ProductName]
ORDER BY [TotalNum] DESC

-- Problem 17
-- a.
-- Why union?

--b.
SELECT c.[City]
FROM dbo.[Customers] AS c
GROUP BY c.[City]
HAVING COUNT(c.[City]) >= 2

-- Problem 18
WITH customer_product
AS (
    SELECT DISTINCT c.[City], p.[ProductName]
    FROM dbo.[Customers] AS c JOIN dbo.[Orders] AS o ON o.[CustomerID] = c.[CustomerID]
        JOIN dbo.[Order Details] AS od ON o.[OrderID] = od.[OrderID]
        JOIN dbo.[Products] AS p ON od.[ProductID] = p.[ProductID]
)

SELECT cp.[City]
FROM customer_product as cp
GROUP BY cp.[City]
Having COUNT(cp.[City]) >= 2

-- Problem 19
WITH customer_product
AS (
    SELECT TOP 5 od.[ProductID], AVG(od.[UnitPrice]) AS [AvgPrice], 
    ROW_NUMBER() OVER(ORDER BY SUM(od.[Quantity]) DESC) AS [RN]
    FROM dbo.[Order Details] AS od 
    GROUP BY od.[ProductID]
)

SELECT p.[ProductID], cp2.[AvgPrice], dt.[City]
FROM (
    SELECT TOP 5 c.[City] AS [City], ROW_NUMBER() OVER(ORDER BY SUM(od.[Quantity]) DESC) AS [RN]
    FROM [customer_product] AS cp JOIN dbo.[Order Details] AS od ON od.[ProductID] = cp.[ProductID]
    JOIN dbo.[Orders] AS o ON o.[OrderID] = od.[OrderID]
    JOIN dbo.[Customers] AS c ON o.[CustomerID] = c.[CustomerID]
    GROUP BY c.[City]
) AS dt JOIN [customer_product] AS cp2 ON dt.[RN] = cp2.[RN] 
JOIN dbo.[Products] AS p ON cp2.[ProductID] = p.[ProductID]
ORDER BY cp2.[AvgPrice]

select top 5 ProductID, AVG(UnitPrice) as AvgPrice,
    (select top 1 City 
    from Customers c join Orders o on o.CustomerID=c.CustomerID 
        join [Order Details] od2 on od2.OrderID=o.OrderID 
    where od2.ProductID=od1.ProductID 
    group by city 
    order by SUM(Quantity) desc) as City 
from [Order Details] od1 
group by ProductID  
order by sum(Quantity) desc

-- Problem 20
SELECT dt.[City]
FROM (
    SELECT TOP 1 e.[City]
    FROM dbo.[Employees] AS e JOIN dbo.[Orders] AS o ON e.[EmployeeID] = o.[EmployeeID]
    GROUP BY e.[City]
    ORDER BY COUNT(e.[City]) DESC
    ) AS dt, 
     (
    SELECT TOP 1 c.[City]
    FROM dbo.[Customers] AS c JOIN dbo.[Orders] AS o ON c.[CustomerID] = o.[CustomerID]
        JOIN dbo.[Order Details] AS od ON o.[OrderID] = od.[OrderID]
    GROUP BY c.[City]
    ORDER BY COUNT(od.[Quantity]) DESC
    ) AS dt2
WHERE dt.[City] = dt2.[City]

-- Problem 21
DELETE c1
FROM dbo.[Customers] c1, dbo.[Customers] c2
WHERE c1.[CompanyName] = c2.[CompanyName] AND c1.[ContactName] = c2.[ContactName] 
    AND c1.[ContactTitle] = c2.[ContactTitle] AND c1.[CustomerID] > c2.[CustomerID]
    