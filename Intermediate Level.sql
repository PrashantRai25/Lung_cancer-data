----------------
-- Intermediate Level
-- 1. Find the percentage of smokers who developed lung cancer.
select
(count(case when smoker = 'yes' and lung_cancer_diagnosis = 'yes' then 1 end) * 100.0 /
(count(case when smoker = 'yes'  then 1 end))) as smoker_lung_cancer_percentage
from lung_cancer_data;

-- 2. Calculate the average survival years based on cancer stages.
select cancer_stage, avg(Survival_Years) as avg_survival_year 
from lung_cancer_data
where lung_cancer_diagnosis = 'yes'
group by cancer_stage
order by avg_survival_year desc

-- 3. Count the number of lung cancer patients based on passive smoking.
select count(*) as lung_cancer_patients , passive_smoker
from lung_cancer_data
where lung_cancer_diagnosis = 'yes'
group by passive_smoker;


-- 4. Find the country with the highest lung cancer prevalence rate.
select top 1 country , max(Lung_Cancer_Prevalence_Rate) as highest_lung_cancer_prevalence_rate
from lung_cancer_data
group by country
order by highest_lung_cancer_prevalence_rate desc


-- 5. Identify the smoking years' impact on lung cancer.
select  Years_of_Smoking, count(*) as impact_lung_cancer
from lung_cancer_data
where lung_cancer_diagnosis = 'yes'
group by years_of_smoking
order by Years_of_Smoking desc;

-- 6. Determine the mortality rate for patients with and without early detection.
select early_detection ,
(count(case when lung_cancer_diagnosis = 'yes' and survival_years = 1 then 1 end) * 100.0 /
(count(case when lung_cancer_diagnosis = 'yes' then 1 end))) as mortality_rate
from lung_cancer_data
group by early_detection;

-- 7. Group the lung cancer prevalence rate by developed vs. developing countries.
select developed_or_developing , avg(Lung_Cancer_Prevalence_Rate) as avg_prevalence_rate
from lung_cancer_data
group by developed_or_developing;
