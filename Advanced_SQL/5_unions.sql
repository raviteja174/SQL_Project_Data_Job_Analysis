/*
Get jobs and companies from January, February, and March
- Combines rows from all three monthly tables into a single result set
- UNION ALL is used to include all records (including duplicates) for better performance
*/

SELECT 
    job_title_short,
    company_id,
    job_location
FROM
    january_jobs

UNION ALL

SELECT 
    job_title_short,
    company_id,
    job_location
FROM
    february_jobs

UNION ALL

SELECT 
    job_title_short,
    company_id,
    job_location
FROM
    march_jobs;