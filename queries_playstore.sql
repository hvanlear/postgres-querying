-- Comments in SQL Start with dash-dash --
--Find the app with an ID of 1880.
SELECT *
FROM analytics
WHERE id = 1880;

--Find the ID and app name for all apps that were last updated on August 01, 2018.
SELECT *
FROM analytics
WHERE last_updated = '2018-08-01';

--Count the number of apps in each category, e.g. “Family | 1972”.
SELECT category, COUNT(*)
FROM analytics
GROUP BY category;

--Find the top 5 most-reviewed apps and the number of reviews for each.
SELECT *
FROM analytics
ORDER BY reviews DESC LIMIT 5;

--Find the app that has the most reviews with a rating greater than equal to 4.8.
SELECT * FROM analytics
WHERE rating >= 4.8 ORDER BY reviews DESC LIMIT 1

--Find the name, price, and rating of the most expensive app with a rating that’s less than 3.
select app_name, price, rating
from analytics
where rating < 3
order by price desc limit 1;

--Find all apps with a min install not exceeding 50, that have a rating. Order your results by highest rated first.
select *  from analytics
where min_installs <= 50 and rating != 0 order by rating desc;

--Count all the reviews in the Google Play Store.
select SUM(reviews)
from analytics;

--Find all the categories that have more than 300 apps in them.
select category, count(*)
from analytics
group by category
having count(*) > 300

--Find the top 10 most-reviewed apps that cost between 10 cents and a dollar.
SELECT reviews, app_name, price
FROM analytics
WHERE price BETWEEN .10 AND 1.01
ORDER BY reviews desc;

--Find the most out of date app. Hint: You don’t need to do it this way, but it’s possible to do with a subquery
SELECT last_updated, app_name
FROM analytics
ORDER BY last_updated LIMIT 1;
-- Find the most expensive app (the query is very similar to #11).
SELECT * FROM analytics
ORDER BY price desc LIMIT 1;

-- Find all the apps that have more than 1 genre.
select app_name, genres
from analytics
group by genres, app_name
having cardinality(genres) > 1;