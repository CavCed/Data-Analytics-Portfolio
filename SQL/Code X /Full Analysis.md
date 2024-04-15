# Code X Energy Drink Analysis
## Table of Contents
- Introduction
- Data Exploratory
- Dashboard
- Results (Summarized)
- Reccomendations

## Step 1: Introduction:
Dhavel Patel and his partner Hemanand Vadivel, founders or E-learning platform, code basics, partner up to create different challeneges that aspiring analysts can use to practice and develop their analytical skills to help them become a better data analysts.

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

##### 1. Demographic Insights

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


**How effective are different marketing strategies and channels in reaching our customers?**

- A: Filtering out other brands, I found similar patterns as the questions prior in which digital marketing strategies are the most effective in reaching our customers.

![image](https://github.com/CavCed/Data-Analytics-Portfolio/assets/154090883/0a51a596-5ce7-428a-a704-dad6335e734c)

#### 5. Brand Penertration

**What do responders think about Code X as a brand?**

- A: 56.04% of responders who have heard of the brand before have a neutral rating about Code X while 25.05% have a positive review and only 18.9% have a negative persepective on the brand.

![image](https://github.com/CavCed/Data-Analytics-Portfolio/assets/154090883/bddb3fe4-158e-430a-aa45-35943a48f240)

**What Cities do we need focus more on?**

- A: Tier 1 cities that the company can focus on distributing more energy drinks to are Delhi and Chennai.

![image](https://github.com/CavCed/Data-Analytics-Portfolio/assets/154090883/1e1029c6-e9cc-4bde-8aae-52337fea5a00)

#### 6. Purchase Behavior

**Where do respondent prefer to purchase energy drinks?**

- A: Most energy drink purchases are bought at supermarketes, online retailers, and gym/fitness centers.

![image](https://github.com/CavCed/Data-Analytics-Portfolio/assets/154090883/3fe700d0-370c-477e-af2e-305ddf3ca5d0)

**What are the typical consumption situations for energy drink among respondents?**

- A: Most of our consumers typically consume our products durings sports/exercise and studying/working late

![image](https://github.com/CavCed/Data-Analytics-Portfolio/assets/154090883/73acdcb1-f03c-4c41-b24f-984ec2083c6e)


**What factors influence respondents' purchase decisions, such as price range and limited edition packaging?**

- A: Respnders are willing to spend on an average price range of 50-150 Rupees (Indian Currency) on energy dirnks and a 40% of those are willing to buy limited edition packaging while the other 60% are not sure or not willing to buy limited edition packaging.

***Price range***

![image](https://github.com/CavCed/Data-Analytics-Portfolio/assets/154090883/e310f94d-d442-4f09-8edc-ff4195cb4b30)

***Interest in limited edition packaging***

![image](https://github.com/CavCed/Data-Analytics-Portfolio/assets/154090883/5afef2de-06f5-4ccf-bbe3-a83dffdf2b98)

#### 7. Product Development

**Which are of buisness should we focus more on our product? (Branding/Taste/Availibity)?**

- A: On average, most surveyors who have tried our enery drink give a taste score of 3/5, giving it an avergae taste. Further more, majority of surveyors reccomended to lower the sugar content in the energy drinks and have an interest in adding natural or organic ingredients.

***Taste***

![image](https://github.com/CavCed/Data-Analytics-Portfolio/assets/154090883/1c57af3f-9e69-4141-be3e-7ed3a844101c)

***Improvements Desired***

![image](https://github.com/CavCed/Data-Analytics-Portfolio/assets/154090883/69823767-2b4b-4ecc-bf33-9813c92fa5a1)

***Interest in Natural or Organic Ingredients***

![image](https://github.com/CavCed/Data-Analytics-Portfolio/assets/154090883/750641f7-e0e5-40fe-ba27-3b4e55634e6c)

---- 

## Step 3: Visualization in Power BI:

Analysis and findings exported to Power BI to build an interactive dashboard

**Contents**
- Consumer age
- Heat map of energy distributions in India
- Reason for choosing brand
- Taste Rating
- location where Energyu drink purchased
- Imnprovements desired

![image](https://github.com/CavCed/Data-Analytics-Portfolio/assets/154090883/9e133f37-fb5e-44e7-b2b1-7e5f75c5861f)

----
## Step 4: Results (Summarized)

1.) Most Energy drink consumers are Males Between the ages of 19-30 year olds and the frequency of consumers decreases as age increases

2.) Surveyors expect to have caffeine as the main ingredient, however have an interest in natural/organic ingredients added into the drink

3.) Majority of surveyors choose brands based on their reputation rather than taste.

4.) Digital marketing has a larger impact than physical advertisements that reach the younger population.

5.) Energy drinks are commonly purchased at supermarkets and gyms with an intent to increase energy or for working out. 

6.) Major cities (Tier 1) have more availability of energy drinks compared to smaller cities (Tier 2)

----
## Step 5: Reccomendations:

Based on my analysis, here are some reccomendations that I would implement to increase the sales of Code X's energy drink.

**Brand Reputation and marketing changes**
- It is apparant that surveyors select brands due to their popularity. With this in mind, the company can increase their reputation by leveraging partnerships with famous individuals who also consume energy drinks to help them increase their performance in the gym. This partnership can be portrayed through digital marketings strategies such as social media, commericals, and digital promotions.

**Taste** 
- The taste of Code X energy drink product can make small improvements for significant results. Small adjustments such as reducing sugar content, increasing natural/organic ingredients, and increasing a broad band of flavors will improve consumers preference when selecting enery drinks. This will also help with brand reputation by raising awareness for a push on health inititiaves and listening to consumer preferences.

**Availability**
- My analysis underscores the importance of improving availability in supermarkets, gyms, and larger cities as a strategic initiative to drive market expansion and increase brand visibility. By capitalizing on these key distribution channels and tailoring our approach to meet the unique needs of each market segment, our energy drink company can position itself for sustained growth and success in the competitive beverage industry landscape
