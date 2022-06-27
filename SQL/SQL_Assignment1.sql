-- Problem 1
SELECT [ProductID], [Name], [Color], [ListPrice]
FROM [Production].[Product] 

-- Problem 2
SELECT [ProductID], [Name], [Color], [ListPrice]
FROM [Production].[Product]
WHERE [ListPrice] != 0

-- Problem 3
SELECT [ProductID], [Name], [Color], [ListPrice]
FROM [Production].[Product]
WHERE [Color] IS NOT NULL

-- Problem 4
SELECT [ProductID], [Name], [Color], [ListPrice]
FROM [Production].[Product]
WHERE [Color] IS NOT NULL AND [ListPrice] > 0

-- Problem 5
SELECT CONCAT([Name], [Color]) AS [Name Color]
FROM [Production].[Product]
WHERE [Color] IS NOT NULL

-- Problem 6
SELECT TOP(6) 'NAME:' + [Name] + ' -- COLOR:'+ [Color] as [Name Color]
FROM [Production].[Product]
WHERE [Color] IS NOT NULL
-- WHERE [Name] IN ('LL Crankarm ', 'ML Crankarm', 'HL Crankarm','Chainring Bolts', 'Chainring Nut', 'Chainring' )
--     AND [Color] IN ('Black', 'Silver')

-- Problem 7
SELECT [ProductID], [Name]
FROM [Production].[Product]
WHERE [ProductID] BETWEEN 400 AND 500

-- Problem 8
SELECT [ProductID], [Name], [Color]
FROM [Production].[Product]
WHERE [Color] IN ('Blue', 'Black')

-- Problem 9
SELECT [Name]
FROM [Production].[Product]
WHERE [Name] LIKE ('S%')

-- Problem 10
SELECT [Name], [ListPrice]
FROM [Production].[Product]
WHERE [Name] LIKE ('A%') OR [Name] LIKE ('S%')
ORDER BY [Name]

-- Problem 11
SELECT [Name]
FROM [Production].[Product]
-- WHERE [Name] LIKE ('SPO%') AND [Name] NOT LIKE ('SPOK%')
-- ORDER BY [Name]
WHERE [Name] LIKE 'spo[^k]%' 
ORDER BY [Name]

-- Problem 12
SELECT DISTINCT ISNULL([ProductSubcategoryID], 0), ISNULL([Color],'Unknown')
FROM [Production].[Product]
