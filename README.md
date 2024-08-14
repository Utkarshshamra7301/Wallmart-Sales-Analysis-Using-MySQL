# Wallmart-Sales-Analysis-Using-MySQL
Walmart Sales Analysis SQL Script
This repository contains a comprehensive SQL script for analyzing Walmart sales data. The script creates a database and a sales table, performs data cleaning, and includes a series of SQL queries to extract meaningful insights about sales performance, customer behavior, and product performance.

# Key Features:
# Database and Table Creation:

The script begins by creating a database walmartSales and a sales table with detailed columns to capture essential transactional data, including invoice ID, branch, city, customer type, product line, pricing, and more.
Data Cleaning and Enhancement:

Adds new columns such as time_of_day, day_name, and month_name to enhance the data for more granular analysis.
Updates the sales table with values for these columns based on existing data.
General Sales Insights:

Queries to determine the number of unique cities, branches, and product lines.
Analysis of the most selling product lines, total revenue by month, and city with the largest revenue.
Product Performance Analysis:

Identifies the most popular product lines, calculates total revenue by product line, and evaluates product performance based on average sales.
Determines the product lines that generate the largest VAT and analyzes product preferences by gender.
Customer Behavior Analysis:

Explores customer demographics, including customer type and gender distribution.
Analyzes the most common payment methods and customer types that generate the most revenue.
Investigates the time of day and day of the week when customers give the highest ratings.
Sales and Revenue Analysis:

Examines sales trends across different times of the day and days of the week.
Determines which customer types and cities contribute the most to total revenue and VAT.
How to Use:
Clone the Repository:

bash
Copy code
git clone <repository_url>
Run the SQL Script:
Execute the SQL script in your MySQL database to create the walmartSales database, the sales table, and to populate it with enhanced data columns.

Explore the Data:
Use the provided SQL queries to gain insights into sales performance, customer behavior, product popularity, and more.

Customize and Extend:
Modify the SQL queries or add new ones to tailor the analysis to your specific needs or to explore other aspects of the sales data.

Future Enhancements:
Indexing: Adding indexes to improve query performance, especially for large datasets.
Visualization: Integration with data visualization tools to present the insights graphically.
Further Segmentation: Adding more granular customer segmentation or regional analysis.
Contributions:
Feel free to contribute by suggesting improvements, adding new features, or reporting any issues. Pull requests are welcome!
