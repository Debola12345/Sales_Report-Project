/*in this superstore sales SQL Data Analysis project, I exploresd the Superstore Sales Data.
 *My main goal was to uncover insights into the store's sales and profit trends from 2014-2017 using SQL.
 *I summarized sales and profit trends by month, ship mode, segments, regions, categories and sub-categories.
 *Additionally, I identified the top-performing products, as well as the most profitable customers.
 */

/*1. what are the monthly sales, profit, and quantity?
to get the monthly sales, I'll select the order_date, sales, profit and quantity columns. I'll GO ahead TO 
seperate the MONTH FROM YEAR FROM ORDER_date since we are looking for monthly sales. Also, aggregate the other
info AND GROUP BY the dates.*/

SELECT 
	STRFTIME('%Y-%m', order_date)as order_month,
	sum(sales)as sales,
	sum(profit)as profit,
	sum(quantity)as quantity
From
	orders
Group by
	order_month;

/* 2. what are the total sales and profit by different ship mode?
I'll be aggregating the sales and profit, then group by the different ship mode.*/

SELECT 
	ship_mode,
	Sum(sales) as sales,
	Sum(profit) as profit
From
	 orders
Group by
	 ship_mode;

	
/*3. what are the total sales and profit by different segments?
to answer this question, I'll be aggregating the sales and profit, then group by the different segments.*/

SELECT 
	segment,
	sum (sales) as total_sales,
	sum (profit) as total_profit
From 
	orders
Group by 
	segment;

/*4.what are the total sales and profit by different categories and subcategories?
to answer this question, I'll be aggregating the sales and profit, then group by the categories & sub-cat...*/

SELECT 
	category,
	sub_category,
	sum (sales) as total_sales,
	sum (profit) as total_profit
From
	orders
Group by
	category,
	sub_category;
 	
/*5. What is the quantity for each region?
I'll be aggregating quantity TO show us the addition FOR EACH region, then group BY regions.*/
 
SELECT 
 	region,
 	sum (quantity) as quantity
 FROM 
 	orders
 Group by
 	region;
 	
/*6. What is the average discount for each product category?
use the average FUNCTION TO find the total discounts AND GROUP BY category.*/

 SELECT 
	 category, 
	 AVG(discount) as average_discount
 From
 	orders
 group by
 	category;
 
 /*7. What are the average sales and profit per order?
 use the order_id, because this will show ALL the orders placed BY each customer IN different categories AND 
 the sales AND profits FROM EACH ORDER. Use the avg FUNCTION TO find the avg sales & profits the GROUP BY order_id.*/
 
 SELECT 
 	order_id,
	avg(sales) as sales,
	avg(profit) as profit
 FROM
 	orders
 Group BY 
	order_id;

/*8. What is the most profitable product?
use the product_id & profit columns, since we need the most, we'll aggregate the profit to see which has yielded 
the most profit, group & order by profit in a desc order and limit it to 1 which is the highest profit made.*/

SELECT 
	product_id,
	sum(profit) AS profitable
From
	orders
Group by
	profit
Order by
	profit DESC
LIMIT 1;

/*9. Who are the top 5 customers based on their total spending? 
to get the top 5 customers, select, customer_name to know the names, customer_id to find every order 
in the customer_id, in which we aggregate the sales to find the total sales for each customer. Group by customer
id and name, then order in decscending order by sales' alias AND LIMIT TO top 5 AS requested.*/

SELECT
	customer_name,
	customer_id,
	sum(sales) AS sales_sum
FROM
	orders
group by 
	customer_name,
	customer_id
order by
	sales_sum desc
Limit 5;

/*10. How many orders were placed in each year?
seperate the MONTH FROM YEAR USING the strftime FUNCTION IN order_date*/

SELECT
	STRFTIME('%Y',order_date)as yearly_order,
	Count(distinct order_id)AS total_order
From
	orders
Group by
	yearly_order;

/*11. How many orders were returned?
count the number OF returned_orders FROM the RETURN TABLE TO GET the answer AND GROUP BY returned.*/

SELECT 
	COUNT(returned) as returned_orders 
From
	RETURNS
GROUP BY
	returned;

/*12. Which product category has the most orders?
the columns needed here ARE order_id, category AND sales. count the order_id & sales, THEN introduce the 
DISTINCT FUNCTION TO ORDER_id TO seperate the different orders. GROUP BY category AND ORDER BY the order_id that
has been counted.*/

SELECT 
	category,
	count(order_id) as most_orders,
	COUNT(distinct order_id) AS distinctorder,
	count(sales) AS sales_count
FROM 
	orders
Group by
	category
Order BY
 	most_orders DESC;



