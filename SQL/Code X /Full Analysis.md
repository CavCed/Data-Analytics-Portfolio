# Code X Energy Drink Analysis
## Table of Contents
- Introduction
- Data Exploratory
- Dashboard
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
Answer these following questions to find insights to conclude ideas promoting Code X energy drink and the brand.
1. Demographic Insights 

       a. Who prefers energy drink more?

       b. Which age group prefers energy drinks more?

       c. Which type of marketing reaches the most Youth (15-30)?
  
2. Consumer Preferences:

       a. What are the preferred ingredients of energy drinks among respondents?

       b. What packaging preferences do respondents have for energy drinks?
  
3. Competition Analysis:

       a. Who are the current market leaders?

       b. What are the primary reasons consumers prefer those brands over ours?
   
4. Marketing Channels and Brand Awareness:

       a. Which marketing channel can be used to reach more customers?

       b. How effective are different marketing strategies and channels in reaching our customers?

5. Brand Penetration:

       a. What do people think about our brand? (overall rating)
  
       b. Which cities do we need to focus more on?
       
6. Purchase Behavior:

        a. Where do respondents prefer to purchase energy drinks?
  
        b. What are the typical consumption situations for energy drinks among respondents?
    
        c. What factors influence respondents' purchase decisions, such as price range and limited edition packaging?
  
7. Product Development

        a. Which area of business should we focus more on our product development? (Branding/taste/availability)

### Methodology:

The datasets were downloaded to Google's Big Query cloud platform for data cleaning/exlploration and then transfered to Power BI to create an interactive dashboard illustrating the main findings from my analysis. 

----
## Step 2: Data Exploratory:
#### Data Cleaning Process:
Once the datasets were downloaded, they were uploaded to Google's cloud platform Big Query for date cleaing and exploratory using GoogleSQL.

After review, this dataset is very clean due to no duplicates, null, or missing values allowing for an accurate analysis.

#### Data Exploratory

###### 1. Demographic Insights

Who Prefers Energy Drinks more? - Males

![image](https://github.com/CavCed/Data-Analytics-Portfolio/assets/154090883/e7a86b7b-13cb-42b9-be86-3540e019ddb7)

Which age group prefers enery drinks more? - A: Most energy drink consumers are between the ages of 19-30 years old

![image](https://github.com/CavCed/Data-Analytics-Portfolio/assets/154090883/79b129fd-34e3-4b83-a3d0-a18878a0a193)

What type of Marketing reaches the most youths? - A: Online/digital platforms reaches youths compared to physical advertisements such as billboards and print media

![image](https://github.com/CavCed/Data-Analytics-Portfolio/assets/154090883/455eace0-ea8b-4d26-9912-4336695ba04e)

##### 2. Consumer Preference

What are the preferred energy drinks amount respondents? - A: Hence the name, most consumers prefer caffeine to be the main ingredient while only a few only prefer guarana, a plant, that produces similar effects to caffeine.

![image](https://github.com/CavCed/Data-Analytics-Portfolio/assets/154090883/5c84d7ee-9449-4454-8f09-be293ac6b4fd)

What packaging preference do respondents prefer the most? - A: Respodents prefer copmact and portabile cans compared to other forms of packaging.

![image](https://github.com/CavCed/Data-Analytics-Portfolio/assets/154090883/1f91a26a-a033-4d80-8171-7f90ed9df527)

##### 3. Competition Analysis

Who are the current Market leaders? - A: 1st cola-Coka, 2nd: Bepsi, 3rd: Gangster and Code X ranks 5th on the list

![image](https://github.com/CavCed/Data-Analytics-Portfolio/assets/154090883/dc666082-19f2-4fac-b4e5-45a1606ad5fd)

What are the primary reasons consumers prefer those brands compared to ours? - A: Consumers choose Cola-Coka due to the brand reputation that it has compared to ours.

![image](https://github.com/CavCed/Data-Analytics-Portfolio/assets/154090883/e89f5a89-3ef9-416f-a2e4-0c270062d426)

##### 4. Marketing Channels and Brand Awareness

Which marketing channel can be used to reach more customers? - A: Responders selected that that they see most energy drink advertisements through digital media such as online ads and TV commercials which are more compared to the sum of billboards, print media, and other forms of advertisement (billboards + print media + other = 3292).

![image](https://github.com/CavCed/Data-Analytics-Portfolio/assets/154090883/925f6781-9ed1-40dd-867c-a2b7343126d1)


How effective are different marketing strategies and channels in reaching our customers?

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
