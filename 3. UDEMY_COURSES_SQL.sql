USE LucasProjects
SELECT *
FROM Udemy_courses;

/*1. The top 1 subject with the most number of subscribers*/  
SELECT TOP(1) subject, sum(num_subscribers) as Total_subscribers 
FROM Udemy_courses
GROUP BY subject
ORDER BY Total_subscribers DESC;

/*2. The courses that have the most Revenue*/  
SELECT TOP(1) course_title, SUM(price*num_subscribers) as Revenue
FROM Udemy_courses
GROUP BY course_title
ORDER BY Revenue DESC;

/*3. Top 10 courses have high total subcribers*/
SELECT TOP(10) course_title, SUM(num_subscribers) as Total_subscribers
FROM Udemy_courses
GROUP BY course_title
ORDER BY Total_subscribers DESC;

/*4. The 10 courses with the fewest reviews and their subscribers*/
SELECT TOP(10) course_title, SUM(num_reviews) as Total_reviews, SUM(num_subscribers) as Total_subscribers
FROM Udemy_courses
GROUP BY course_title
ORDER BY Total_reviews;

/*5. The 5 highest revenue courses out of the 10 courses with the highest subscribers*/
WITH TOP10SUB AS 
			(SELECT TOP(10) course_title, SUM(num_subscribers) as Total_subscribers, SUM(price*num_subscribers) as Revenue
			 FROM Udemy_courses U
			 GROUP BY course_title
			 ORDER BY Total_subscribers DESC
			 )
SELECT TOP(5) course_title, Revenue
FROM TOP10SUB 
ORDER BY Revenue DESC;
