-- CTE---
WITH top_paying_jobs AS (
    SELECT
    job_title,
    job_id,
    salary_year_avg,
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
)
SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY 
    salary_year_avg DESC

-- -The skills naturally separate into three profiles. The ING Data Analyst position contains the largest skill set: SQL, R, SAS, Excel, and Cognos. This suggests a traditional analytics/BI stack covering querying, statistical analysis, spreadsheets, and reporting.

-- The Web / Data Analyst position at DEPT® is quite different, requiring JavaScript, HTML, and CSS. That indicates a more web/digital-analytics-oriented role rather than conventional data analysis.

-- The Data Architect – Sustainability position lists only SAP, suggesting an enterprise systems/data architecture orientation.

-- One caution: with only 3 unique jobs, this dataset is far too small to conclude that, for example, SAS or SQL is generally the most demanded skill in the job market. It is better interpreted as a description of these three vacancies rather than a broader labor-market trend.