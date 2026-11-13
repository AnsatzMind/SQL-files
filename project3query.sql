USE project
;
GO


--Total Revenue
SELECT SUM(pay.amount) AS Total_Revenue
FROM payments AS pay
  JOIN orders AS o
     ON pay.order_ID = o.order_ID 
WHERE o.order_status='Delivered'
;


--Top Products by Revenue
SELECT TOP 10 p.product_ID,SUM(p.price * oi.quantity) AS revenue
FROM orders AS o
  INNER JOIN  order_items AS oi
    ON oi.order_ID = o.order_ID 
  INNER JOIN products AS p
    ON p.product_ID = oi.product_ID
WHERE o.order_status='Delivered'
GROUP BY p.product_ID
ORDER BY revenue DESC
;


--Top Customer by unit items 
SELECT c.name, SUM(oi.quantity) AS Spent
FROM customer AS c
  JOIN  orders AS o
     ON c.customer_ID = o.customer_ID
  JOIN order_items AS oi
     ON o.order_ID = oi.order_ID
WHERE o.order_status='Delivered'
GROUP BY c.name
ORDER BY Spent DESC
;


--Top Selling Product
SELECT TOP 5 p.product_name, SUM(oi.quantity) AS Total_Sold
FROM products AS p
  JOIN  order_items AS oi
    ON oi.product_ID = p.product_ID
GROUP BY p.product_name 
ORDER BY Total_Sold DESC
;

--Cancelled Orders
Select COUNT(order_ID) AS Sold_Quantity,
       CASE
               WHEN GROUPING(order_ID)=1 THEN 'GRAND TOTAL'
               ELSE CAST(order_ID AS VARCHAR(30))
        END
        AS ORDER_ID
FROM orders
WHERE order_status='Cancelled'
GROUP BY ROLLUP (order_ID)
;