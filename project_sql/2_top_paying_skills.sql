/* Question : What skills are required for the top paying data analyst jobs?*/

WITH top_paying_jobs AS (
SELECT
    job_id,
    job_title,
    company_dim.name AS company_name,
    salary_year_avg
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE 
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL 
ORDER BY 
    salary_year_avg DESC
LIMIT 10
)

SELECT
      top_paying_jobs.*,
      skills_dim.skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON skills_job_dim.job_id = top_paying_jobs.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC


/* 

Most In-Demand Skills in High-Paying Roles
1. SQL appears 8 times, making it the most frequently required skill in the top-paying data analyst roles. This highlights the importance of SQL for querying and extracting data from databases.
2. Python appears 7 times, showing that programming and data analysis using Python is highly valued in high-salary analytics positions.
3. Tableau appears 6 times, indicating that strong data visualization and dashboard creation skills are important for communicating insights.
4. R appears 4 times, demonstrating that statistical programming is still used in many advanced analytics roles.
5. Excel appears 3 times, suggesting that spreadsheet analysis remains a fundamental skill even in high-paying analyst positions.
6. Pandas appears 3 times, reflecting the importance of Python libraries for data cleaning, transformation, and analysis.
7. Snowflake appears 3 times, highlighting the growing demand for analysts familiar with modern cloud data warehouses.
8. Azure appears 2 times, showing that experience with cloud platforms is increasingly valuable in analytics roles.
9. Power BI appears 2 times, emphasizing the need for business intelligence and dashboarding tools.
10. Go appears 2 times, indicating that some high-paying roles require additional programming languages for specialized data processing tasks.
*/