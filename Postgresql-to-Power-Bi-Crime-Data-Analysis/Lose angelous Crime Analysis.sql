--The Overall Dataset
select * from uc_los_angeles_crime limit 20;

-- Selecting the Columns we need store it in a cte

with crimes as  (select "DR_NO" as file_number,"Vict Age" as Vict_Age,"Vict Sex" as Vict_Gender, "Vict Descent",
		"Crm Cd" as Crime_Committed, "Crm Cd Desc" as Crime_Description,"Premis Desc" as "crime_place", 
		"Date Rptd" as Date_Reported, "DATE OCC" as Date_Occured, 
		"AREA NAME", "Crm Cd Desc",
		"Premis Desc", "Weapon Used Cd","Weapon Desc", "Status Desc", "LOCATION", 
		"Cross Street" from uc_los_angeles_crime order by Vict_Age desc)
	
select Vict_Gender, Vict_Age from uc_los_angeles_crime group by  Vict_Gender,Vict_Age order by Vict_Age ;
/**
	Extracting Metrics
**/
-- Average Age of Victims	
select round(avg("Vict Age"),2) as average_age from uc_los_angeles_crime;

-- Frequency of Crimes by Gender

select "Vict Sex" as vict_gender,
		count("Crm Cd Desc") as crime_committed, "Vict Sex" as vict_gender from uc_los_angeles_crime group by vict_gender ;
		
SELECT 
    "Vict Sex" as vict_gender,
    --"Weapon Desc", 
    COUNT("Vict Sex") AS Count_of_Vict_Sex,
    round(COUNT("Vict Sex") * 100.0 / SUM(COUNT("Vict Sex")) OVER(),2) AS Percentage_of_Vict_Sex
FROM 
    uc_los_angeles_crime 
GROUP BY 
    "Vict Sex"
    --"Weapon Desc"
ORDER BY 
    Percentage_of_Vict_Sex DESC;

-- Time Difference Between Reporting and Occurrence

SELECT 
    "Date Rptd" AS Date_Reported, 
    "DATE OCC" AS Date_Occurred, 
    ("Date Rptd" - "DATE OCC") AS time_difference,
    CASE 
        WHEN ("Date Rptd" - "DATE OCC") > 11 THEN 'too_late'
        WHEN ("Date Rptd" - "DATE OCC") = 1 THEN 'quick'
        WHEN ("Date Rptd" - "DATE OCC") <= 11 THEN 'normal'
    END AS report_status
FROM 
    uc_los_angeles_crime
ORDER BY 
    time_difference DESC;

-- Frequency of Crimes by Area

select "AREA" as Police_sations, 
		"AREA NAME", 
		count("Crm Cd") as crime_committed,
		round(COUNT("Crm Cd") * 100.0 / SUM(COUNT("Crm Cd")) OVER(),2) AS Percentage_of_crime_committed
		from uc_los_angeles_crime 
		group by "AREA", "AREA NAME"
		order by Percentage_of_crime_committed desc
		
		
-- Most Common Crime Types

select "Crm Cd Desc", 
		count("Crm Cd Desc") as Most_Common_Crime_Types,
		round(COUNT("Crm Cd Desc") * 100.0 / SUM(COUNT("Crm Cd Desc")) OVER(),2) AS Percentage_of_Crime_Type
		from uc_los_angeles_crime 
			group by "Crm Cd Desc" Order by Percentage_of_Crime_Type desc;
	
-- Frequency of Crimes by Premises

select "Premis Desc", 
		count("Premis Desc") as Frequency_of_Crimes_by_Premises
		from uc_los_angeles_crime 
			group by "Premis Desc" Order by Frequency_of_Crimes_by_Premises desc;
			
-- Usage of Weapons		
SELECT 
    "Weapon Used Cd",
    "Weapon Desc", 
    COUNT("Weapon Used Cd") AS Count_of_Usage_of_Weapons,
    round(COUNT("Weapon Used Cd") * 100.0 / SUM(COUNT("Weapon Used Cd")) OVER(),2) AS Percentage_of_Usage_of_Weapons
FROM 
    uc_los_angeles_crime 
GROUP BY 
    "Weapon Used Cd", 
    "Weapon Desc"
ORDER BY 
    Percentage_of_Usage_of_Weapons DESC;

-- Status of Cases		
SELECT 
    "Status Desc",
    COUNT("Status Desc") AS Count_of_Status,
    round(COUNT("Status Desc") * 100.0 / SUM(COUNT("Status Desc")) OVER(),2) AS Percentage_of_status
FROM 
    uc_los_angeles_crime 
GROUP BY 
    "Status Desc"
ORDER BY 
    Percentage_of_status DESC;

-- Usage of LOCATION		
SELECT 
    "LOCATION",
    "AREA NAME", 
    COUNT("LOCATION") AS Count_of_location,
    round(COUNT("LOCATION") * 100.0 / SUM(COUNT("LOCATION")) OVER(),2) AS Percentage_of_LOCATION
FROM 
    uc_los_angeles_crime 
GROUP BY 
    "LOCATION", 
    "AREA NAME"
ORDER BY 
    Percentage_of_LOCATION DESC;

