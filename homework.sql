-- print out the number of orders per customers
SELECT count(*) as order_count, customer_id
FROM orders
GROUP BY customer_id
ORDER BY customer_id desc
LIMIT 100;

-- -- print out top 5 customers who placed the most orders
SELECT count(*) as order_count, customer_id
FROM orders
GROUP BY order_count
ORDER BY order_count desc
LIMIT 5;

-- Print out the total amount per order
SELECT o.id,
 sum(li.quantity * p.price) as total
FROM orders o
JOIN line_items li on li.order_id = o.id
JOIN products p on li.product_id = p.id
GROUP BY o.id;

-- Print out the emails that have placed more than 6 orders
select c.email, count(*)
from orders o
join customers c on o.customer_id = c.id
group by c.email
having count(*) > 6

-- Delete the last 5 orders

delete from orders where id in
(select id
from orders
order by created_at desc
limit 5)

-- Copy all the orders to a CSV file
COPY orders TO '/orders.csv' CSV;
