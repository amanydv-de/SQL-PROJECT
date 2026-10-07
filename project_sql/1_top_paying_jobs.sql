/*
Question: What are the top-paying data analyst jobs?
- Identify the top 10 highest-paying Data Analyst roles that are available remotely.
- Focuses on job postings with specified salaries (remove nulls).
*/

SELECT
    job_id,
    job_title,
    job_location,
    company.name as company_name,
    job_schedule_type,
    salary_year_avg,
    job_posted_date

FROM
    job_postings_fact as jobs
left join company_dim as company on jobs.company_id=company.company_id
WHERE
    job_title_short='Data Analyst' and job_location='Anywhere'
    and salary_year_avg is not NULL
order by salary_year_avg DESC
limit 10;