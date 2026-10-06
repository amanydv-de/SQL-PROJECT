SELECT
    job_title_short as title,
    job_location as location,
    job_posted_date::date as date,
    EXTRACT(month from job_posted_date) as date_month
FROM
    job_postings_fact