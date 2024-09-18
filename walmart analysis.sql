1. Retrieve all columns for sales made in a specific branch (e.g., Branch 'A'). 

select * from walmart 
where branch="A";
select * from walmart;

2. Find the total sales for each product line.

select product_line,sum(Total) as Total_sales 
from walmart 
group by product_line;

3. List all sales transactions where the payment method was 'Cash'.
 
select * from walmart 
where payment="Cash"; 

4.  Calculate the total gross income generated in each city.  

select City, sum(gross_income) as total_gross_income 
from walmart
group by City;

5. Find the average rating given by customers in each branch. 

select branch, avg(rating) as avg_rating 
from walmart
group by branch;

6. Determine the total quantity of each product line sold.

select product_line, sum(quantity) as total_quantity 
from walmart 
group by product_line;

7. List the top 5 products by unit price.  

select distinct product_line as product,unit_price 
from walmart 
order by unit_price desc
limit 5;

8. Find sales transactions with a gross income greater than 30. 

select * from walmart 
where total > 30
order by total;

9.  Retrieve sales transactions that occurred on weekends. 

ALTER TABLE walmart
ADD COLUMN day_name VARCHAR(9);


UPDATE walmart
SET day_name = dayname(date);
SET SQL_SAFE_UPDATES = 0;


select * from walmart
where day_name="Saturday" or day_name="Sunday";

10.  Calculate the total sales and gross income for each month.  

SELECT
    DATE_FORMAT(date, '%Y-%m') AS month,
    SUM(total) AS total_sales,
    SUM(gross_income) AS total_gross_income
FROM walmart
GROUP BY DATE_FORMAT(date, '%Y-%m')
ORDER BY month;

select * from walmart;
11.  Find the number of sales transactions that occurred after 6 PM. 

select count(Invoice_ID) as total_transactions 
from walmart
where time>'18:00:00';

12.  List the sales transactions that have a higher total than the average total of all transactions. 

select * from walmart 
where total> (select avg(total) from walmart);

13. Calculate the cumulative gross income for each branch by date. 

SELECT distinct branch, date, SUM(gross_income) OVER (PARTITION BY branch ORDER BY date) AS cumulative_gross_income
FROM walmart
ORDER BY branch, date;

15. Find the total cogs for each customer type in each city. 

select sum(cogs) as total_cogs, customer, city 
from walmart 
group by customer,city;