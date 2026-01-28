This project involves a comprehensive SQL-based analysis of Zepto’s inventory and sales data. The goal was to extract meaningful business insights regarding pricing strategies, stock availability, and category performance to optimize quick-commerce operations.

📊 Dataset Key Attributes

The analysis was performed on a dataset containing:

Category: Product classification (e.g., Dairy, Fresh Produce, Snacks).

MRP: The original price of the products.

Discount Percent: The percentage of markdown applied.

Selling Price: The final price after discounts.

Available Quantity: Current inventory levels for each item.

🛠️ Skills Demonstrated

Data Cleaning: Handling null values and ensuring correct data types for financial columns.

Aggregations: Using SUM(), AVG(), and COUNT() to summarize category totals.

Filtering & Sorting: Utilizing WHERE, HAVING, and ORDER BY to identify top-performing products.

Business Logic: Calculating revenue potential and stock-to-price ratios.

🔍 Business Questions Addressed

I wrote SQL queries to solve the following:

Revenue Impact: What is the total value of stock available per category?

Discount Strategy: Which categories carry the highest average discount?

Inventory Health: Identifying products with low stock but high demand.

Price Analysis: Comparing the difference between MRP and actual Selling Price across the catalog.

📂 Repository Structure

Dataset/: Contains the raw CSV files used for the database.

SQL_Queries.sql: The complete script containing all analysis queries.
