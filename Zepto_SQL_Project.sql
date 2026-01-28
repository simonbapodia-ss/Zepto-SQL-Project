select * from zepto_v1

-- Count of Rows 
select count (*) from zepto_v1

-- Null Values 
select * from zepto_v1
where Category is null 
or 
name is null 
or 
mrp is null 
or 
discountPercent is null 
or 
availableQuantity is null 
or 
discountedSellingPrice is null 
or 
weightInGms is null 
or 
outOfStock is null 
or 
quantity is null 

-- Different Product Category
select distinct Category
from zepto_v1
order by Category;

-- Products in Stock vs Out of Stock
select outOfStock, count (*) as category
from zepto_v1
group by outOfStock;

--Product names present multiple times
select name, count(*) as "Number of Products"
from zepto_v1
group by name 
having count(*) > 1 
order by count(*) desc;

--DATA CLEANING

--Products with price = 0 
select * from zepto_v1
where mrp = 0 or discountedSellingPrice = 0;

delete from zepto_v1
where mrp = 0;

--Convert paise to rupees 
update zepto_v1
set mrp = mrp/100.0,
discountedSellingPrice = discountedSellingPrice/100.0;

select mrp, discountedSellingPrice from zepto_v1

--Q1. Find the top 10 best-value products based on the discount percentage.
select distinct top 10
    name, 
    mrp, 
    discountPercent
from zepto_v1
order by discountPercent desc;

--Q2. Wat are the products with high MRP but Out of Stock?
select distinct name, mrp 
from zepto_v1
where outOfStock = 1 and mrp > 300
order by mrp desc;
 
--Q3. Calculate estimated revenue for each category.
select category,
SUM(discountedSellingPrice * availableQuantity) as Total_Revenue 
from zepto_v1
group by category 
order by Total_Revenue;

--Q4. Find all products where MRP is greater than Rs. 500 and discount is less than 10%.
select distinct name, mrp, discountPercent 
from zepto_v1
where mrp > 500 and discountPercent < 10
order by mrp desc, discountPercent desc;

--Q5. Identify the top 5 categories offering the highest average discount percentage. 
select top 5
   category,
   round (avg(discountPercent),2) as Avg_Discount
from zepto_v1
group by category 
order by Avg_Discount desc;

--Q6. Find the price per gram for products above 100g and sort by best value. 
select name, weightInGms, discountedSellingPrice,
round(discountedSellingPrice/weightInGms,2) as Price_per_gram
from zepto_v1
where weightInGms >= 100
order by Price_per_gram;

--Q7. Group the products into cateories like Low, Medium ,Bulk.
select distinct name, weightInGms,
CASE
     when weightInGms < 1000 then 'Low'
     when weightInGms < 5000 then 'Medium'
     else 'Bulk'
end as weight_category 
from zepto_v1;

--Q8. What is the Total Inventory Weight per Category?
select category,
sum(weightInGms * availableQuantity) as Total_weight
from zepto_v1
group by category 
order by Total_weight;