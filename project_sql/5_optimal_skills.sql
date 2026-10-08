/*
Answer: What are the most optimal skills to learn (high in demand and high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Analyst roles. 
- Concentrate on remote postitions with specified salaries
- Why? Targets skills that offer job security and financial benefits ,
  offering strategic insights for carrer development in data analysis
*/
with skills_demand as(
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        count(skills_job_dim.job_id) as demand_count
        
    FROM job_postings_fact
    inner join skills_job_dim on job_postings_fact.job_id=skills_job_dim.job_id
    inner join skills_dim on skills_job_dim.skill_id=skills_dim.skill_id
    where 
        job_title_short='Data Analyst' and job_work_from_home=True
        and salary_year_avg is not NULL
    group by skills_dim.skill_id
    
 ), avg_salary as(
    SELECT 
        skills_job_dim.skill_id,
        ROUND(avg(salary_year_avg),0) as avg_salary
    FROM job_postings_fact
    inner join skills_job_dim on job_postings_fact.job_id=skills_job_dim.job_id
    inner join skills_dim on skills_job_dim.skill_id=skills_dim.skill_id
    where  
        job_title_short='Data Analyst' and salary_year_avg is not NULL
        and job_work_from_home=True
    group by skills_job_dim.skill_id
    

    
)
SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
from skills_demand
inner join avg_salary on skills_demand.skill_id=avg_salary.skill_id
WHERE
    demand_count>10
order by 
    avg_salary DESC,
    demand_count DESC
limit 20


