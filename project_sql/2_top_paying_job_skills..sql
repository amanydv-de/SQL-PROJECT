/* 
Questions: What skills are required for the top-paying data analyst jobs?
- Use top 10 highest-paying Data Analyst jobs from first query.
- Add the specific skills required for these roles.
- Why? It provides a detailed look at high-paying jobs demad certain skills,
       helping job seekers understand which skills to develop that align with top salaries
*/
WITH top_paying_jobs as (
    SELECT
        job_id,
        job_title,
        name as company_name,
        salary_year_avg
        

    FROM
        job_postings_fact 
    left join company_dim on job_postings_fact.company_id=company_dim.company_id



    WHERE
        job_title_short='Data Analyst' and job_location='Anywhere'
        and salary_year_avg is not NULL
    order by salary_year_avg DESC
    limit 10
)

SELECT 
    top_paying_jobs.*,
     skills
FROM top_paying_jobs
inner join skills_job_dim on top_paying_jobs.job_id=skills_job_dim.job_id
inner  join skills_dim on skills_job_dim.skill_id=skills_dim.skill_id
order by salary_year_avg DESC