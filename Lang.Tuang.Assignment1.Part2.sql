#Assignment1. Part2 | AUG 29,2021
# Average distance American Ariline travelled in January by Destination 


SELECT dest, avg(distance)
FROM flights
WHERE month=1 AND carrier= 'AA' 
GROUP BY dest
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/assginment1.Part2.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';
