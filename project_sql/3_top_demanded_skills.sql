/*
Question: What are the most in-demand skills for data analysts?
-Join job postings to innner join table similar to query 2
-Identify the top 5 in-demand skills for a data analyst.
-Focus on all job postings.
-why? Retrieves the top 5 skills with the highest demand in the job market,
      providing insights into the most valuabele skills for job seekers.
*/

SELECT 
    count(skills_job_dim.job_id) as demand_count,
    skills
FROM job_postings_fact
inner join skills_job_dim on job_postings_fact.job_id=skills_job_dim.job_id
inner join skills_dim on skills_job_dim.skill_id=skills_dim.skill_id
where 
    job_title_short='Data Analyst' and job_work_from_home=True
group by skills
ORDER BY demand_count DESC

limit 5



