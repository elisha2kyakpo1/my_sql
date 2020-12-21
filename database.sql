-- 1
SELECT population FROM world
  WHERE name = 'Germany';

-- 2
SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

-- 3
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000;

-- QUIZ 1
-- 1
SELECT name FROM world
  WHERE name LIKE 'Y%';

-- 2
SELECT name FROM world
  WHERE name LIKE '%y';

-- 3
SELECT name FROM world
  WHERE name LIKE '%x%';

-- 4  
SELECT name FROM world
  WHERE name LIKE '%land';

-- 5
SELECT name FROM world
  WHERE name LIKE 'C%ia';

-- 6
SELECT name FROM world
  WHERE name LIKE '%oo%';

-- 7
SELECT name FROM world
  WHERE name LIKE '%a%a%a%';

-- 8
SELECT name FROM world
 WHERE name LIKE '_t%';
ORDER BY name

-- 9
SELECT name FROM world
 WHERE name LIKE '%o__o%';

-- 10
SELECT name FROM world
 WHERE name LIKE '____';

-- 11
SELECT name
  FROM world
 WHERE name LIKE capital

-- 12
SELECT name
  FROM world
 WHERE capital LIKE concat(name, ' City')

-- 13
SELECT capital,name 
 FROM world
  WHERE capital LIKE concat('%',name,'%')

-- 14
SELECT capital,name
 FROM world
 WHERE capital LIKE concat(name,'_%')

-- 15
SELECT name,REPLACE(capital,name,'')
 FROM world
 WHERE capital LIKE concat(name,'_%');

-- QUIZ 2
-- 1
SELECT name, continent, population FROM world

-- 2
SELECT name FROM world
WHERE population > 200000000

-- 3
SELECT name, (gdp/population) AS perCapitaGDP
FROM world WHERE population > 200000000

-- 4
SELECT name, population/1000000 
FROM world 
WHERE continent = 'South America'

-- 5
SELECT name, population
FROM world 
WHERE name IN ('France','Germany','Italy')

-- 6
SELECT name 
FROM world
WHERE name LIKE '%UNITED%'

-- 7
SELECT name,population,area
FROM world
WHERE population > 250000000 OR area > 3000000

-- 8
SELECT name,population,area
FROM world
WHERE population > 250000000 XOR area > 3000000

-- 9
SELECT name, ROUND(population/1000000,2),ROUND(gdp/1000000000,2)
FROM world
WHERE continent = 'South America'

-- 10
SELECT name,ROUND(gdp/population,-3)
FROM world
WHERE gdp > 1000000000000

-- 12
SELECT name,capital
FROM world
WHERE LENGTH(name) = LENGTH(capital)

-- 13
SELECT name, capital
FROM world 
WHERE LEFT(name,1) = LEFT(capital,1) AND name <> capital

-- 14
SELECT name
   FROM world
WHERE name LIKE('%a%')
  AND name LIKE('%e%')
  AND name LIKE('%i%')
  AND name LIKE('%o%')
  AND name LIKE('%u%')
  AND name NOT LIKE ('% %')

-- QUIZ 3
-- 1
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950

-- 2
SELECT winner
  FROM nobel
  WHERE yr = 1962
   AND subject = 'Literature'

-- 3
SELECT yr,subject
 FROM nobel
 WHERE winner = 'Albert Einstein'

-- 4
SELECT winner
 FROM nobel
  WHERE subject = 'Peace'
  AND yr >= 2000 

--5
SELECT *
 FROM nobel
 WHERE subject = 'Literature'
 AND yr >= 1980 AND yr <= 1989

-- 6
SELECT * 
 FROM nobel
 WHERE winner IN ('Theodore Roosevelt','Woodrow Wilson','Jimmy Carter','Barack Obama')

-- 7
SELECT winner
 FROM nobel
 WHERE winner LIKE('John %')

-- 8
SELECT *
 FROM nobel
 WHERE (subject = 'Physics' AND yr = 1980)
  OR (subject = 'Chemistry' AND yr = 1984)

-- 9
SELECT * 
 FROM nobel
 WHERE yr = 1980
 AND subject NOT IN ('Chemistry','Medicine')

-- 10
SELECT * 
 FROM nobel
 WHERE (yr <  1910 AND subject = 'Medicine')
  OR (yr >=  2004 AND subject = 'Literature')

-- 11
SELECT yr,subject,winner
 FROM nobel
 WHERE winner = 'PETER GRÜNBERG'

-- 12
SELECT yr,subject,winner
 FROM nobel
 WHERE winner = 'EUGENE O''NEILL'

-- 13 
SELECT winner,yr,subject
 FROM nobel
 WHERE winner LIKE('Sir %')

-- 14
SELECT winner, subject
  FROM nobel
 WHERE yr=1984
 ORDER BY subject IN ('Physics','Chemistry'),subject,winner

-- QUIZ 4
-- 1
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

-- 2
SELECT name FROM world
WHERE continent = 'Europe'
AND gdp/population > (SELECT gdp/population FROM world WHERE name='United Kingdom')

-- 3 
SELECT name,continent FROM world
WHERE continent IN(SELECT continent FROM world WHERE name 
IN('Argentina','Australia')) ORDER BY name

-- 4
SELECT name, population FROM world
WHERE population > (SELECT population FROM world WHERE
name = 'Canada') AND population < (SELECT population FROM world WHERE
name = 'Poland') 

-- 5
SELECT name,
CONCAT(ROUND((population/(SELECT population FROM world WHERE name = 'Germany')*100),0),'%') 
AS percentage FROM world WHERE continent = 'Europe'

-- 6
SELECT name FROM world
WHERE gdp > ALL(SELECT gdp FROM world WHERE continent = 'Europe' AND gdp > 0)

-- 7
SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND area>0)

-- 8
SELECT continent,name FROM world x
WHERE name = (SELECT name FROM world y WHERE y.continent = x.continent ORDER BY name LIMIT 1 )

-- QUIZ 5
-- 1
SELECT SUM(population)
FROM world

-- 2
SELECT DISTINCT continent FROM world

-- 3
SELECT SUM(gdp) FROM world WHERE continent = 'Africa'

-- 4
SELECT COUNT(*) FROM world WHERE area >= 1000000

-- 5
SELECT SUM(population) FROM world WHERE name IN('Estonia','Latvia','Lithuania')

-- 6
SELECT continent,COUNT(name) FROM world x
WHERE name IN (SELECT name FROM world y WHERE x.continent = y.continent) GROUP BY continent

-- 7
SELECT continent,COUNT(name) FROM world x
WHERE name IN (SELECT name FROM world y WHERE x.continent = y.continent AND y.population >= 10000000) GROUP BY continent

-- 8
SELECT continent FROM world x
WHERE (SELECT SUM(population) FROM world y WHERE y.continent = x.continent) >= 100000000 GROUP BY continent

-- QUIZ 6
-- 1
SELECT matchid,player FROM goal 
  WHERE teamid = 'GER'

-- 2
SELECT id,stadium,team1,team2
  FROM game WHERE id = 1012

-- 3
  SELECT player,teamid,stadium,mdate  FROM goal AS G JOIN game AS GA
ON G.matchid = GA.id WHERE G.teamid = 'GER'

-- 4
SELECT team1,team2,player FROM game JOIN goal ON game.id = goal.matchid WHERE player LIKE('Mario%')

-- 5
SELECT player, teamid,coach, gtime
  FROM goal JOIN eteam ON teamid=id
 WHERE gtime<=10

-- 6
 SELECT mdate,teamname FROM game JOIN eteam ON eteam.id=game.team1
WHERE coach = 'Fernando Santos'

-- 7
SELECT player FROM goal JOIN game ON id=matchid 
WHERE stadium = 'National Stadium, Warsaw'

-- 8
SELECT DISTINCT player
  FROM goal JOIN game ON matchid = id 
    WHERE (teamid != 'GER' AND (team1 ='GER' OR team2='GER'))

-- 9
SELECT teamname,COUNT(teamid)
  FROM eteam JOIN goal ON id=teamid
 GROUP BY teamname
 ORDER BY teamname

-- 10
SELECT stadium,COUNT(matchid) FROM game 
JOIN goal ON matchid=id GROUP BY stadium

-- 11
SELECT matchid,mdate,COUNT(matchid)
  FROM game JOIN goal ON matchid = id 
 WHERE (team1 = 'POL' OR team2 = 'POL')
  GROUP BY matchid,mdate

-- 12
SELECT matchid,mdate,COUNT(teamid) FROM goal
JOIN game ON (matchid=id)
WHERE teamid='GER' 
GROUP BY matchid,mdate 

-- 13
SELECT DISTINCT mdate,
team1,SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) AS score1,
team2,SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) AS score2
FROM game
LEFT JOIN goal ON((id=matchid)) 
GROUP BY id,mdate,team1,team2 
ORDER BY mdate,matchid,team1,team2

-- QUIZ 7
--1
SELECT id, title
 FROM movie
 WHERE yr=1962

-- 2
 SELECT yr FROM movie
WHERE title = 'Citizen Kane'

-- 3
SELECT id,title,yr FROM movie
WHERE title LIKE('%Star Trek%')
ORDER BY yr

-- 4
SELECT id FROM actor
WHERE name='Glenn Close'

--5 
SELECT id from movie 
WHERE title =  'Casablanca'

-- 6
SELECT name FROM actor
JOIN casting ON actorid=id
WHERE movieid = 11768

-- 7
SELECT name FROM actor
JOIN casting ON actorid=id
WHERE movieid = (SELECT id FROM movie WHERE title ='Alien')

-- 8
SELECT title FROM movie 
JOIN casting ON movieid=id
WHERE actorid=(SELECT id FROM actor WHERE name='Harrison Ford')

-- 9
SELECT title FROM movie 
JOIN casting ON movieid=id
WHERE actorid=(SELECT id FROM actor WHERE name='Harrison Ford') AND ord !=1

-- 10
SELECT title,name FROM casting
  JOIN movie ON (movie.id = movieid)
  JOIN actor ON (actor.id = actorid)
  WHERE yr = 1962  AND ord = 1

-- 11
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2

-- 12
SELECT title, name FROM casting
  JOIN movie ON movie.id = movieid
  JOIN actor ON actor.id = actorid
WHERE ord = 1
	AND movie.id IN
	(SELECT movie.id FROM movie
	   JOIN casting ON movie.id = movieid
	   JOIN actor ON actor.id = actorid
           WHERE actor.name = 'Julie Andrews')

-- 13
SELECT DISTINCT name FROM casting
  JOIN movie ON movie.id = movieid
  JOIN actor ON actor.id = actorid
  WHERE actorid IN (
	SELECT actorid FROM casting
	  WHERE ord = 1
	  GROUP BY actorid
	  HAVING COUNT(actorid) >= 15)
ORDER BY name

-- 14
SELECT DISTINCT title,COUNT(actorid) FROM movie
JOIN casting ON (movieid = movie.id)
WHERE yr = 1978
GROUP BY movieid,title
ORDER BY COUNT(actorid) DESC,title

-- 15
SELECT name FROM actor 
JOIN casting ON (actorid=actor.id)
WHERE movieid IN (
SELECT  movieid FROM casting
WHERE actorid = (SELECT id FROM actor WHERE name='Art Garfunkel'))
AND name != 'Art Garfunkel'


-- QUIZ 8
-- 1
SELECT name FROM teacher WHERE dept IS NULL

-- 2
SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id)

-- 3
SELECT teacher.name,dept.name FROM teacher
LEFT JOIN dept ON(dept.id=teacher.dept)  

-- 4
SELECT teacher.name,dept.name FROM teacher
RIGHT JOIN dept ON(dept.id=teacher.dept)  

-- 5
SELECT name,COALESCE(mobile,'07986 444 2266') 
FROM teacher

-- 6
SELECT teacher.name,COALESCE(dept.name,'None') FROM teacher
LEFT JOIN dept ON(dept.id=teacher.dept)  

-- 7
SELECT COUNT(name),COUNT(mobile) FROM teacher

-- 8
SELECT dept.name,COUNT(teacher.name) FROM teacher
RIGHT JOIN dept ON (dept.id=teacher.dept)
GROUP BY dept.name

-- 9
SELECT name,CASE WHEN dept=1 OR dept=2 THEN 'Sci'
            ELSE 'Art'
            END
FROM teacher

-- 10
SELECT name,CASE WHEN dept=1 OR dept=2 THEN 'Sci'
                 WHEN dept=3 THEN 'Art'
                 ELSE 'None'
            END
FROM teacher

-- QUIZ 9
-- 1
SELECT COUNT(*) FROM stops

-- 2
SELECT id FROM stops WHERE name = 'Craiglockhart'

-- 3
SELECT id,name FROM stops
JOIN route ON (stop=id)
WHERE num=4 AND company='LRT'
ORDER BY id,name

-- 4
SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*) = 2

-- 5
SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 AND b.stop=149

-- 6
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name='London Road'

-- 7
SELECT DISTINCT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Haymarket' AND stopb.name='Leith'

-- 8
SELECT DISTINCT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name='Tollcross'

-- 9
SELECT DISTINCT name, a.company, a.num
FROM route a
JOIN route b ON (a.company = b.company AND a.num = b.num)
JOIN stops ON a.stop = stops.id
WHERE b.stop = 53;

-- 10
SELECT a.num, a.company, stopb.name, c.num, c.company
FROM route a
JOIN route b ON (a.company = b.company AND a.num = b.num)
JOIN (route c JOIN route d ON (c.company = d.company AND c.num = d.num))
JOIN stops stopa ON a.stop = stopa.id
JOIN stops stopb ON b.stop = stopb.id
JOIN stops stopc ON c.stop = stopc.id
JOIN stops stopd ON d.stop = stopd.id
WHERE stopa.name = 'Craiglockhart'
	AND stopd.name = 'Sighthill'
	AND stopb.name = stopc.name
ORDER BY LENGTH(a.num), b.num, stopb.name, LENGTH(c.num), d.num;