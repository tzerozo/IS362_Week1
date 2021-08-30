#LANG TUANG || IS362 || Week1.Assignment1.1 || AUG 29,2021


#1. How many airplanes have listed speeds? 
# planes table
SELECT COUNT(*) FROM PLANES
WHERE speed IS NOT NUll;

#2. What is the minimum listed speed and maximum listed speeds?
# planes table, 
SELECT max(speed) FROM PLANES;
SELECT min(speed) FROM PLANES;

#3. What is the total distance flown by all of the planes in January 2013?
# flights table
SELECT sum(distance) FROM flights
WHERE year=2013 AND month=1;

#4. What is the total distance flown by all of the planes in January 2013 where tailnum is missing?
SELECT sum(distance) FROM flights
WHERE year=2013 AND month=1 AND tailnum IS NULL;

#5. What is the total distance flown for all planes on July 5,2013 gropued by aircraft manufacturer? (inner join)
# flights table, planes table
SELECT sum(distance), manufacturer FROM flights
INNER JOIN planes on flights.tailnum = planes.tailnum
WHERE month=7 AND day=5 AND flights.year=2013 
GROUP BY manufacturer;

#6. Same as #5 (left outer join)
SELECT sum(distance), manufacturer FROM planes
LEFT OUTER JOIN flights on flights.tailnum = planes.tailnum
WHERE month=7 AND day=5 AND flights.year=2013 
GROUP BY manufacturer;

#7. How do your result compare from #5 and #6?
# ANS: the result are identical even when checking "Query Stats". 
# ANS: Execution time for INNER JOIN is 187 where LEFT OUTER JOIN is 172. (Self Note: not even sure that's what we need to look for).

#8. Write at least one question of your own by that joins at least 3 tables.
# fligths table, planes table, airline table
#Q: List frequency of planes flown by Airline names where plane seats are more than 150.

SELECT airlines.name AS 'Airline', COUNT(*) AS 'Frequent'
FROM flights INNER JOIN planes 
ON planes.tailnum = flights.tailnum
INNER JOIN airlines
ON airlines.carrier = flights.carrier
WHERE planes.seats > 150
GROUP BY airlines.carrier
ORDER BY COUNT(*)


