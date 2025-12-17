create database project1

-- Set the context to your specific database
USE Project1;
GO

-- -----------------------------------------------------------
-- 1. DATA INTEGRITY CHECK (GOOD PRACTICE)
--    Checks for any unexpected NULL values in the key financial columns.
--    (If the result is 0, the data is clean.)
-- -----------------------------------------------------------
SELECT
    COUNT(*) AS Null_Check_Count
FROM
    Retailanalysis
WHERE
    Sales IS NULL OR Profit IS NULL OR [Order_Date] IS NULL; -- Brackets added here
GO
-- -----------------------------------------------------------
-- 2. PROFIT MARGIN BY TOP-LEVEL CATEGORY
--    Shows the overall financial health of the three main product groups.
-- -----------------------------------------------------------
SELECT
    Category,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    -- Calculates the profit margin: (Profit / Sales)
    ROUND((SUM(Profit) / SUM(Sales)), 4) AS Profit_Margin
FROM
    Retailanalysis
GROUP BY
    Category
ORDER BY
    Total_Profit DESC;
GO

-- -----------------------------------------------------------
-- 3. IDENTIFY PROFIT-DRAINING SUB-CATEGORIES (KEY PROJECT REQUIREMENT)
--    Ranks sub-categories by total profit in ASCENDING order to show losses (negative profit) first.
-- -----------------------------------------------------------
SELECT TOP 10
    Category,
    [Sub_Category], -- Use brackets for column names with hyphens/spaces
    SUM(Profit) AS Total_Profit,
    SUM(Sales) AS Total_Sales,
    ROUND((SUM(Profit) / SUM(Sales)), 4) AS Profit_Margin
FROM
    Retailanalysis
GROUP BY
    Category,
    [Sub_Category]
ORDER BY
    Total_Profit ASC; -- ASCENDING shows the LEAST profitable/most loss-making items
GO

-- -----------------------------------------------------------
-- 4. REGIONAL PROFIT BREAKDOWN
--    Analyzes Total Profit segmented by Region and Category, useful for dashboard filtering.
-- -----------------------------------------------------------
SELECT
    Region,
    Category,
    SUM(Profit) AS Total_Profit
FROM
    Retailanalysis
GROUP BY
    Region,
    Category
ORDER BY
    Region,
    Total_Profit DESC;
GO

-- -----------------------------------------------------------
-- 5. TOP 10 MOST PROFITABLE PRODUCTS
--    Identifies specific high-value products you should promote.
-- -----------------------------------------------------------
SELECT TOP 10
    [Product_Name],
    Category,
    [Sub_Category],
    SUM(Profit) AS Total_Profit
FROM
    Retailanalysis
GROUP BY
    [Product_Name],
    Category,
    [Sub_Category]
ORDER BY
    Total_Profit DESC;
GO