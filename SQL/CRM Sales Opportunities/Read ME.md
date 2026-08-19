# CRM Sales Opportunities Business Dashboard
## Table of Contents
  - Introduction
  - Data Exploration and Cleaning
  - Power BI dashboards
  - Results/Summary
  - Recommendations

## Introduction

Dataset location: [Maven Analytics](https://mavenanalytics.io/challenges/maven-sales-challenge)
- Accounts.csv
- Data_dictionary.csv
- Product.csv
- Sales_pipeline.csv
- Sales_team.csv 

### Scenario
Maven Analytics is an online learning platform and community focused solely on data literacy and AI that offers challenges to other analysts worldwide.

For this challenge, I am simulating the role of a Data Analysts for MavenTech, a company that specializes in selling computer hardware to large businesses. The company has been using a new CRM system to track their sales opportunities but have no visibility of the data outside of the platform.
The CEO and CFO are looking to become a more data-driven organization and have tasked my team to analyze and create an interactive dashboard that enables sales managers to track their team's quarterly performance.

The following business questions were developed from the perspective of sales executives, regional managers, and sales operations leaders:

1.) Executive Summary:

      a. How much revenue is the company generating from closed-won opportunities?
      b. How many deals are winning vs losing?
      c. What is the overall win rate?
      d. Are there quarter-to-quarter revenue trends?
      e. Which regions are generating the most revenue?

2.) Sales Team Effectiveness:

      a. Which sales agents are top performers?
      b. Are any sales agent lagging behind
      c. Which sales agents have the strongest win rates?
      e. Which managers are leading the strongest teams?
      f. Are Sales Agents converting activity into revenue?
      
3.) Product/Pipeline Performance:

      a. Which products generate the most revenue?
      b. Which products have the strongest win rates?
      c. Which products have weak conversion?
      d. Are higher-priced products harder to close?
      e. How healthy is the sales pipeline?

 4.) Customer & Market Segmentation
 
      a. Which customer accounts are most valuable?
      b. Which sectors generate the most revenue?
      c. Do larger account generate more revenue?
      d. Which office locations contribute most to revenue?
      e. Which sector generated the most revenue and what was their win rate?

--

## Data Exploratory
### Data Cleaning Process:

Cleaning process included analyzing 8,800 total records within each csv files that were uploaded into Big Query for processing and data relationships across each table.
Data inconsistencies found are listed below:
  - New views were created for sales pipeline and accounts table for the reasons below:
    - Product listed as "GTXPro" formatted to match original "GTX Pro"
    - Philippines misspelled as "Philipines"
    - "Technolgy" corrected to "Technology"
    - Blank account values renamed to "Unknown Accounts"

### Executive Summary
      a. How much revenue is the company generating from closed-won opportunities?
        - The company generated approximately $10.01 M from closed-won opportunities
        
      b. How many deals are winning vs losing?
        - 4,238 deals were won while 2,473 were lost.
        
      c. What is the overall win rate?
        - Overall win rate is approximately 63%, which is calculated as won deals divided by total closed deals
        
      d. Are there quarter-to-quarter revenue trends?
        - Q1 started at the lowest revenue gained but the largest revenue was generate in Q2. Slight decrease in revenue from Q3 to Q4 but still significant compared to Q1 lows.
        
      e. Which regions are generating the most revenue?
        - Regions generating the most revenue are the West, Central, and East in that order

### Sales Team Effectiveness

      a. Which sales agents are top performers?
        - In terms of revenue for top performers, the top 3 sales agents are Darcel, Vicki, and Kary
        
      b. Are any sales agent lagging behind?
        - Benchmarks determined by business can justify this answer but total opportunities range from 230-750, win rate 57%-70% as seen in the chart
        
      c. Which sales agents have the strongest win rates?
        - Maureen Marcano has the highest win rate at 70.0%
        
      e. Which managers are leading the strongest teams?
        - Melvin Marxen has the highest total opportunities and also has the highest revenue

### Product & Pipeline Performance

      a. Which products generate the most revenue?
        - GTX Pro generates the most revenue at $3.5 M 
        
      b. Which products have the strongest win rates?
        - MG special has the highest win rate
        
      c. Which products have weak conversion?
        - GTX 500 ranks lowest in win rate
        
      d. Are higher-priced products harder to close?
        - Yes, the GTK 500, which has a sales price of $26,768, only has a win rate of 60%
        
      e. How healthy is the sales pipeline?
        - The pipeline shows all products with high engaging opportunities which means most products are in the negotiation phase. However, without any future data, the prospecting numbers are relatively low and should be considered.

### Customer & Market Segmentation

      a. Which customer accounts are most valuable?
        - The most valuable customer account is Kan-code, with a total revenue of $341,455
        
      b. Which sectors generate the most revenue?
        - Retail generates the most revenue at $1.9 M
        
      c. Do larger account generate more revenue?
        - Yes. Kan-code has approximately 11,698.03 employees and has the highest revenue
        
      d. Which office locations contribute most to revenue?
        - United States office locations generate the most revenue
        
      e. Which sector generated the most revenue and what was their win rate?
        - Retail generated the most revenue with a win rate ranging from 59%-70%

## Power BI 

### Executive Summary
<img width="775" height="430" alt="image" src="https://github.com/user-attachments/assets/4b8634b5-ca7f-4c4e-8385-1286f48c72da" />

### Sales Team Performance
<img width="780" height="445" alt="image" src="https://github.com/user-attachments/assets/bc3820e3-f152-4a47-801d-82c61aca3be9" />

### Product Performance
<img width="777" height="437" alt="image" src="https://github.com/user-attachments/assets/237ef997-1ba5-4527-ab60-9062f786dd1e" />

### Account and Sector Analysis
<img width="773" height="433" alt="image" src="https://github.com/user-attachments/assets/0b31aac7-7459-45e4-a7d0-b3d9ad6e4c12" />

## Results

After thorough analysis, the results of the business project can be seen below:
 - Company generated approximately $10.01M from closed-won opportunities
 - Sales team closed 4,238 won deals and 2,473 lost deals
 - Overall win rate is 63%
 - Average sales cycle was approximately 48 days from engagement to close
 - Revenue and conversion performance varied across agents, managers, regions, products, accounts, and sectors.
 - Product and account analysis showed revenue concentration in specific products and high-value customers.
 - Data quality issues were identified, including inconsistent product names, misspelled categories, missing account values, and incomplete date fields.

## Recommendations for the business
Based on my analysis and dashboard creation, here is what I would recommend to the business to improve processes and improve efficiency:
- Utilize executive summary dashboard to monitor core KPI's regularly such as total revenue, win rate, deals won or lost, sales cycle length, and Q-to-Q performances
- Analyze lost opportunities by product, region, agent, and sector to understand conversion gaps in the pipelines.
- Use Sale team performance dashboard to monitor agent insights for improving coaching with low win rates, revenue, or long sale cycles.
- Utilize product performance dashboard and capitalize on products that are generating the most revenue, best engaging to prospecting ratio, and highest win rate while monitoring products that are on the lower end of the spectrum
- Monitor Data quality by keeping consistent product name usage and prioritize close-date requirements to improve reporting accuracy.
