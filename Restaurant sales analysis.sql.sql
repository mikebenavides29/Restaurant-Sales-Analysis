/*
Data Exploration
Skills used: Group by, Order by, Where, Having, Join, Limit
*/

--Full table Menu Items and Order details
select * from menu_items;

select * from order_details;

--How many months of data do we have
select min(order_date), max(order_date)
from order_details;

--How many categories of food are there
select distinct category 
from menu_items;

--How many items do we have on the menu
select mi.item_name
from menu_items mi 
group by mi.item_name;

--How many foods are in each category and average price per category
select category, Count(category), avg(price) 
from menu_items
group by category
order by avg(price) desc;

--Top 5 expensive menu items
select menu_items.category, menu_items.item_name, max(price) as max_price 
from menu_items
group by menu_items.item_name, menu_items.category
order by max_price desc
limit 5;
 

--Number of menu items that that are more than $13
select item_name, price  
from menu_items as mi
where price > 13
order by price desc;


--Join both tables
select * 
from order_details as od 
join menu_items as mi
	on od.item_id = mi.menu_item_id;

--Quantity of items sold per dates
select mi.item_name, od.item_id, count(mi.item_name) as total_sold, od.order_date
from order_details as od 
join menu_items as mi
	on od.item_id = mi.menu_item_id
group by mi.item_name, od.item_id, od.order_date
having count(mi.item_name) > 5
order by count(mi.item_name) desc
limit 20;

--Most ordered menu item and time	
select mi.item_name , od.order_time, od.order_date, count(od.item_id)  
from order_details as od 
join menu_items as mi
	on od.item_id = mi.menu_item_id
group by od.order_time, mi.item_name, od.order_date
order by count(od.order_time) desc
limit 10;

