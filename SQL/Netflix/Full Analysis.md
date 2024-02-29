# Netflix Full Project Analysis
## Table of Contents
- Data Collection
- Data Exploratory in SQL
- Visualization in Tableau
- Analysis/key findings
- Conclusion

## Step 1: Data Collection:

#### Link to dataset:
This dataset is located and extraced from [Kaggle.com](https://www.kaggle.com/datasets/shivamb/netflix-shows/data) 

### About the Data: 
Netflix is a renowned streaming service that offers a wide variety of award-winning TV shows and Movies that individuals can binge if they purchase a membership with the company. The streaming service was first founded in 1997 and launched in April of 1998. This dataset consists the listing of all the movies and TV shows available on Netflix, along with details such as cast members, directors, ratings, release year, and duration.

### Methodology: 
The dataset was originally downloaded to Microsoft Excel for brief data cleaning and then later uploaded to Microsoft SQL Server for further exploratory analysis. After discovering patterns and KPIs, I will move the data to Tableau for a detailed visualization. 
&nbsp;

### Questions that Need to be Answered:
### 1.)	Does Netflix have more focus on TV Shows or Movies?
### 2.)	What content is available in different countries?
### 3.)	What is the network analysis of Actors/Directors?
----
## Step 2: Data Cleaning and Exploratory in SQL:
#### Data Cleaning Process:
Prior to analyzing the data, I noticed that column duration has shifted to ratings column for show_id s5542, s5795, and s5814 so I shifted them to the correct column in excel.
&nbsp;

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
-	Rajiv Chilaka and cast members Vatsal Dubey, Julie Tejwani, Rupa Bhimani, etc. have the highest connection between director and cast members than any other relationships. This is due to a sequel of indian movies that has been filmed.
