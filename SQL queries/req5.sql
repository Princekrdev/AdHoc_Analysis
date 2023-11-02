-- Get the products that have the highest and lowest manufacturing costs. 
-- The final output should contain these fields, -- product_code|| product ,||manufacturing_cost

SELECT 
	dp.product_code ,product,manufacturing_cost
FROM fact_manufacturing_cost m 
	JOIN dim_product dp ON dp.product_code = m.product_code
WHERE manufacturing_cost IN (
	SELECT MAX(manufacturing_cost)  FROM fact_manufacturing_cost union
	select MIN(manufacturing_cost) FROM fact_manufacturing_cost
    )
