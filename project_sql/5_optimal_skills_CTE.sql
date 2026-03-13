WITH skills_demand AS (
    SELECT
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT (job_postings_fact.job_id) AS skill_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE job_title_short = 'Data Analyst' AND
            job_location = 'Anywhere' AND
            salary_year_avg IS NOT NULL
    GROUP BY
        skills_dim.skill_id
), skills_average_salary AS (
        SELECT
        skills_dim.skill_id,
        ROUND (AVG (salary_year_avg), 2) AS average_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
    INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
    WHERE 
        job_title_short = 'Data Analyst' AND
        job_location = 'Anywhere' AND
        salary_year_avg IS NOT NULL
    GROUP BY
       skills_dim.skill_id
)

SELECT 
    skills_demand.skill_id,
    skills_demand.skills,
    skills_demand.skill_count,
    average_salary
FROM skills_demand
INNER JOIN skills_average_salary ON skills_average_salary.skill_id = skills_demand.skill_id
WHERE skill_count >= 10
ORDER BY 
    skill_count DESC, average_salary DESC
LIMIT 25