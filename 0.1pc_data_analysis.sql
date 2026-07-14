SELECT TOP (1000) [Continent]
      ,[Country_or_State]
      ,[Province_or_City]
      ,[Shop_Name]
      ,[Shop_Age]
      ,[PC_Make]
      ,[PC_Model]
      ,[Storage_Type]
      ,[Customer_Name]
      ,[Customer_Surname]
      ,[Customer_Contact_Number]
      ,[Customer_Email_Address]
      ,[Sales_Person_Name]
      ,[Sales_Person_Department]
      ,[Payment_Method]
      ,[Priority]
      ,[Channel]
      ,[Discount_Amount]
      ,[Cost_Price]
      ,[Sale_Price]
      ,[Purchase_Date]
      ,[Ship_Date]
      ,[Finance_Amount]
      ,[RAM]
      ,[Credit_Score]
      ,[Cost_of_Repairs]
      ,[Total_Sales_per_Employee]
      ,[PC_Market_Price]
      ,[Storage_Capacity]
  FROM [cash_crusarders].[dbo].[raw_pc_data]

-- 1.Show all sales that were paid for using Finance.
SELECT * 
  FROM [cash_crusarders].[dbo].[raw_pc_data]
  WHERE [Payment_Method] = 'finance'

-- 2.Which customers bought online with a High priority order?
SELECT [Customer_Name],
       [Customer_Surname],
       [Channel],
       [Priority]
  FROM [cash_crusarders].[dbo].[raw_pc_data]
  WHERE [Channel] = 'online' AND [Priority]= 'high'

-- 3.List sales in Africa where the credit score was above 700.
SELECT *
FROM [cash_crusarders].[dbo].[raw_pc_data]
WHERE [Continent]= 'africa' AND [Credit_Score] > 700
ORDER BY [Credit_Score] 

-- 4.Show every PC sold for more than R20,000.

SELECT *
FROM [cash_crusarders].[dbo].[raw_pc_data]
WHERE [Sale_Price] > 20000
ORDER BY [Sale_Price]

-- 5.Which sales have no ship date (N/A) — not yet shipped?
SELECT * 
FROM [cash_crusarders].[dbo].[raw_pc_data]
WHERE [Ship_Date]= 'N/A'

-- 6.Find all repairs handled by the Repairs department.

SELECT *
FROM [cash_crusarders].[dbo].[raw_pc_data]
WHERE [Sales_Person_Department]='repairs'

-- 7.Show sales where we gave a discount of more than R500

SELECT *
FROM [cash_crusarders].[dbo].[raw_pc_data]
WHERE [Discount_Amount] >500
ORDER BY [Discount_Amount]

-- 8.Which PCs were sold below their market price?

SELECT *
FROM [cash_crusarders].[dbo].[raw_pc_data]
WHERE [Sale_Price] < [PC_Market_Price]

-- 9.List all customers whose surname starts with the letter "B"
SELECT *
FROM [cash_crusarders].[dbo].[raw_pc_data]
WHERE [Customer_Surname] LIKE 'B%'

--9.Show North America sales that were paid in Cash
SELECT *
FROM [cash_crusarders].[dbo].[raw_pc_data]
WHERE [Continent]= 'North America' AND [Payment_Method]='cash'

--10. Give me a full list of all customers with contact number and email.
SELECT[Customer_Name],
      [Customer_Surname],
      [Customer_Contact_Number],
      [Customer_Email_Address]
FROM [cash_crusarders].[dbo].[raw_pc_data]

-- 11.Show every PC we sell with its make, model, and sale price.
SELECT [PC_Make],
       [PC_Model],
       [Sale_Price]
FROM [cash_crusarders].[dbo].[raw_pc_data]

-- 12.Which sales people work in our shops, and in what department?
SELECT  [Shop_Name],
        [Sales_Person_Name],
        [Sales_Person_Department]
FROM [cash_crusarders].[dbo].[raw_pc_data]

-- 13.List all shops we operate with the city and country they are in.
SELECT [Shop_Name],
       [Province_or_City],
       [Country_or_State]
  FROM [cash_crusarders].[dbo].[raw_pc_data]
  ORDER BY [Country_or_State]

-- 14 Show the profit on each sale (Sale Price - Cost Price)
SELECT *,
       [Sale_Price] - [Cost_Price] AS Profit
FROM [cash_crusarders].[dbo].[raw_pc_data]

-- 15.What are all the different payment methods our customers use?
SELECT DISTINCT 
    [Payment_Method]
FROM [cash_crusarders].[dbo].[raw_pc_data]

-- 16.Give me a list of all the distinct PC brands (makes) we stock.
SELECT DISTINCT 
    [PC_Make]
 FROM [cash_crusarders].[dbo].[raw_pc_data] 

-- 17.Show each sale with how much the customer saved (discount).
SELECT [Customer_Name],
       [Shop_Name],
       [PC_Make],
       [Sale_Price],
       [Discount_Amount]
FROM [cash_crusarders].[dbo].[raw_pc_data] 
    
-- 18.Display the market price versus our sale price for every PC
SELECT [PC_Make],
       [PC_Market_Price],
       [Sale_Price]
  FROM [cash_crusarders].[dbo].[raw_pc_data]

-- 19.List each sale's purchase date and ship date to check delays.
SELECT [Purchase_Date],
       [Ship_Date]
FROM [cash_crusarders].[dbo].[raw_pc_data];
  

