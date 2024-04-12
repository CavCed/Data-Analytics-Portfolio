-- total movies/shows in dataset (8807 total)
SELECT count(*) AS Total_films
FROM dbo.netflix_titles

-- Conuting number of shows vs movies in dataset (6131 Movies / 2676 shows)
SELECT type, count(type) AS Total
FROM dbo.netflix_titles
GROUP BY type

-- Countries where most movies/shows were produced (US, india, United Kingdom)
SELECT country, count(country) as Total
FROM dbo.netflix_titles
GROUP BY country
HAVING count(country) > 400
ORDER BY 2 desc

-- Showing the top countries and the amount of TV shows vs Movies they made
SELECT country, type, count(type) as total
FROM dbo.netflix_titles
WHERE country = 'united states' OR country = 'india' OR country = 'United Kingdom'
GROUP BY country, type
ORDER BY 1,2

-- What rating is most common (TV-MA, TV-14, TV-PG)
SELECT rating, count(rating) AS Total_count
FROM dbo.netflix_titles
GROUP BY rating
ORDER BY Total_count desc

-- What contents are availble is each country?
SELECT rating, count(rating) AS Total_count, country
FROM dbo.netflix_titles
WHERE country = 'United Kingdom'
GROUP BY country, rating
ORDER BY 3,2 DESC

--Most Common Genres (Dramas/international Movies, Documentaries, Stand-Comedy)
SELECT listed_in, count(listed_in) as Total
FROM dbo.netflix_titles
GROUP BY listed_in
ORDER BY 2 DESC

-- Year that had the most movies released (2018, 2017, 2016, 2019)
SELECT release_year, count(release_year) as Total
FROM dbo.netflix_titles
WHERE type = 'movie'
GROUP BY release_year
ORDER BY TOTAL desc
-- Year that had the most TV shows released (2020, 2019, 2018, 2021)
SELECT release_year, count(release_year) as Total
FROM dbo.netflix_titles
WHERE type = 'TV Show'
GROUP BY release_year
ORDER BY TOTAL desc

-- Countries where most movies/shows were produced (US, india, United Kingdom)
SELECT country, count(country) as Total
FROM dbo.netflix_titles
GROUP BY country
HAVING count(country) > 150
ORDER BY 2 desc

-- Duration of movies
SELECT duration, count(duration) as Count
FROM dbo.netflix_titles
WHERE duration LIKE '%_min'
GROUP BY duration
ORDER BY Count Desc

-- Director movie count (1st: Rajiv Chilaka, 2nd: Raul Campos, Jan Suter, 3rd: Suhas Kadav)
SELECT director, count(director) AS film_count
FROM dbo.netflix_titles
GROUP BY director
HAVING count(director) > 10
ORDER BY count(director) desc

-- Which cast were most common in movies/shows (David Attenborough, Vatsal Dubey, Samuel West, Jeff Dunham, Kevin Hart)
SELECT cast, count(cast) AS frequency
FROM dbo.netflix_titles
GROUP BY cast
ORDER BY frequency desc

-- Taking the top 5 directors and seeing which cast members they included into their films
SELECT director, cast, count(cast) as total
FROM dbo.netflix_titles
WHERE director = 'Rajiv Chilaka' OR director = 'Suhas Kadav' OR director LIKE 'Raú%' OR director = 'Marcus Raboy' OR director = 'Jay Karas'
GROUP BY cast, Director
HAVING count(cast) > 1
ORDER BY director

-- Taking the highest network connection and seeing what film they produced and the type of film
SELECT director, cast, title, type
FROM dbo.netflix_titles
WHERE director = 'Rajiv Chilaka' AND cast LIKE '%Swapnil'
