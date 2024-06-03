# Video Game Analysis
## Table of Contents
- Introduction
- Creating the data
- Cleaning/Exploratory Data Analysis
- Power BI Dashboard
- Results/findings

## Step 1: Introduction:

### About the data
For this project, data was extracted from Kaggle.com that contains a list of video games with sales greater than 100,000 copies from 1980 to 2017. The dataset contains video games sales across different platforms, genres, publishers, and regions around the globe. Data exploratory analysis was performed to discover key insights and identify patterns about the sales of different video games.    

Link to the dataset can be found here: [Kaggle.com](https://www.kaggle.com/datasets/gregorut/videogamesales/data)

###  Methodology
The dataset was originally downloaded as a CSV file but then translated to MySQL where I then created a database and performed exploratory analysis. After discovering important findings and conclusions, I transferred the data into Power BI to create an interactive and detailed visualization.

### Main Tasks
The main objective of this project was to analyze and discover the sales performance of video games across different regions, platforms, and genres to identify trends and patterns to assist in strategic decision-making for game developers and marketers. 

To do this, I asked myself these following questions:
1. Regional sales analysis:

        a.) What are the sales trend throughout the years?

        b.) What year had the most sales?

        c.) What region has the most avergae sales per year? The least?

        d.) What percentage of sales in different regions account for global sales?

        e.) What are the top 5 most recent best-selling video games?

3. Genre distribution

        a.) What genre is sold the most globally?

        b.) How much does each genre sale on a global level?

        c.) How do genre preferences differ between North America, Europe, Japan, and other regions?

3.) Publisher 

        a.) What publication company produced the most video games?

        b.) What publication company has made the most sales throughout the year?

4.) Platform analysis

        a.) What platform has the most video games sold?

        b.) What platform makes the most amount of video game sales per platform?

       
## Step 2: Creating the data:

1.) The first step in uploading this dataset into MySQL was first creating a database to connect to.

2.) I then created a table with these following columns:

- Rank (INT)
- Year (INT)
- Genre (VARCHAR(45))
- Publisher (VARCHAR(200))
- NA_Sales (FLOAT)
- EU_Sales (FLOAT)
- JP_Sales (FLOAT)
- Other_Sales (FLOAT)
- Gloabl_Sales (FLOAT)
- Platform (VARCHAR(100))

3.) Data values were uploaded using MySQL's table data import wizard

![image](https://github.com/CavCed/Data-Analytics-Portfolio/assets/154090883/e20dbf1b-87cf-42a8-ae77-2f46e3325b39)

## Step 3: Data cleaning and exploratory analysis:

#### Data Cleaing:
While using the import data wizard, an unnecessary column "video_salesco" was created so I removed that column. For the most part, this dataset was clean prior to analysis to due to no duplicates, nulls, or missing values, allowing for an accurate and precise analysis.

#### Data Exploratory Analysis:

##### Regional Sales Analysis:

a.) What are the sales trend throughout the years?

b.) What year had the most sales?

c.) What region has the most avergae sales per year? The least?

d.) What percentage of sales in different regions account for global sales?

e.) What are the top 5 most recent best-selling video games?

##### Genre distribution

a.) What genre is sold the most globally?

b.) How much does each genre sale on a global level?

c.) How do genre preferences differ between North America, Europe, Japan, and other regions?

##### Publisher 

a.) What publication company produced the most video games?

b.) What publication company has made the most sales throughout the year?

#### Platform analysis

a.) What platform has the most video games sold?

b.) What platform makes the most amount of video game sales per platform?

## Step 4: Visualizing findings

![image](https://github.com/CavCed/Data-Analytics-Portfolio/assets/154090883/943e483c-f883-496f-bd20-cf795cd5799f)


## Step 5: Results

#### Key Insights 
