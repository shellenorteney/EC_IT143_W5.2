/*****************************************************************************************************************
NAME:    Budget
PURPOSE: Answer the questions

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     05/25/2024   SORTENEY     1. Built this script for EC IT440


RUNTIME: 
1s

NOTES: 
Create the answer to questions related to the community and find the answer using the requested SQL
******************************************************************************************************************/

-- Q1: What are the average monthly expenditures in each category (food, tithing, transport, account, and leisure) over the year?
-- A1: Find the average monthly expenditures in each category (food, tithing, transport, account, and leisure) over the year...

SELECT category, AVG(expenditure) AS average_monthly_expenditure
FROM household_expenditures
GROUP BY category;

-- Q2: How do seasonal trends affect spending in categories such as leisure and transport over the year?
-- A2: Understand how seasonal trends affect spending in categories such as leisure and transport over the year.
SELECT category, EXTRACT(MONTH FROM date) AS month, AVG(expenditure) AS average_monthly_expenditure
FROM household_expenditures
WHERE category IN ('leisure', 'transport')
GROUP BY category, month
ORDER BY category, month;

-- Q3: What is the total annual expenditure for each category, and what percentage of the total budget does each category represent?
-- A3: Calculate the total annual expenditure for each category and the percentage of the total budget each category represents.
SELECT category, 
       SUM(expenditure) AS total_annual_expenditure, 
       (SUM(expenditure) / (SELECT SUM(expenditure) FROM household_expenditures) * 100) AS percentage_of_total
FROM household_expenditures
GROUP BY category;

-- Question from Rolando Alfaro Ramirez
-- Q4: How does a change in household income affect the allocation to different budget categories?
-- A4: Analyze the impact of changes in household income on budget allocations and savings patterns over different periods.
SELECT h.income_change_period, 
       h.category, 
       h.expenditure, 
       (h.expenditure / i.income) * 100 AS percentage_of_income
FROM household_expenditures h
JOIN household_income i ON h.household_id = i.household_id AND h.date = i.date
WHERE h.income_change_period IS NOT NULL
GROUP BY h.income_change_period, h.category, h.expenditure, i.income
ORDER BY h.income_change_period, h.category;


