
--Problem 1 - Total sale on monthly basis

SELECT
    SUM(CASE WHEN Date >= '2022-04-01' AND Date <= '2022-04-30' THEN amount ELSE 0 END) AS April_sale,
    SUM(CASE WHEN Date >= '2022-05-01' AND Date <= '2022-05-31' THEN amount ELSE 0 END) AS May_sale,
    SUM(CASE WHEN Date >= '2022-06-01' AND Date <= '2022-06-30' THEN amount ELSE 0 END) AS June_sale
FROM
    Portfolio_project..Amazon_Sale
WHERE
    Date >= '2022-04-01' AND Date <= '2022-06-30'
AND 
	Status != 'Cancelled'


--Problem 2 - Identify the states with highest and lowest purchases,
--along with their respective total revenue contributions.

SELECT
    Shipped_state,
    COUNT(Shipped_state) AS Total_state_purchase,
    SUM(Amount) AS Total_Revenue
FROM
    Portfolio_project..Amazon_Sale
WHERE
	Status != 'Cancelled'
GROUP BY
    Shipped_state 
ORDER BY 
	Total_Revenue DESC;


--Problem 3 - Product Popularity and the revenue generated 

WITH ProductPurchase as(
SELECT
	Style,
	COUNT(Style) as Total_purchase,
	Category,
	SUM(Amount) as Total_revenue
FROM 
	Portfolio_project..Amazon_Sale
WHERE
	Status != 'Cancelled'
GROUP BY 
	Style, Category
)
SELECT
	Style, Total_purchase,
	Category,
	Total_revenue
FROM
	ProductPurchase
ORDER BY
	Total_revenue DESC


--Problem 4 - Product which got the highest cancellation rate

SELECT TOP 10
	Status
	Category, 
	Style,
	Count(Style) as Total_Cancellations
FROM
	Portfolio_project..Amazon_Sale
WHERE
	Status like '%Cancel%'
GROUP BY 
	Style, Category, Status
ORDER BY 
	Total_Cancellations DESC


--Problem 5 Peak sale days

SELECT Top 10
    Date,
    SUM(Amount) AS Total_Sale_Revenue
FROM
    Portfolio_project..Amazon_Sale
WHERE
	Status != 'Cancelled'
GROUP BY
    Date
ORDER BY
    Total_Sale_Revenue DESC


--Problem 6 - Product performance on monthly basis

--April

SELECT TOP 1 
    Style,
    Category,
    Count(Style) as Total_style,
    Sum(Amount) as Total_amount
FROM
    Portfolio_project..Amazon_Sale
WHERE
    Date >= '2022-04-01' AND Date <= '2022-04-30' 
	And Status!= 'Cancelled'
GROUP BY 
    Style, Category
ORDER BY
    Total_style DESC;

--May

SELECT TOP 1 
    Style,
    Category,
    Count(Style) as Total_style,
    Sum(Amount) as Total_amount
FROM
    Portfolio_project..Amazon_Sale
WHERE
    Date >= '2022-05-01' AND Date <= '2022-05-31' 
	And Status!= 'Cancelled'
GROUP BY 
    Style, Category
ORDER BY
    Total_style DESC;


--June

SELECT TOP 1 
    Style,
    Category,
    Count(Style) as Total_style,
    Sum(Amount) as Total_amount
FROM
    Portfolio_project..Amazon_Sale
WHERE
   Date >= '2022-06-01' AND Date <= '2022-06-30'
	And Status!= 'Cancelled'
GROUP BY 
    Style, Category
ORDER BY
    Total_style DESC;


--Problem 7 - People of which area have highest and lowest shopping rate

SELECT
	Shipped_state, Shipped_postal_code,
	COUNT(Shipped_postal_code) as Aggregate_sale,
	SUM(Amount) as Total_Revenue
FROM
	Portfolio_project..Amazon_Sale
WHERE
	Status != 'Cancelled'
GROUP BY
	Shipped_state, Shipped_postal_code
ORDER BY
	Aggregate_sale DESC
	

















