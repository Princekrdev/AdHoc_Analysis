SELECT 
	x1.a AS unique_products_2020 ,x2.b AS unique_products_2021,
    ROUND((b-a)*100/a , 2) AS percentage_chg
FROM ( SELECT count(distinct(product_code)) AS a
	FROM fact_sales_monthly WHERE fiscal_year = 2020) AS x1,
	( SELECT count(distinct(product_code)) AS b
	FROM fact_sales_monthly WHERE fiscal_year = 2021) AS x2





