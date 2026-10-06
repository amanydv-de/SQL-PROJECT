SELECT 
    job_title_short,
    job_location,
    case 
        when job_location='Anywhere' then 'remote'
        when job_location='New York, NY' then 'local'
        else 'onsite'
    end as location_category
from job_postings_fact
