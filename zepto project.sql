drop table if exists zepto;

create table zepto(
sku_id SERIAL PRIMARY KEY,
category VARCHAR(120),
name VARCHAR(120) not null,
mrp NUMERIC(8,2),
discount_percent NUMERIC(5,2),
available_quantity INTEGER,
discounted_selling_price NUMERIC(8,2),
weight_in_grams INTEGER,
out_of_stock BOOLEAN,
quantity INTEGER 
);

--exploration

--count no of rows
SELECT COUNT(*) 
FROM zepto;

--get a sample data 
SELECT *
FROM zepto
LIMIT 10;

--look for null values
SELECT *
FROM zepto
WHERE name IS NULL
OR
category IS NULL
OR
mrp IS NULL
OR
discount_percent IS NULL
OR
available_quantity IS NULL
OR
discounted_selling_price IS NULL
OR
weight_in_grams IS NULL
OR
out_of_stock IS NULL
OR
quantity IS NULL;

--explore  different product categories
SELECT DISTINCT category
FROM zepto
ORDER BY category;

--products in stock vs out of stock
SELECT out_of_stock, COUNT(sku_id)
FROM zepto
GROUP BY out_of_stock; 

--product names present more than once
SELECT name,COUNT(sku_id) AS "Number of SKU's"
FROM zepto
GROUP BY name
HAVING count(sku_id)>1
ORDER BY count(sku_id) DESC;

--DATA CLEANING

--find out if there is any product with price as 0
SELECT *
FROM zepto 
WHERE mrp=0 OR 
      discounted_selling_price=0;

--delete a specific product
DELETE FROM zepto
WHERE mrp=0;

--convert paise to rupee
UPDATE zepto
SET mrp=mrp/100.0,
  discounted_selling_price =discounted_selling_price/100.0;

--check if its converted
SELECT mrp,discounted_selling_price
FROM zepto;

--solving some questions to uncover valuable insights

--Q1. Find the top 10 bst value products based on the discount percentage?
SELECT DISTINCT name, mrp, discount_percent
FROM zepto
ORDER BY discount_percent DESC
LIMIT 10;

--Q2.What are the products with high mrp but out of stock?
SELECT DISTINCT name, mrp
FROM zepto
WHERE out_of_stock= true and mrp>300
ORDER BY mrp DESC;

--Q3.Calculate estimated revenue for each category
SELECT category,
SUM(discounted_selling_price*available_quantity) AS revenue
FROM zepto
GROUP BY category
ORDER BY revenue;

--Q4. Find all products where mrp is greater than 500/- and discount is less than 10%
SELECT DISTINCT name,mrp,discount_percent
FROM zepto
WHERE mrp>500 and discount_percent<10
ORDER BY mrp DESC, discount_percent DESC;

--Q5.Identify the top 5 categories offering the highest average discount percentage.
SELECT category,ROUND(AVG(discount_percent),2) AS avg_discount_percent
FROM zepto
GROUP BY category
ORDER BY avg_discount_percent DESC
LIMIT 5;

--Q6. Find the price per gram for products above 100g and sort by best value.
SELECT DISTINCT name, weight_in_grams,discounted_selling_price,
ROUND((discounted_selling_price/weight_in_grams),2) AS price_per_gram
FROM zepto
WHERE weight_in_grams>=100
ORDER BY price_per_gram;

--Q7. Group the products into categories like low,medium and bulk
SELECT DISTINCT name,weight_in_grams,
CASE WHEN weight_in_grams<1000 THEN 'low'
     WHEN weight_in_grams<5000 THEN 'medium'
	 ELSE 'bulk'
	 END AS category_by_weight
FROM zepto;

--Q8.Total inventory weight per category?
SELECT category,SUM(weight_in_grams*available_quantity) AS total_inventory_weight
FROM zepto
GROUP BY category
ORDER BY total_inventory_weight;









