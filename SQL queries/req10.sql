--  Get the Top 3 products in each division that have a high 
-- total_sold_quantity in the fiscal_year 2021? The final output contains these fields,-
-- ||division ||product_code||product ||total_sold_quantity ||rank_order 
SELECT * 
FROM(
SELECT 
	division, DP.product_code, product, SUM(sold_quantity),
    RANK() OVER(PARTITION BY division ORDER BY SUM(sold_quantity) DESC) AS 'RANKK'
FROM dim_product DP JOIN fact_sales_monthly FS USING(product_code)
WHERE fiscal_year = 2021
GROUP BY DP.product_code,product, division
)AS RANK_TABLE
WHERE RANKK IN (1,2,3)


