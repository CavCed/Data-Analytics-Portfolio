# Video Game Sales Analysis
## Table of Contents
- Introduction
- Creating the data
- Cleaning/Exploratory Data Analysis
- Power BI Dashboard
- Summary

## Step 1: Introduction:

### About the data
For this project, data was extracted from Kaggle.com that contains a list of video games with sales greater than 100,000 copies from 1980 to 2017. The dataset contains video games sales across different platforms, genres, publishers, and regions around the globe. Data exploratory analysis was performed to discover key insights and identify patterns about the sales of different video games.    

Link to the dataset can be found here: [Kaggle.com](https://www.kaggle.com/datasets/gregorut/videogamesales/data)

###  Methodology
The dataset was originally downloaded as a CSV file but then translated to MySQL where I then created a database and performed exploratory analysis. After discovering important findings and conclusions, I transferred the data into Power BI to create an interactive and detailed visualization.

### Tools Used
- Microsoft Excel
- MySQL
- Power BI

### Main Tasks
The main objective of this project was to analyze and discover the sales performance of video games across different regions, platforms, and genres to identify trends and patterns to assist in strategic decision-making for game developers and marketers. 

To complete this, I asked myself these following questions:

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

3.) Publisher analysis

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

![image](https://github.com/CavCed/Data-Analytics-Portfolio/assets/154090883/40ef6771-c9c9-41db-b10e-c0990619d259)

## Step 3: Data cleaning and exploratory analysis:

#### Data Cleaing:
While using the import data wizard, an unnecessary column "video_salesco" was created so I removed that column. For the most part, this dataset was clean prior to analysis to due to no duplicates, nulls, or missing values, allowing for an accurate and precise analysis.

#### Data Exploratory Analysis:

##### Regional Sales Analysis:

a.) What are the sales trend throughout the years? (looking at the last 10 years)

![image](https://github.com/CavCed/Data-Analytics-Portfolio/assets/154090883/605807a8-4874-436a-8d49-3ef3d48f8bcc)

b.) What year had the most sales? - 2008 had the most sales 

![image](https://github.com/CavCed/Data-Analytics-Portfolio/assets/154090883/c689d400-e270-4cf6-b0f8-4e2257ab04e4)

c.) What region has the most avergae sales per year? The least? - North America ranks the highest average sales compared to other regions

![image](https://github.com/CavCed/Data-Analytics-Portfolio/assets/154090883/27301571-6ea4-4e68-8670-bf67bb122572)

d.) What percentage of sales in different regions account for global sales? - NA = 49%, Europe = 27%, Japan = 15%, Other = 9%

![image](https://github.com/CavCed/Data-Analytics-Portfolio/assets/154090883/657f489f-e18a-44d0-bb4f-34f1a1fae4fb)

e.) What are the top 5 best-selling video games?

![image](https://github.com/CavCed/Data-Analytics-Portfolio/assets/154090883/097df995-2d2c-400d-a472-59dccb2c60f9)


##### Genre distribution

a.) What genre of gaming is more prevelant?

- Most games that are sold are action games.
  
![image](https://github.com/CavCed/Data-Analytics-Portfolio/assets/154090883/73b61d40-1118-4473-aadf-974ea97749ab)


b.) How much does each genre sale on a global level?
 
![image](https://github.com/CavCed/Data-Analytics-Portfolio/assets/154090883/c785d47c-0dbe-415d-a121-962a4cd863be)

c.) How do genre preferences differ between North America, Europe, Japan, and other regions?

##### Publisher 

a.) What publication company produced the most video games?

- Electronic Art ranks the #1 puiblishing company with the most amount of video games sold per million

  ![image](https://github.com/CavCed/Data-Analytics-Portfolio/assets/154090883/f2c60e2e-d712-49b4-b4b6-f3025e5ac706)


b.) What publication company has made the most sales throughout the year?

- Although Electronic arts sold the most video games, Nintendo has made the largest sales

![image](https://github.com/CavCed/Data-Analytics-Portfolio/assets/154090883/b562fb28-445c-4354-ae60-995d85d4346b)


#### Platform analysis

a.) What platform has the most video games per platform?

- DS ranks as the platform with the most video games

![image](https://github.com/CavCed/Data-Analytics-Portfolio/assets/154090883/14dbff95-8c67-450b-8d8e-bc1c124c3233)


b.) What platform makes the most amount of video game sales per platform?

- PS2, Xbox 360, and PS3 rank as the platforms with the most sales

![image](https://github.com/CavCed/Data-Analytics-Portfolio/assets/154090883/e856cfc8-6e56-47fe-9b76-20f28cb12c1b)


## Step 4: Visualizing findings

After discovering key indicators and patterns within the dataset, I transitioned the data to Power BI, using the software's robust feature, to create an interactive dashboard that provides visualizations of the most important findings within the data.

Contents that are included in the dashboard are:

- Sales per year on a global scale and per regions
- Distribution of sales by Genre
- Top selling games
- Total sales by paltform

![image](https://github.com/CavCed/Data-Analytics-Portfolio/assets/154090883/943e483c-f883-496f-bd20-cf795cd5799f)


## Step 5: Summary:

##### Regional sales

The dataset indicates that North America is the leading market for video game sales, demonstrating a robust consumer base and significant revenue generation in this particular region. In particular, North America is responsible to approximately 49% of sales within this dataset followed by Europe (27%), Japan (15%) and other regions (9%).

Action games emerge as the top-selling genre, highlighting the genre's widespread appeal and ability to engage their audiences. Electronic Arts, or EA, stands as the publication company with the most video games published. However, Nintendo, stands as the leading publication with the highest sales. A primary example is one of their games "Wii Sports" which is the number 1 highest selling video game within this dataset. Additionally, the PlayStation 2 (PS2) is identified as the leading platform with the highest amount of sales. This is possibly due to advance graphic design and gameplay the platform offers on a diverse set of videogames.

With these key findings, game developers and marketing experts can use this information to create strategic decision-making choices to benefit their company and continute to create appealing and state of the art video games for players.
