-- #What are the top-paying jobs for my role?
-- #What are the skills required for the top-paying jobs in my role?
-- #What are the most in-demand skills for my role?
-- #What are the top skills based on salary for my role?
-- What are the top-paying data analyst jobs?,Identigy the top 10 highest paying DAta analysts roles that are available remotely,focus on job postings with specified salaries(remove null)
-- ???WHY,highlight the top-paying opportunitites for data analysts,offering insights into
SELECT current_database();
-- #What are the most optimal skills to learn?(HIgh demand-high paying)
SELECT 
    job_title,
    job_id,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND job_location = 'Netherlands' AND
    salary_year_avg IS NOT NULL
ORDER BY 
    salary_year_avg DESC
LIMIT(10)