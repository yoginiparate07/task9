---1.calculate_profit_percentage

select customer_id,profit,sales from sales

CREATE OR REPLACE FUNCTION calculate_profit_percentage(customer_id varchar)
RETURNS double precision AS $$
DECLARE 
    Sum_Profit double precision;
    Sum_Sales double precision;
    Profit_Percentage double precision;
BEGIN
    SELECT SUM(profit) as Sum_Profit, SUM(sales) as Sum_Sales
    INTO Sum_Profit, Sum_Sales 
    FROM sales 
    WHERE sales.customer_id = calculate_profit_percentage.customer_id;

    IF Sum_Sales IS NOT NULL AND Sum_Sales <> 0 THEN
        Profit_Percentage := (Sum_Profit / Sum_Sales) * 100;
    ELSE
        Profit_Percentage := 0;  -- Handle division by zero or NULL case
    END IF;

    RETURN Profit_Percentage;
END;
$$ LANGUAGE plpgsql;


select sum(profit) as Sum_Profit,Sum(sales) as Sum_Sales , sum(profit)/sum(sales) as Profit_Percentage
from sales 
where customer_id = 'BH-11710'

select calculate_profit_percentage('BH-11710')


