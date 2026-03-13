# 📊 SQL Data Job Analysis Project

[![GitHub](https://img.shields.io/badge/GitHub-Project-blue)](https://github.com/rohailsr1/SQL-Job-Analysis-Project)
[![SQL](https://img.shields.io/badge/SQL-Queries-green)](#)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-DB-blueviolet)](#)
[![VS Code](https://img.shields.io/badge/VSCode-IDE-yellowgreen)](#)

---

## Introduction

This project explores the **data analyst job market using SQL** by analyzing job postings that contain information about salaries, job titles, companies, and required skills.

Objectives:

- 💰 Identify the **highest-paying data analyst jobs**  
- 🔥 Find **most in-demand skills** in the job market  
- 📈 Determine skills associated with **higher salaries**  
- 🎯 Recommend **optimal skills to learn** for aspiring data analysts  

SQL was used to extract insights from the dataset and answer key questions about **salary, demand, and technical skills**.

---

## Project Architecture

The project follows a **dimensional modeling approach** with two types of tables:

### Fact Table:

- `job_postings_fact` — Contains job posting information including job ID, title, location, salary, and company ID.

### Dimension Tables:

- `company_dim` — Stores company information  
- `skills_dim` — Stores all possible skills  
- `skills_job_dim` — Links jobs to skills  

**Query flow example:**

1. Start from `job_postings_fact`  
2. Join with `skills_job_dim` → `skills_dim` for skill info  
3. Join with `company_dim` for company details  
4. Aggregate, filter, and rank results using SQL queries

---

## Tools Used

- **SQL** – Querying and analysis  
- **PostgreSQL** – Database management  
- **Visual Studio Code** – Query writing & testing  
- **Git & GitHub** – Version control and sharing  

**SQL Concepts Applied:**

- `JOIN`, `LEFT JOIN`  
- `GROUP BY` & `COUNT/AVG`  
- `CTE / WITH clause`  
- Filtering & Sorting  
- Aggregate Functions  

---

## Analysis & Findings

### 1. Top-Paying Data Analyst Jobs

```sql
SELECT	
    job_id, job_title, job_location, salary_year_avg, name AS company_name
FROM job_postings_fact
LEFT JOIN company_dim 
    ON job_postings_fact.company_id = company_dim.company_id
WHERE job_title_short = 'Data Analyst'
AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10;
```

**Findings:**

- Top-paying salaries: **$180,000 – $600,000+ per year**  
- High-paying positions often include **Senior Data Analyst, Director of Analytics, Lead Data Analyst**  
- Commonly offered by **tech companies and financial firms**

---

### 2. Skills Required for Top-Paying Jobs

```sql
WITH top_paying_jobs AS (
SELECT job_id, job_title, salary_year_avg, name AS company_name
FROM job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE job_title_short = 'Data Analyst'
AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10
)
SELECT top_paying_jobs.*, skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id;
```

**Top Skills in High-Paying Roles:**

| Skill | Importance |
|-------|------------|
| SQL | Core querying skill |
| Python | Automation & advanced analysis |
| Tableau | Data visualization |
| Power BI | Business intelligence reporting |
| Excel | Modeling & analysis |

---

### 3. Most In-Demand Skills

```sql
SELECT skills, COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst'
GROUP BY skills
ORDER BY demand_count DESC
LIMIT 5;
```

**Top 5 Most In-Demand Skills:**

1. SQL  
2. Excel  
3. Python  
4. Tableau  
5. Power BI  

---

### 4. Skills Associated with Higher Salaries

```sql
SELECT skills, ROUND(AVG(salary_year_avg),0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE salary_year_avg IS NOT NULL
GROUP BY skills
ORDER BY avg_salary DESC
LIMIT 10;
```

**Key Findings:**

- Skills with highest salaries include **Cloud platforms, Big Data tools, advanced programming**  
- Average salaries for these skills: **$150,000+**  

---

### 5. Most Optimal Skills to Learn

```sql
SELECT skills_dim.skills, COUNT(skills_job_dim.job_id) AS demand_count,
ROUND(AVG(job_postings_fact.salary_year_avg),0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE salary_year_avg IS NOT NULL
GROUP BY skills_dim.skills
ORDER BY avg_salary DESC, demand_count DESC;
```

**Optimal Skills:**

- SQL  
- Python  
- Data Visualization (Tableau / Power BI)  
- Cloud technologies  

**Insight:** Combining **high-demand + high-paying skills** maximizes career potential.

---

## What I Learned

- Writing **advanced SQL queries** for business insights  
- Combining **fact and dimension tables** for analysis  
- Using **aggregate functions** to rank skills and roles  
- Extracting **actionable insights** from real-world datasets  
- Understanding **job market trends for data analysts**

---

## Conclusions / Summary of Findings

1. **SQL remains the most essential skill**, appearing in almost all job postings.  
2. **High-paying roles** range from **$180k – $600k+**, typically at tech & finance companies.  
3. **Python and programming skills** increase career opportunities and salaries.  
4. **Visualization tools** (Tableau, Power BI) are critical for communication of insights.  
5. **Cloud, Big Data, and advanced analytics skills** are associated with the highest salaries.  
6. Combining **SQL + Python + Visualization** offers the most competitive advantage.  
7. Organizations continue to **prioritize data-driven decision making**, increasing analyst demand.

---

## Author

**Muhammad Rohail**  
BS Entrepreneurship Student | Aspiring Data Analyst  

Passionate about leveraging **data analytics, SQL, and BI tools** to solve business problems and uncover actionable insights.
