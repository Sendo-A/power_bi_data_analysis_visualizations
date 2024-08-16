# Los Angeles Crime Analysis Using SQL and Power BI

<img src="https://github.com/Sendo-A/la_crime_data_analysis/blob/main/Los_Angeles_Images/Data_Viz_Powerbi.PNG" alt="Power Bi" width="800">

<img src="https://github.com/Sendo-A/la_crime_data_analysis/blob/main/Los_Angeles_Images/Sql_Query_EDA_2.PNG" alt="Power Bi" width="800">

## Introduction

This project provides an analysis of crime data in Los Angeles using SQL for data extraction and Power BI for visualization. The analysis focuses on various metrics to understand the patterns and trends in criminal activities, victim demographics, and case statuses.

## Metrics Employed

1. **Average Age of Victims**:
   - **Description**: Calculate the average age of victims.
   - **Column Used**: `Vict Age`
   - **Purpose**: Understand the age distribution of crime victims.

2. **Frequency of Crimes by Gender**:
   - **Description**: Count the number of crimes reported for each gender.
   - **Column Used**: `Vict Sex`
   - **Purpose**: Analyze crime distribution across different genders.

3. **Time Difference Between Reporting and Occurrence**:
   - **Description**: Analyze the time difference between the date reported and the date occurred.
   - **Columns Used**: `Date Rptd`, `DATE OCC`
   - **Purpose**: Measure the response time and delay in crime reporting.

4. **Frequency of Crimes by Area**:
   - **Description**: Count the number of crimes reported in each area.
   - **Column Used**: `AREA NAME`
   - **Purpose**: Identify high-crime areas for targeted interventions.

5. **Most Common Crime Types**:
   - **Description**: Identify the most frequent types of crimes reported.
   - **Column Used**: `Crm Cd Desc`
   - **Purpose**: Understand the prevalent types of crimes in Los Angeles.

6. **Frequency of Crimes by Premises**:
   - **Description**: Count the number of crimes reported for each type of premise.
   - **Column Used**: `Premis Desc`
   - **Purpose**: Determine the common premises where crimes occur.

7. **Usage of Weapons**:
   - **Description**: Analyze the frequency and types of weapons used in crimes.
   - **Columns Used**: `Weapon Used Cd`, `Weapon Desc`
   - **Purpose**: Assess the prevalence of weapon usage in criminal activities.

8. **Status of Cases**:
   - **Description**: Determine the status of reported cases.
   - **Column Used**: `Status Desc`
   - **Purpose**: Track the resolution and progress of criminal cases.

9. **Location Patterns**:
   - **Description**: Identify patterns in crime occurrence based on location.
   - **Columns Used**: `LOCATION`, `Cross Street`
   - **Purpose**: Detect geographic patterns and hotspots for crimes.

## Data Extraction Using SQL

Data was extracted using SQL queries to select and aggregate the required information from the crime database. Key SQL queries included:

- **Average Age of Victims**:
  ```sql
  SELECT AVG("Vict Age") AS Average_Age FROM uc_los_angeles_crime;

- **Frequency of Crimes by Gender**:
  ```sql
  SELECT "Vict Sex", COUNT(*) AS Frequency FROM uc_los_angeles_crime GROUP BY "Vict Sex";

to complete Later

