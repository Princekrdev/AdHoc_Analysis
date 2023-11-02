-- Generate a report which contains the top 5 customers who received an 
-- average high  pre_invoice_discount_pct  for the  fiscal  year 2021  and in the 
-- Indian  market. The final output contains these fields, 
-- customer_code || customer || average_discount_percentage


WITH CET1 AS (
	SELECT customer_code AS A, AVG(pre_invoice_discount_pct) AS B 
    FROM fact_pre_invoice_deductions
	WHERE fiscal_year = '2021'
	GROUP BY customer_code), 
CET2 AS(
	SELECT customer_code AS C, customer AS D FROM dim_customer
	WHERE market = 'India')

SELECT CET2.C AS customer_code, CET2.D AS customer, ROUND (CET1.B, 4) AS average_discount_percentage
FROM CET1 JOIN CET2
ON CET1.A = CET2.C
ORDER BY average_discount_percentage DESC
LIMIT 5 