drop table if exists zepto;
create table zepto(
sku_id SERIAL PRIMARY KEY,
category VARCHAR(120),
name VARCHAR(150) NOT NULL,
mrp NUMERIC(8,2),
discountPercent NUMERIC(5,2),
availableQuantity INTEGER,
discountedSellingPrice NUMERIC(8,2),
weightInGms INTEGER,
outOfStock BOOLEAN,
quantity INTEGER
);
-- data exploration 
select count(*) from zepto;

select * from zepto limit 5;

-- null values
select * from zepto 
where name is null
or category is null
or mrp is null
or discountPercent is null 
or availableQuantity is null 
or discountedSellingPrice  is null 
or weightInGms is null 
or outOfStock is null
or quantity is null ;

-- different product categories
select category , count(sku_id) 
from zepto 
group by category
order by count(sku_id) desc;

-- products in stock vs out of stock
select outOfStock , count(sku_id) as num
from zepto
group by outOfStock;

-- product names present multiple times
select name , count(sku_id) as "Number of SKUs"
from zepto 
group by name 
having count(sku_id) > 1
order by count(sku_id) desc;

-- data cleaning 

-- products with price 0 
select * from zepto 
where mrp = 0 or discountedSellingPrice = 0;

delete from zepto 
where mrp = 0;

-- converting paise to rupees
update zepto 
set mrp = mrp/100.0,
discountedSellingPrice = discountedSellingPrice/100.0

select mrp , discountedSellingPrice from zepto limit 10;

-- Q1. top 10 best value products based on discount percentage
select distinct name , mrp , discountPercent
from zepto 
order by discountPercent desc 
limit 10 ;

-- Q2. what are the products with High MRP but out of stock 
select distinct name , mrp
from zepto 
where outOfStock = True and mrp>300 
order by mrp desc

-- 	Q3. calculate the estimated revenue for each category
select category , sum(DiscountedSellingPrice*availableQuantity) as total_revenue
from zepto 
group by category
order by total_revenue desc;

-- Q4. products where mrp is greater than 500 and discount less than 10%
select distinct name , mrp , discountPercent
from zepto 
where mrp > 500 and discountPercent < 10
order by mrp desc;

-- Q5. top 5 categories offering the highest average discount percentage
select category , round(avg(discountPercent),2) as "Average Discount"
from zepto 
group by category 
order by "Average Discount" desc limit 5;

--Q6. Find the price per gram for products above 100g and sort by best value
select distinct name, discountedSellingPrice , weightInGms , round(discountedSellingPrice/weightInGms,2) as price_per_gram
from zepto 
where weightInGms > 100 
order by price_per_gram desc limit 10;

--Q7. group the products into Low , Medium , Bulk
select distinct name , case when weightInGms <= 1000 then
'Low' when weightInGms between 1000 and 5000 then 'Medium'
else 'Bulk' end as weight_category
from zepto;

-- Q8. What is the total inventory weight per category 
select category , sum(weightInGms*availableQuantity) as total_weight
from zepto 
group by category 
Order by total_weight desc;