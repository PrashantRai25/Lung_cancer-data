
-- Advanced Level
-- 1. Identify the correlation between lung cancer prevalence and air pollution levels.
select Air_Pollution_Exposure,round(avg(Lung_Cancer_Prevalence_Rate),2) AS average_prevelence_rate from lung_cancer_data 
group by Air_Pollution_Exposure order by  Air_Pollution_Exposure;

-- 2. Find the average age of lung cancer patients for each country.
select Country,round(avg(Age),2) AS average_age from lung_cancer_data where Lung_Cancer_Diagnosis='Yes'group by Country order by  average_age desc;

-- 3. Calculate the risk factor of lung cancer by smoker status, passive smoking, and family history.
SELECT Smoker,Passive_Smoker, Family_History, ROUND((COUNT(CASE WHEN Lung_Cancer_Diagnosis = 'Yes' THEN 1 END) * 100.0) / COUNT(*), 2) AS Risk_Percentage 
FROM lung_cancer_data GROUP BY Smoker, Passive_Smoker, Family_History ORDER BY Risk_Percentage DESC;

-- 4. Rank countries based on their mortality rate.
select Country,round(avg(Mortality_Rate),2) ,rank() over(order by avg(Mortality_Rate) desc) AS Average_mortality_rate from lung_cancer_data group by Country;

-- 5. Determine if treatment type has a significant impact on survival years.
select  Treatment_Type ,round(avg(Survival_years),2) AS Avg_of_Survival_years from lung_cancer_data group by Treatment_Type order by Avg_of_Survival_years desc;

-- 6. Compare lung cancer prevalence in men vs. women across countries.
select Gender,Country,round(avg(Lung_Cancer_Prevalence_Rate),2) AS average_prevalence_rate from lung_cancer_data group by Country,Gender 
order by Country,average_prevalence_rate desc;

-- 7. Find how occupational exposure, smoking, and air pollution collectively impact lung cancer rates.
SELECT Occupational_Exposure,Smoker, Air_Pollution_Exposure, ROUND((COUNT(CASE WHEN Lung_Cancer_Diagnosis = 'Yes' THEN 1 END) * 100.0) / COUNT(*), 2) 
AS Lung_Cancer_Risk_Percentage FROM lung_cancer_data GROUP BY Occupational_Exposure,Smoker, Air_Pollution_Exposure ORDER BY Lung_Cancer_Risk_Percentage DESC;

-- 8. Analyze the impact of early detection on survival years.
select  Early_Detection ,round(avg(Survival_years),2) AS Avg_of_Survival_years from lung_cancer_data group by Early_Detection order by Avg_of_Survival_years desc;