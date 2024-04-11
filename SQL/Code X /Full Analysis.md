# Code X Energy Drink Analysis
## Table of Contents
- Introduction
- Data Exploratory in Big Query
- Visualization in Power BI
- Analysis/key findings
- Conclusion

## Step 1: Introduction:
Dhavel Patel and his partner Hemanand Vadivel, founders or E-learning platform, code basics, partner up to create different challeneges that aspiring analysts can use to practice and develop their analytical skills to help them become a better data analyts.

The dataset can be found on their main website here [Codebasic.io](https://codebasics.io/challenge/codebasics-resume-project-challenge).

The datasets that are included in the challenege are 3 CSV files: 
- dim_respondents.csv
- dim_cities.csv
- fact_survey_responses.csv

### Scenario: 
CodeX is a German beverage company that is aiming to make its mark in the Indian market. A few months ago, they launched their energy drink in 10 cities in India.

Their Marketing team is responsible for increasing brand awareness, market share, and product development. They conducted a survey in those 10 cities and received results from 10k respondents. Peter Pandey, a marketing data analyst is tasked to convert these survey results to meaningful insights which the team can use to drive actions.

### Tasks:
Answer these following questions to finds out primary and secondary insights to conclude ideas promoting Code X energy drink and the brand.
1. Demographic Insights (examples)

       a. Who prefers energy drink more?

       b. Which age group prefers energy drinks more?

       c. Which type of marketing reaches the most Youth (15-30)?
  
3. Consumer Preferences:

       a. What are the preferred ingredients of energy drinks among respondents?

       b. What packaging preferences do respondents have for energy drinks?
  
5. Competition Analysis:

       a. Who are the current market leaders?

       b. What are the primary reasons consumers prefer those brands over ours?
   
7. Marketing Channels and Brand Awareness:

       a. Which marketing channel can be used to reach more customers?

       b. How effective are different marketing strategies and channels in reaching our customers?

9. Brand Penetration:

       a. What do people think about our brand? (overall rating)
  
       b. Which cities do we need to focus more on?
       
10. Purchase Behavior:

        a. Where do respondents prefer to purchase energy drinks?
  
        b. What are the typical consumption situations for energy drinks among respondents?
    
        c. What factors influence respondents' purchase decisions, such as price range and limited edition packaging?
  
12. Product Development

        a. Which area of business should we focus more on our product development? (Branding/taste/availability)

### Methodology:

The datasets were downloaded to Google's Big Query cloud platform for data cleaning/exlploration and then transfered to Power BI to create an interactive dashboard illustrating the main findings from my analysis. 

----
## Step 2: Data Cleaning and Exploratory in SQL:
#### Data Cleaning Process:
Prior to analyzing the data, I noticed that column duration has shifted to ratings column for show_id s5542, s5795, and s5814 so I shifted them to the correct column in excel.

Notebook:

1.)	Early part of data exploratory I wanted to know the amount of data that I am working with and then showing then breaking it down further by showing the total number of Movies and TV shows that are contained in the dataset.
 
![image](https://github.com/CavCed/DataAnalyticsPortfolio/assets/154090883/17c885f9-e94b-4fb1-b17f-c7650cc6e801)

![image](https://github.com/CavCed/DataAnalyticsPortfolio/assets/154090883/b354c81c-bf44-49dc-adde-98a36a0839d9)


2.)	To show what contents are available in different countries, I wanted to first see what countries the biggest film producers.

![image](https://github.com/CavCed/DataAnalyticsPortfolio/assets/154090883/4397ac5e-b0b8-44e7-badb-63f7dc2d8ddb)
 
2a.) I then wanted to see which TV/Movie Ratings were most common throughout the dataset.

![image](https://github.com/CavCed/DataAnalyticsPortfolio/assets/154090883/9f5014ea-b0d7-461b-adfd-11e8ed67cf5e)


2b.) I then took the Top 3 countries (US, India, and United Kingdom) and compared what TV/Movie ratings were available in each country.

![image](https://github.com/CavCed/DataAnalyticsPortfolio/assets/154090883/16f529a2-554d-4af6-8def-5450047c933f)
![image](https://github.com/CavCed/DataAnalyticsPortfolio/assets/154090883/5c2b7934-b4b5-42a0-b654-410672fb866a)
![image](https://github.com/CavCed/DataAnalyticsPortfolio/assets/154090883/bd0da5fd-6b59-4303-8a59-b2837b7a9d8a)
     

3.)	To look at the network relationship between directors and cast members, I first looked at which director has produced the most films in the dataset.

![image](https://github.com/CavCed/DataAnalyticsPortfolio/assets/154090883/fe19070d-7e86-4cf8-951d-43644bbf7ff9)

  
3a.) I then looked at which cast member(s) and the total number of films they are in.

![image](https://github.com/CavCed/DataAnalyticsPortfolio/assets/154090883/27aa7295-c873-484f-bf63-4255a0357038)

 
3b.) For the next step I looked at the top 5 producing directors and see which cast were associated with their movies/TV shows

![image](https://github.com/CavCed/DataAnalyticsPortfolio/assets/154090883/e621e5ae-b89c-4334-8dd0-39c36c1b0a62)

 
3c.) For extra analysis, I took the most frequent network connection between the director and cast member(s) and looked at what type of film they produced the most.

![image](https://github.com/CavCed/DataAnalyticsPortfolio/assets/154090883/7a5dda36-9497-4df8-b7a3-8998d3c02657)

---- 

## Step 3: Visualization in Tableau:

Link to dashboard: [Netflix Dashboard](https://public.tableau.com/views/NetflixDashboard_17083612145830/Dashboard1?:language=en-US&:sid=&:display_count=n&:origin=viz_share_link)

### Contents include:
-	Movie/Show Distribution
-	Heatmap of countries where films were produced.
-	Tree map of most common Genre
-	Count of films released throughout the years.
-	Top Directors
-	Top Cast members

![image](https://github.com/CavCed/DataAnalyticsPortfolio/assets/154090883/5b8b989b-1ba7-4329-9428-f2dc2a87e8f5)


----
## Step 4: Analysis/Key findings:

- There are more movies produced than TV films in the dataset
  
-	The top 3 countries that produce the most amount of TV shows/Movies are the United States, India, and United Kingdom in that order.
-	United States and India had more movies filmed in their country.
-	United Kingdom almost had equal amount of TV shows and movies.

- Rajiv Chilaka directed the greatest number of films in this case the most movies.

- Most films were released to Netflix in the late 2000’s

- Highest number of Genre produced were Dramas, International Movies

----
## Step 5: Conclusion:

### Revisiting Questions that need to be answered:

#### 1.)	Does Netflix have more focus on TV Shows or Movies?
-	According to this dataset, Netflix has more of an emphasis on Movies compared to TV shows.
  
#### 2.)	What content is available in different countries?
-	Based on the top 3 producing countries, the United States allows all types of contents while India and United Kingdom only allow a few ratings in their country

#### 3.)	What is the network analysis of Actors/Directors?
-	Rajiv Chi
