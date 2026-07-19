/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [Transaction ID]
      ,[Date]
      ,[Customer ID]
      ,[Gender]
      ,[Age]
      ,[Product Category]
      ,[Quantity]
      ,[Price per Unit]
      ,[Total Amount]
  FROM [RetailDB].[dbo].[Sheet1$]

SELECT SUM([Total Amount])
AS Total_Revenue
FROM [RetailDB].[dbo].[Sheet1$]

SELECT AVG([Total Amount])
AS Average_Purchase_Amount
FROM [RetailDB].[dbo].[Sheet1$]

SELECT [Product Category],
SUM([Total Amount]) As Revenue
FROM [RetailDB].[dbo].[Sheet1$]
GROUP BY [Product Category]
ORDER BY Revenue DESC;

SELECT [Gender],
SUM([Total Amount]) As Revenue
FROM [RetailDB].[dbo].[Sheet1$]
GROUP BY [Gender]
ORDER BY Revenue DESC;

SELECT TOP 10 [Customer ID],
SUM([Total Amount])
AS Total_Spent
FROM [RetailDB].[dbo].[Sheet1$]
GROUP BY [Customer ID]
ORDER BY Total_Spent DESC;

SELECT FORMAT([Date], 'yyyy-MM') AS Month,
SUM([Total Amount]) AS Revenue
FROM [RetailDB].[dbo].[Sheet1$]
GROUP BY FORMAT([Date], 'yyyy-MM')
ORDER BY Month;

SELECT AVG([Age])
AS Average_Age
FROM [RetailDB].[dbo].[Sheet1$]

SELECT
    CASE
        WHEN [Age] < 18 THEN 'Under 18'
        WHEN [Age] BETWEEN 18 AND 25 THEN '18-25'
        WHEN [Age] BETWEEN 26 AND 35 THEN '26-35'
        WHEN [Age] BETWEEN 36 AND 50 THEN '36-50'
        ELSE 'Above 50'
    END AS Age_Group,
    SUM([Total Amount]) AS Revenue
FROM [RetailDB].[dbo].[Sheet1$]
GROUP BY
    CASE
        WHEN [Age] < 18 THEN 'Under 18'
        WHEN [Age] BETWEEN 18 AND 25 THEN '18-25'
        WHEN [Age] BETWEEN 26 AND 35 THEN '26-35'
        WHEN [Age] BETWEEN 36 AND 50 THEN '36-50'
        ELSE 'Above 50'
    END
ORDER BY Revenue DESC;

SELECT TOP 1
	[Product Category],
	SUM([Total Amount]) AS Revenue
FROM [RetailDB].[dbo].[Sheet1$]
GROUP BY [Product Category]
ORDER BY Revenue DESC;
