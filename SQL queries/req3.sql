
SELECT 
	DISTINCT(segment), 
	count(product) over(partition by segment) AS Product_count
FROM dim_product
order by Product_count desc;
 