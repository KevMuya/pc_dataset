CREATE DATABASE dboRaw_pc_Data;

SELECT
    "Continent",
    "Country or State",
    "Province or City",
    "Shop Name",
    "Shop Age",
    "PC Make",
    "PC Model",
    "Storage Type",
    "Customer Name",
    "Customer Surname",
    "Customer Contact Number",
    "Customer Email Address",
    "Sales Person Name",
    "Sales Person Department",
    "Payment Method",
    "Priority",
    "Channel",
    "Discount Amount",
    "Cost Price",
    "Sale Price",
    "Purchase Date",
    "Ship Date",
    "Finance Amount",
    "RAM",
    "Credit Score",
    "Cost of Repairs",
    "Total Sales per Employee",
    "PC Market Price",
    "Storage Capacity"
FROM public."dboRaw_pc_Data";

-- Give me a full list of all customers with contact number and email.
SELECT
    "Customer Name",
    "Customer Surname",
    "Customer Contact Number",
    "Customer Email Address"
FROM public."dboRaw_pc_Data";

-- Show every PC we sell with its make, model, and sale price.
SELECT
    "PC Make",
    "PC Model",
    "Sale Price"
FROM public."dboRaw_pc_Data";

-- Which sales people work in our shops, and in what department?
SELECT
    "Sales Person Name",
    "Sales Person Department"
FROM public."dboRaw_pc_Data";

-- List all shops we operate with the city and country they are in.
SELECT DISTINCT
    "Shop Name",
    "Province or City",
    "Country or State"
FROM public."dboRaw_pc_Data"
ORDER BY
    "Country or State";

-- Show the profit on each sale (Sale Price - Cost Price).
SELECT
    "Sale Price",
    ("Sale Price" - "Cost Price") AS profit
FROM public."dboRaw_pc_Data";

-- What are all the different payment methods our customers use?
SELECT DISTINCT
    "Payment Method"
FROM public."dboRaw_pc_Data";

-- Give me a list of all the distinct PC brands (makes) we stock.
SELECT DISTINCT
    "PC Make"
FROM public."dboRaw_pc_Data";

-- Show each sale with how much the customer saved (discount).
SELECT
    "Sale Price",
    "Discount Amount"
FROM public."dboRaw_pc_Data";

-- Display the market price versus our sale price for every PC.
SELECT
    "PC Model",
    "PC Market Price",
    "Sale Price"
FROM public."dboRaw_pc_Data";

-- List each sale's purchase date and ship date to check delays.
SELECT
    "Purchase Date",
    "Ship Date"
FROM public."dboRaw_pc_Data";
		