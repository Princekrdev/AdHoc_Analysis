-- Get the complete report of the Gross sales amount for the customer  “Atliq 
-- Exclusive”  for each month  .  This analysis helps to  get an idea of low and 
-- high-performing months and take strategic decisions. 
-- The final columns: -- Month || Year ||Gross sales Amount 

SELECT 
	CONCAT(MONTHNAME(FS.date), ' (', YEAR(FS.date), ')') AS 'Mon' ,
    FS.date,
    FS.fiscal_year,
    ROUND(SUM(GP.gross_price*FS.sold_quantity),2) AS GROSS_SALES_AMOUNT
FROM fact_sales_monthly FS JOIN dim_customer DC ON FS.customer_code = DC.customer_code
						   JOIN fact_gross_price GP ON FS.product_code = GP.product_code
WHERE DC.customer = "Atliq Exclusive"
GROUP BY FS.date, FS.fiscal_year