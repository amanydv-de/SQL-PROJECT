CREATE TABLE jan_month_jobs as
    SELECT * 
    FROM job_postings_fact
    WHERE EXTRACT(month from job_posted_date)=1;

CREATE TABLE feb_month_jobs as
    SELECT * 
    FROM job_postings_fact
    WHERE EXTRACT(month from job_posted_date)=2;

CREATE TABLE march_month_jobs as
    SELECT * 
    FROM job_postings_fact
    WHERE EXTRACT(month from job_posted_date)=3;

select job_posted_date
from jan_month_jobs;