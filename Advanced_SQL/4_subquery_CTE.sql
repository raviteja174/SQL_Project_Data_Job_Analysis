/*
====================================================================
Query 1: Look at companies that don’t require a degree 
- Degree requirements are in the job_posting_fact table
- Use subquery to filter this in the company_dim table for company_names
- Order by the company name alphabetically
====================================================================
*/

SELECT
    company_id,
    name AS company_name 
FROM 
    company_dim
WHERE company_id IN (
    SELECT 
        company_id
    FROM 
        job_postings_fact 
    WHERE 
        job_no_degree_mention = TRUE
)
ORDER BY
    company_name ASC;


---


/*
====================================================================
Query 2: Find the companies that have the most job openings. 
- Get the total number of job postings per company id (job_posting_fact)
- Return the total number of jobs with the company name (company_dim)
====================================================================
*/

WITH company_job_count AS (
    SELECT 
        company_id,
        COUNT(*) AS total_jobs
    FROM 
        job_postings_fact 
    GROUP BY
        company_id
)

SELECT 
    c.name AS company_name,
    j.total_jobs
FROM 
    company_dim AS c
INNER JOIN company_job_count AS j ON c.company_id = j.company_id
ORDER BY
    j.total_jobs DESC;