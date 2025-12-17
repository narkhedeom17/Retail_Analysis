# Retail Business Performance & Profitability Analysis

## Project Objective
This project analyzes transactional retail data to identify "profit-drainers," optimize inventory turnover, and understand seasonal demand. The goal is to provide actionable insights that reduce overstock and improve the bottom line.

## Tech Stack
* **Database:** SQL (Data cleaning and margin calculations)
* **Analysis:** Python (Pandas for correlation, Seaborn for visualization)
* **Visualization:** Tableau (Interactive executive dashboard)

## Project Workflow
1.  **Data Cleaning:** Handled null values and inconsistent formatting using SQL.
2.  **Profitability Analysis:** Calculated Gross Profit Margin using:
    `((Sales - Cost) / Sales) * 100`
3.  **Inventory Correlation:** Used Python to determine the relationship between 'Days in Inventory' and 'Net Profit.'
4.  **Dashboarding:** Created a dynamic Tableau view to track KPIs across regions and seasons.

## Key Files
* `analysis_queries.sql`: All SQL scripts for data preparation.
* `inventory_correlation.ipynb`: Python notebook for statistical analysis.
* `Retail_Insights_Report.pdf`: Final business summary.

## How to Use
1. Run the SQL scripts to generate the processed tables.
2. Update the file paths in the Python script to analyze specific inventory cycles.
3. Connect the Tableau workbook to the SQL output for real-time visualization.
