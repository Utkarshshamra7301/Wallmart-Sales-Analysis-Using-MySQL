USE wallmart;
SELECT * FROM sales;

-- Add the time_of_day column
SELECT time,
	(CASE 
		WHEN 'time' BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
        WHEN 'time' BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
        ELSE "Evening"
        END) AS 'time_of_day'
FROM sales;

-- Add time_of_day table
ALTER TABLE sales ADD COLUMN time_of_day VARCHAR(20);

UPDATE sales
SET time_of_day =(
		CASE
			WHEN 'time' BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
            WHEN 'time' BETWEEN '12:01:00' AND '16:00:00' THEN "Afternoon"
            ELSE 'Evening'
            END);
SELECT * FROM sales;

-- ADD day_name column
SELECT 
    date, DAYNAME(date)
FROM
    sales;

ALTER TABLE sales ADD COLUMN day_name VARCHAR(10);

UPDATE sales
SET day_name = DAYNAME(date);

-- ADD month_name Column
SELECT date,MONTHNAME(date) FROM sales;

ALTER TABLE sales ADD COLUMN month_name VARCHAR(10);

UPDATE sales
SET month_name = MONTHNAME(date);

SELECT * FROM sales;

-- Question 
-- How many unique cities does the data have ? 
SELECT DISTINCT
    city
FROM
    sales;

-- In which city is each branch
SELECT DISTINCT
    city, branch
FROM
    sales;

-- --------------------------------------------------------------------
-- ---------------------------- Product -------------------------------
-- --------------------------------------------------------------------
-- how many unique products lines does the date have ?
SELECT DISTINCT
    product_line
FROM
    sales;
    
-- What is the most selling product line ?

SELECT 
    product_line, SUM(quantity) AS 'total_qty_sold'
FROM
    sales
GROUP BY product_line
ORDER BY SUM(quantity) DESC;

-- What is the total revenue by month ?
SELECT month_name,SUM(total) 'MoM_sales'
FROM sales
GROUP BY month_name
ORDER BY MoM_sales DESC;

-- What month had the largest COGS?
SELECT 
    month_name, SUM(cogs) AS 'cogs'
FROM
    sales
GROUP BY month_name
ORDER BY SUM(cogs) DESC;

-- What product line had the largest revenue
SELECT product_line,SUM(total) AS 'revenue' 
FROM sales
GROUP BY product_line
ORDER BY SUM(total) DESC LIMIT 1;

-- Which city with the largest revenue?
SELECT city,SUM(total) as 'revenue'
FROM sales
GROUP BY city
ORDER BY SUM(total) DESC;

-- What product line had the largest VAT?
SELECT product_line,SUM(tax_pct) as 'VAT' 
FROM sales
GROUP BY product_line
ORDER BY VAT DESC;


-- Fetch each product line and add a column to those product 
-- line showing "Good", "Bad". Good if its greater than average sales
SELECT AVG(quantity) AS 'quantity' 
FROM sales;

SELECT product_line,
	(CASE 
		WHEN AVG(quantity) > 6 THEN 'Good'
        ELSE 'bad'
        END) AS remark
FROM sales
GROUP BY product_line;

-- Which branch sold more products than average product sold?
SELECT branch,
AVG(quantity) AS 'qty'
FROM sales
GROUP BY branch
HAVING SUM(quantity) > (SELECT AVG(quantity) FROM sales);

-- What is the most common product line by gender
SELECT
	gender,
    product_line,
    COUNT(gender) AS total_cnt
FROM sales
GROUP BY gender, product_line
ORDER BY total_cnt DESC;

-- What is the avg rating of each product line ?
SELECT product_line,AVG(rating) 
FROM sales
GROUP BY product_line;

-- --------------------------------------------------------------------
-- --------------------------------------------------------------------

-- --------------------------------------------------------------------
-- -------------------------- Customers -------------------------------
-- --------------------------------------------------------------------
-- How many unique customer type does the data have ?
SELECT DISTINCT
    customer_type
FROM
    sales;
    
-- How many unique payments_mode does the data have ? 
SELECT DISTINCT
    payment
FROM
    sales;
    
-- What is the most comman customer type ?
SELECT customer_type,COUNT(*) AS 'count'
FROM sales
GROUP BY customer_type
ORDER BY COUNT(*) DESC ;

-- Which customer type buys the most?
SELECT customer_type,COUNT(*) 
FROM sales
GROUP BY customer_type;

-- What is the gender distribution per branch?
SELECT
	gender,
	COUNT(*) as gender_cnt
FROM sales
WHERE branch = "C"
GROUP BY gender
ORDER BY gender_cnt DESC;

-- Which time of the day do customers give most ratings?
SELECT
	time_of_day,
	AVG(rating) AS avg_rating
FROM sales
GROUP BY time_of_day
ORDER BY avg_rating DESC;

-- Which day fo the week has the best avg ratings?
SELECT
	day_name,
	AVG(rating) AS avg_rating
FROM sales
GROUP BY day_name 
ORDER BY avg_rating DESC;
-- Mon, Tue and Friday are the top best days for good ratings
-- why is that the case, how many sales are made on these days?

-- Which day of the week has the best average ratings per branch?
SELECT 
	day_name,
	COUNT(day_name) total_sales
FROM sales
WHERE branch = "C"
GROUP BY day_name
ORDER BY total_sales DESC;


-- --------------------------------------------------------------------
-- --------------------------------------------------------------------

-- --------------------------------------------------------------------
-- ---------------------------- Sales ---------------------------------
-- --------------------------------------------------------------------

-- Number of sales made in each time of the day per weekday 
SELECT
	time_of_day,
	COUNT(*) AS total_sales
FROM sales
WHERE day_name = "Sunday"
GROUP BY time_of_day 
ORDER BY total_sales DESC;
-- Evenings experience most sales, the stores are 
-- filled during the evening hours

-- Which of the customer types brings the most revenue?
SELECT
	customer_type,
	SUM(total) AS total_revenue
FROM sales
GROUP BY customer_type
ORDER BY total_revenue;

-- Which city has the largest tax/VAT percent?
SELECT
	city,
    ROUND(AVG(tax_pct), 2) AS avg_tax_pct
FROM sales
GROUP BY city 
ORDER BY avg_tax_pct DESC;

-- Which customer type pays the most in VAT?
SELECT
	customer_type,
	AVG(tax_pct) AS total_tax
FROM sales
GROUP BY customer_type
ORDER BY total_tax;