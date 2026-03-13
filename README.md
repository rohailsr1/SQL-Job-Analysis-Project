# Data Job Market Analysis: SQL Project 📊

## 📌 Introduction
What are the most in-demand and highest-paying skills for Data Analysts? This project dives into a dataset of thousands of job postings from **2023** to uncover the real trends driving the data industry. By querying a database of real-world job postings, I identified the technical competencies that offer the best return on investment for aspiring data professionals.

---

## 🛠️ Tools I Used
- **SQL:** The primary tool for data extraction and analysis.
- **PostgreSQL:** My chosen RDBMS for managing the large dataset.
- **pgAdmin 4:** The interface used for database management and query execution.
- **VS Code:** My environment for writing SQL scripts and managing this repository.

## 🔍 The Analysis
I developed targeted SQL queries to answer five critical industry questions:

1. **Top-Paying Data Analyst Jobs:** Who is paying the most for data talent?
2. **Skills for Top-Paying Jobs:** What do the $100k+ roles require?
3. **Most In-Demand Skills:** Which tools appear most frequently in job descriptions?
4. **Top Skills based on Salary:** Which specific libraries and tools command a premium?
5. **Optimal Skills to Learn:** Where do high demand and high salary intersect?

---

## 📈 Key Findings & Figures
My analysis yielded specific, data-backed insights into the market:

### 1. The Skill Demand Hierarchy
The most mentioned skills across all job postings show a clear reliance on a core "Big Three":
- **SQL:** 7,291 mentions (The undisputed king of data retrieval).
- **Excel:** 4,611 mentions (Still fundamental for business analysis).
- **Python:** 4,330 mentions (Essential for automation and advanced analysis).

### 2. High-Salary Specializations
The highest average salaries are not found in general tools, but in **Big Data** and **Cloud** technologies:
- **PySpark:** $208,172 average salary (Top-paying skill).
- **Bitbucket/GitLab:** $154k–$189k (Reflecting the high value of version control).
- **Pandas/NumPy:** $143k–$151k (Highlighting the premium on Python's data manipulation libraries).

### 3. The "Optimal" Skills (High Demand + High Pay)
To identify the best skills to learn right now, I looked for the intersection of frequency and compensation:
- **Go / Hadoop:** Average salaries over $113k.
- **Snowflake / Azure:** High-demand cloud platforms with salaries averaging $111k–$112k.
- **AWS:** A major market player with an average salary of $108k.

---

## 💡 What I Learned
Through this project, I mastered several advanced SQL techniques:
* **Complex Joins:** Connecting job postings to specialized skill tables to see the "hidden" requirements of high-paying roles.
* **CTEs & Subqueries:** Breaking down multi-step analysis (like finding average salaries for only the most frequent skills) into readable, modular code.
* **Data Standardizing:** Using `CASE` statements and `\copy` commands to handle messy, real-world CSV data.
* **Strategic Thinking:** Learning to use data to guide my own learning roadmap—prioritizing Cloud and Big Data tools for future growth.

## 🏁 Conclusions
The data is clear: **SQL remains the foundation**, but high-end compensation is driven by **Cloud proficiency (AWS/Snowflake)** and **Big Data processing (PySpark)**. For an analyst to maximize their value, they should focus on a "T-shaped" skill set: deep expertise in SQL/Python, supported by a broad understanding of cloud environments and version control (Git).

---

### 📬 Contact
- **Name:** Muhammad Rohail
- **Email:** rohailsr1@gmail.com