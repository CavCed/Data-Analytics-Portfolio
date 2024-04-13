##Data exploration
-- Counting disctint values in tables for duplicates
SELECT distinct(count(*))
FROM `CodeX.Survey_answers`

SELECT distinct(count(*))
FROM `CodeX.Responders`

SELECT distinct(count(*))
FROM `CodeX.Cities`

-- Primary Insights (Sample Sections/Questions)

##Demographic Insights:
--- Who prefers energy drinks more? (A: Males)
SELECT gender, count(gender) as total
FROM `my-first-data-project-390217.CodeX.Responders` R
JOIN `my-first-data-project-390217.CodeX.Survey_answers` S
  ON R.Respondent_ID = S.Respondent_ID
WHERE consume_frequency = "2-3 times a week"
GROUP BY Gender

--- Which age group prefers energy Drinks more? (19-30 year olds)(side note: trend showing younger age group more prone to energy drinks)
SELECT Age, COUNT(Age) as Total_age_count
FROM `my-first-data-project-390217.CodeX.Responders` R
JOIN `my-first-data-project-390217.CodeX.Survey_answers` S
  ON R.Respondent_ID = S.Respondent_ID
WHERE Consume_frequency = "2-3 times a week"
GROUP BY Age
ORDER BY Total_age_count DESC

---- Which type of marketing reaches the most youth? (online ads - online marketing)
SELECT age, Marketing_channels, count(marketing_channels) as Total
FROM `my-first-data-project-390217.CodeX.Responders` R
JOIN `my-first-data-project-390217.CodeX.Survey_answers` S
  ON R.Respondent_ID = S.Respondent_ID
WHERE age = "19-30"
GROUP BY age,Marketing_channels
ORDER BY total DESC

##Consumer Prefernces:
-- What are the preferred ingredients of energy drinks among respondents? (Caffeine and vitamins)
SELECT Ingredients_expected, count(Ingredients_expected) as Total
FROM `my-first-data-project-390217.CodeX.Survey_answers`
GROUP BY Ingredients_expected
ORDER BY Total DESC

-- What packaging preferences do respondents have for energy drinks? (Compact and portable cans)
SELECT Packaging_preference, count(Packaging_preference) as Total_count
FROM `CodeX.Survey_answers`
GROUP BY Packaging_preference
ORDER BY Total_count DESC

##Competition Analysis
-- Who are the current market leaders? (1st: Cola-Coka, 2nd: Bepsi, 3rd: Gangster.....CodeX ranks 5th)
SELECT Current_brands, count(Current_brands) as Preference_count
FROM `CodeX.Survey_answers`
GROUP BY current_brands
ORDER BY Preference_count DESC

-- What are the primary reasons consumers prefer those brands over ours? (Brand reputation)
SELECT Reasons_for_choosing_brands, count(Reasons_for_choosing_brands) as Total
FROM `CodeX.Survey_answers`
WHERE Current_brands != "CodeX"
GROUP BY Reasons_for_choosing_brands
ORDER BY Total DESC

##Marketing Channels and Brand Awareness
-- Which marketing channel can be used to reach more customers? (Print media - with everything going digital, could also improve TV commercials)
SELECT Marketing_channels, count(Marketing_channels) as Total
FROM `CodeX.Survey_answers`
GROUP BY Marketing_channels
ORDER BY Total

-- How effective are different marketing strategies and channels in reaching our customers? (Online ads are very effective while print media is the least effective)
SELECT Marketing_channels, count(Marketing_channels) as Total
FROM `CodeX.Survey_answers`
WHERE Current_brands = "CodeX"
GROUP BY Marketing_channels
ORDER BY Total

##Brand Penertration
-- What do people think about our brand (overall rating)? (Negative = 17.55%, Neutral = 60.1%, Positive = 22.35%)
SELECT brand_perception, count(Brand_perception) as Brand_Preception_count, round(count(Brand_perception) * 100.0 / sum(count(Brand_perception)) OVER (),2) as Percentage_Total
FROM `CodeX.Survey_answers`
WHERE Current_brands = "CodeX"
GROUP BY Brand_perception;

-- Which cities do we need to focus more on? (Lucknow and jaipur)
SELECT Tier, City, COUNT(Purchase_location) as Total_purchases
FROM `CodeX.Cities` C
JOIN `CodeX.Responders` R
  ON C.City_ID = R.City_ID
JOIN `CodeX.Survey_answers` S
  ON R.Respondent_ID = S.Respondent_ID
WHERE Current_brands = "CodeX"
GROUP BY 1,2
ORDER BY 3 DESC;

##Purhcase Behavior
-- Where do respondents prefer to purchase energy drinks? (Supermarkets, Online retailers, and Gyms/Fitness Centers)
SELECT Purchase_location, COUNT(Purchase_location) AS Total_Purchases
FROM `CodeX.Survey_answers`
GROUP BY 1
ORDER BY 2 DESC;

-- What are the typical consumption situations for energy drinks among respondents? (Sports/exercise and studying/working late)
SELECT Typical_consumption_situations, count(Typical_consumption_situations) as Total_count
FROM `CodeX.Survey_answers`
GROUP BY Typical_consumption_situations
ORDER BY Total_count DESC

-- What factors influence respodents' purchase decisions, such as price range and limited edition?
SELECT Limited_edition_packaging, count(Limited_edition_packaging) AS Total
FROM `CodeX.Survey_answers`
JOIN `CodeX.Responders`
  ON `CodeX.Survey_Answers`.Respondent_ID = `CodeX.Responders`.Respondent_ID
WHERE age = "19-30"
GROUP BY Limited_edition_packaging -- 60% agree to limited edition while 60% do not care

-- Looking at Price Ranges considered reasonable
SELECT Price_range, count(Price_range) AS Total_count_preference
FROM `CodeX.Survey_answers`
GROUP BY Price_range -- most consumers are willing to spend somewhere between 50-150 Rupes

##Product development
-- Which area of business should we focus more on out product development (Branding/Taste/availability)?
--- Taste experience: Most drinkers think our product taste average(3/5)
SELECT RANK() OVER (ORDER BY COUNT(Taste_experience) DESC) AS Rank, Taste_experience, count(Taste_experience) as Total_count 
FROM `CodeX.Survey_answers`
WHERE Current_brands = "CodeX"
GROUP BY Taste_experience
ORDER BY Rank

-- Looking at what types of improvements are desired for CodeX
SELECT Improvements_desired, count(Improvements_desired) AS total_count
FROM `CodeX.Survey_answers`
WHERE Current_brands = "CodeX"
GROUP BY Improvements_desired

-- Do surveryors have in interest in Natural or organic ingredients? (Majority states yes)
WITH Total_count AS (
  SELECT COUNT(*) AS Total_count
  FROM `CodeX.Survey_answers`
)
SELECT Interest_in_natural_or_organic, COUNT(Interest_in_natural_or_organic) as Total_Interest_count, (COUNT(Interest_in_natural_or_organic)*100.0/Total_count.Total_count) AS Percentage
FROM `CodeX.Survey_answers`
CROSS JOIN Total_count
GROUP BY Interest_in_natural_or_organic, Total_count.Total_count
