use dbname;
CREATE TABLE Trained( 
    location varchar(50) UNIQUE, 
    Year_2016  int,
    Year_2017  int,
    Year_2018  int,
    Year_2019  int,
    PRIMARY KEY (location)
);
select * from Trained;

INSERT INTO Trained
VALUES ('Madhya Pradesh',204,80,1428,0);
INSERT INTO Trained
VALUES ('Maharashtra',	292,78,	1189,0);
INSERT INTO Trained
VALUES ('Rajasthan',351,174,1295,20);
INSERT INTO Trained
VALUES ('Tamil Nadu',185,20,520,40);
INSERT INTO Trained
VALUES ('Punjab',224,101,620,90);
INSERT INTO Trained
VALUES ('Nagaland',	105,90,231,57);

SELECT * FROM Trained
ORDER BY location;

ALTER TABLE Trained DROP Year_2019 ;
SELECT * FROM Trained LIMIT 5;

#number of rows in the table
SELECT COUNT(*)
FROM Trained;
#ans 16

#Inserting a new column containing rowwise sum of each location with name loc_total
#Select trained-> alter table-> add a column loc_total-> select generated and write the expresssion Year_2016+Year_2017+Year_2018


# Inserting an assessment column
Alter table trained Add Assess varchar(50) NULL;
UPDATE Trained  
SET Assess = 
( CASE  
When Loc_total >= 1500 THEN 'Great'
WHEN Loc_total >= 1000 AND Loc_total < 1500 THEN 'Good'
ELSE 'Poor'
END );
Select * from Trained;


#show records of places that performed great.
SELECT *
FROM Trained 
WHERE Assess='Great';


Alter table trained Add Part varchar(10) NULL;
UPDATE Trained  
SET Part = 
( CASE  
When location in ('Delhi', 'Haryana', 'Punjab') THEN 'North'
When location in ('Tamil Nadu','Andhra Pradesh') THEN 'South'
When location in ('Nagaland', 'Meghalaya', 'Chhattisgarh','Bihar','Assam','Arunachal Pradesh') THEN 'East'
When location in ('Rajasthan', 'Maharashtra', 'Gujarat','Goa') THEN 'West' 
ELSE 'Center'
END );
Select * from Trained;
#show records grouped by different parts of the country from highest to lowest order of total farmered trained
SELECT Part, sum(Loc_total) as part_total
FROM Trained 
Group by Part 
Order by part_total DESC;