/*****************************************************************************************************************
NAME:    Library
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

-- Q1: What is the distribution of book editions (e.g., Oxford World's Classics, Norton Critical Edition) across different sections of the library?
-- A1: Find the distribution of book editions (e.g., Oxford World's Classics, Norton Critical Edition) across different sections of the library.

SELECT section, edition, COUNT(*) AS count_of_books
FROM library_books
GROUP BY section, edition
ORDER BY section, edition;


-- Q2: Which categories (e.g., Fiction, Romantic, Scientific) have the most diverse range of editions, and which editions are the most prevalent?
-- A2: Identify which categories (e.g., Fiction, Romantic, Scientific) have the most diverse range of editions and which editions are the most prevalent.

SELECT category, edition, COUNT(*) AS count_of_editions
FROM library_books
GROUP BY category, edition
ORDER BY category, count_of_editions DESC;


-- Q3: How many book editions have missing section or category information, and how can this data gap be addressed to improve cataloging accuracy?
-- A3: Determine how many book editions have missing section or category information and how this data gap can be addressed to improve cataloging accuracy.

SELECT COUNT(*) AS missing_information_count
FROM library_books
WHERE section IS NULL OR category IS NULL;


-- Question from Liahoma Macasaet
-- Q4: How does the choice of book edition affect its borrowing frequency?
-- A4: Understand the relationship between different editions of books and their borrowing frequency and the impact on library resource allocation.

SELECT edition, AVG(borrowing_count) AS average_borrowing_frequency
FROM library_books
GROUP BY edition
ORDER BY average_borrowing_frequency DESC;

