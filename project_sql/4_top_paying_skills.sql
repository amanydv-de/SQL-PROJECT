/*
Answer: What are the top skills based on salary?
-Look at the average salary associated  with each skill for Data Analyst positions
-Focuses on roles with specified skills imapct salary levels for Data Analysis and 
 helps identify the most financially rewarding skills to acquire or improve
*/


SELECT 
    ROUND(avg(salary_year_avg),0) as avg_salary,
    skills
FROM job_postings_fact
inner join skills_job_dim on job_postings_fact.job_id=skills_job_dim.job_id
inner join skills_dim on skills_job_dim.skill_id=skills_dim.skill_id
where 
    job_title_short='Data Analyst' and salary_year_avg is not NULL
group by skills
ORDER BY avg_salary DESC

limit 25