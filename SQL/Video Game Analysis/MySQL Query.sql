-- CREATING DATABASE
CREATE DATABASE games;

-- USING DATABASE
use games;

-- CREATING TABLE
CREATE TABLE video_game_sales 
	(
    Rank INT, 
	Year DATE, 
    Genre VARCHAR(45),
    Publisher VARCHAR(200), 
    NA_Sales FLOAT, 
    EU_Sales FLOAT, 
    JP_Sales FLOAT, 
    Other_Sales FLOAT, 
    Global_Sales FLOAT, 
    Platform VARCHAR(100);
-- VALUES UPLOADED VIA IMPORT WIZARD --

-- CHECKING VALUES ARE UPLOADED
SELECT *
FROM games.video_game_sales
LIMIT 50;

-- DROPPING UNNECASSARY COLUMNS
ALTER TABLE video_game_sales DROP COLUMN Video_Game_Salescol;
DELETE FROM video_game_sales WHERE Year = 2020;

## DATA EXPLORATORY:
-- COUNTING TOTAL UNIQUE VALUES
SELECT DISTINCT(COUNT(*)) -- 16327 Values
FROM video_game_sales;

-- Total number of sales
SELECT 
    ROUND(SUM(global_sales),2) AS total_video_game_sold
FROM video_game_sales;

-- DESCRIPTIVE ANALYSIS (MIN, MAX, AVG OF SALES IN EACH REGION)
SELECT
	MIN(NA_Sales) AS lowest_NA_Sale,
    MIN(EU_Sales) AS Lowest_EU_Sales,
    MIN(JP_Sales) AS Lowest_JP_Sales
FROM video_game_sales; -- all 0.00

-- Highest Sales per region
SELECT
	MAX(NA_Sales) AS Highest_NA_Sale,
    max(EU_Sales) AS Highest_EU_Sales,
    max(JP_Sales) AS Highest_JP_Sales
FROM video_game_sales; -- NA has highest record

-- Average sales per region
SELECT 
	ROUND(AVG(Global_Sales),2) AS Avg_Global_Sales,
	ROUND(AVG(NA_Sales),2) AS Avg_NA_Sales,
    ROUND(AVG(EU_Sales),2) AS Avg_EU_Sales,
    ROUND(AVG(JP_Sales),2) AS Avg_JP_Sales,
    ROUND(AVG(Other_sales),2) AS Other_region_sales
FROM video_game_sales; -- (Global = 0.54 millions, NA = 0.27 million, EU = 0.15 million, JP = 0.08 Million - NA sells more on average)

-- % of regional sales compared to global_sales
SELECT
	ROUND(AVG(NA_sales) / AVG(Global_sales),2) * 100 AS NA_Percent_sales,
    ROUND(AVG(EU_sales) / AVG(Global_sales),2) * 100 AS EU_percent_Sales,
    ROUND(AVG(JP_sales) / AVG(Global_sales),2) * 100 AS JP_percent_sales,
    ROUND(AVG(Other_sales) / AVG(Global_sales),2) * 100 AS Other_percent_sales
FROM video_game_sales; -- NA accounts for nrealy half of the sales compared to other regions

-- Looking at the last 5 years of sales
SELECT 
	Year,
    ROUND(SUM(global_sales),2) AS total_sales
FROM video_game_sales
GROUP BY YEAR
ORDER BY YEAR DESC
LIMIT 5;

-- VIDEO GAMES SOLD ACROSS THE YEARS AND AMOUNT OF TOTAL SALES EACH YEAR
SELECT Year, COUNT(*) AS Games_released, ROUND(SUM(Global_Sales),2) AS total_Sales
FROM video_game_sales
GROUP BY Year
ORDER BY total_sales DESC
LIMIT 5; -- 2009 and 2008 ranked the top 2 years with most games released but 2008 had highest sales

-- What year had the most/least Sales?
SELECT
	Year,
    ROUND(SUM(Global_Sales),2) AS total
FROM video_game_sales
GROUP BY year
ORDER BY total desc; -- Most = 2008 and least = 2017

-- Average Video Game Sales Across Different Regions compared to global sales
SELECT 
	ROUND(AVG(Global_Sales),2) AS Avg_Global_Sales,
	ROUND(AVG(NA_Sales),2) AS Avg_NA_Sales,
    ROUND(AVG(EU_Sales),2) AS Avg_EU_Sales,
    ROUND(AVG(JP_Sales),2) AS Avg_JP_Sales
FROM video_game_sales; -- (Global = 0.54 millions, NA = 0.27 million, EU = 0.15 million, JP = 0.08 Million - NA sells more on average)

-- Top 5 best selling video games
SELECT 
	video_game_sales.Name,
    ROUND(SUM(Global_Sales),2) AS Total_Sales_per_million
FROM video_game_sales
GROUP BY video_game_sales.Name
ORDER BY total_sales_per_million DESC
LIMIT 5;
-- -------------------------------------------------------------------------------------------------------------------
-- GENRE ANALYSIS:
-- Which Genre is the most popular/sold?
SELECT 
	Genre, 
    COUNT(Genre) AS total
FROM video_game_sales
GROUP BY Genre
ORDER BY Total DESC
LIMIT 5; -- Action ranks the highest amount of genres sold

-- Total sales per genre
SELECT 
	Genre,
    ROUND(SUM(global_sales),2) as Total_sales_per_million
FROM video_game_sales
GROUP BY genre
ORDER BY Total_sales_per_million DESC
LIMIT 5;

-- Genre Sales based on regions
SELECT
	Genre,
    ROUND(SUM(NA_sales),2) AS total_NA_sales,
    ROUND(SUM(EU_sales),2) AS total_EU_sales,
    ROUND(SUM(JP_sales),2) AS total_JP_sales,
    ROUND(SUM(other_sales),2) AS total_other_sales
FROM video_game_sales
GROUP BY Genre
ORDER BY
	total_NA_sales DESC,
    total_EU_sales DESC, 
    total_JP_sales DESC, 
    total_other_sales DESC;

-- Creating CTEs with new columns as regions and looking at ranking sales based on genre and region
WITH na_sales_cte AS (
    SELECT genre, 'na_sales' AS region, NA_Sales AS sales 
    FROM games.video_game_sales
),
eu_sales_cte AS (
    SELECT genre, 'eu_sales' AS region, EU_Sales AS sales 
    FROM games.video_game_sales
), 
jp_sales_cte AS (
    SELECT genre, 'jp_sales' AS region, JP_Sales AS sales 
    FROM games.video_game_sales
), 
other_sales_cte AS (
    SELECT genre, 'other_sales' AS region, Other_Sales AS sales 
    FROM games.video_game_sales
), 
cte_grouped AS (
    SELECT * FROM na_sales_cte 
    UNION ALL 
    SELECT * FROM eu_sales_cte 
    UNION ALL 
    SELECT * FROM jp_sales_cte 
    UNION ALL 
    SELECT * FROM other_sales_cte
), 
cte_region_sales AS (
    SELECT region, SUM(sales) AS total_sales 
    FROM cte_grouped 
    GROUP BY region
), 
cte_ranked AS (
    SELECT 
        ROW_NUMBER() OVER (PARTITION BY cg.region ORDER BY SUM(cg.sales) / cgs.total_sales DESC) AS row_num, 
        cg.genre, 
        cg.region, 
        SUM(cg.sales) / cgs.total_sales AS sales_ratio 
    FROM cte_grouped cg 
    LEFT JOIN cte_region_sales cgs ON cg.region = cgs.region 
    GROUP BY cg.genre, cg.region, cgs.total_sales
) 
SELECT genre, region, sales_ratio 
FROM cte_ranked
WHERE row_num = 1;

-- -----------------------------------------------------------------------------------------------------------------
-- ## Publication Analysis
-- total number of publisher
SELECT 
	COUNT(publisher) AS total_publishers
FROM video_game_sales;

-- Seeing who is the highest producing publisher
SELECT
	Publisher,
    COUNT(publisher) AS total_games_sold_in_millions
FROM video_game_sales
GROUP BY publisher
ORDER BY total_games_sold_in_millions DESC
lIMIT 5; -- Electronic Arts

-- Who is the publisher with the highest sales?
SELECT
	Publisher,
    ROUND(SUM(global_sales),1) AS Total_Sales
FROM video_game_sales
GROUP BY publisher
ORDER BY Total_Sales DESC
LIMIT 5; -- Nintendo top sales over EA
-- -------------------------------------------------------------------------------------------
-- ##Platform Analysis
-- Seeing What platform is most popular based on games sold and total sales
SELECT 
	Platform,
    COUNT(platform) AS total_count
FROM video_game_sales
GROUP BY Platform 
ORDER BY total_count DESC
LIMIT 5; -- DS has the most games

-- Sales across platforms
SELECT
	platform,
    ROUND(SUM(global_sales),2) AS Total_sales
FROM video_game_sales
GROUP BY platform
ORDER BY total_sales DESC
LIMIT 5; -- PS2 has the most amoutn of sales across all platforms

-- Creating CTEs with new columns as regions and looking at ranking sales based on genre and region
WITH na_sales_cte AS (
    SELECT genre, 'na_sales' AS region, NA_Sales AS sales 
    FROM games.video_game_sales
),
eu_sales_cte AS (
    SELECT genre, 'eu_sales' AS region, EU_Sales AS sales 
    FROM games.video_game_sales
), 
jp_sales_cte AS (
    SELECT genre, 'jp_sales' AS region, JP_Sales AS sales 
    FROM games.video_game_sales
), 
other_sales_cte AS (
    SELECT genre, 'other_sales' AS region, Other_Sales AS sales 
    FROM games.video_game_sales
), 
cte_grouped AS (
    SELECT * FROM na_sales_cte 
    UNION ALL 
    SELECT * FROM eu_sales_cte 
    UNION ALL 
    SELECT * FROM jp_sales_cte 
    UNION ALL 
    SELECT * FROM other_sales_cte
), 
cte_region_sales AS (
    SELECT region, SUM(sales) AS total_sales 
    FROM cte_grouped 
    GROUP BY region
), 
cte_ranked AS (
    SELECT 
        ROW_NUMBER() OVER (PARTITION BY cg.region ORDER BY SUM(cg.sales) / cgs.total_sales DESC) AS row_num, 
        cg.genre, 
        cg.region, 
        SUM(cg.sales) / cgs.total_sales AS sales_ratio 
    FROM cte_grouped cg 
    LEFT JOIN cte_region_sales cgs ON cg.region = cgs.region 
    GROUP BY cg.genre, cg.region, cgs.total_sales
) 
SELECT genre, region, sales_ratio 
FROM cte_ranked
WHERE row_num = 1;
