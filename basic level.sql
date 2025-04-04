
-- Basic Level
-- 1. Retrieve all records for individuals diagnosed with lung cancer.
select * from lung_cancer_data a where a.Lung_Cancer_Diagnosis ='yes'
 
 --2 Count the number of smokers and non-smokers
 select smoker, count(*) as total_count from lung_cancer_data  
 group by Smoker 

 -- 2 List all unique cancer stages present in the dataset.
 select Distinct Cancer_stage from lung_cancer_data
 
 ----3 Retrieve the average number of cigarettes smoked per day by smokers

 select AVG(cigarettes_per_day) as averagenumber from lung_cancer_data where smoker ='Yes'

 ------ 5. Count the number of people exposed to high air pollution.
 
select count(*) as highairpollution from lung_cancer_data  where Air_Pollution_Exposure ='high'

-----------6. Find the top 5 countries with the highest lung cancer deaths.
 WITH RankedCountries
 AS (SELECT Country, Annual_Lung_Cancer_Deaths,
        ROW_NUMBER() OVER (PARTITION BY Country ORDER BY Annual_Lung_Cancer_Deaths DESC) AS rn
    FROM lung_cancer_data  
)
SELECT TOP 5 Country, Annual_Lung_Cancer_Deaths
FROM RankedCountries WHERE rn = 1
ORDER BY Annual_Lung_Cancer_Deaths DESC;

or
select distinct(Country), Annual_Lung_Cancer_Deaths from lung_cancer_data order by  Annual_Lung_Cancer_Deaths Desc
OFFSET 0 ROWS 
FETCH NEXT 5 ROWS ONLY;
  
 
-- 7. Count the number of people diagnosed with lung cancer by gender.

select gender,count(*) as  diagnosedwithlungcancer  from lung_cancer_data where Lung_Cancer_Diagnosis='Yes' group by Gender

-- 8. Retrieve records of individuals older than 60 who are diagnosed with lung cancer.
select * from lung_cancer_data where age>60 AND Lung_Cancer_Diagnosis='Yes'




   