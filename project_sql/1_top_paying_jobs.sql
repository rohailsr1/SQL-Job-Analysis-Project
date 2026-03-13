/* Question : What are the top-paying 10 data analyst jobs availble remotely?*/

SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    company_dim.name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE 
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL 
ORDER BY 
    salary_year_avg DESC
LIMIT 10;

/* 
1. Big Data Technologies Offer the Highest Salaries
One clear trend among the top-paying skills is the presence of big data technologies such as PySpark, 
Databricks, Scala, and Airflow. These tools are used to process extremely large datasets across distributed 
computing systems. Their appearance at the top of the salary rankings suggests that organizations are willing 
to pay higher salaries to analysts who can work with large-scale data environments rather than only traditional 
databases. This indicates that the ability to handle big data infrastructure significantly increases earning potential.

2. Strong Demand for the Python Data Ecosystem
Another noticeable pattern is the importance of Python-based analytics tools, including Pandas, NumPy, Scikit-learn, 
and Jupyter. These tools are widely used for data manipulation, statistical analysis, and machine learning. Their presence 
among the top-paying skills suggests that companies value analysts who can perform advanced data analysis and predictive 
modeling using programming languages rather than relying solely on traditional spreadsheet tools.

3. Cloud and Modern Data Platforms Are Increasing Salaries
Several of the highest-paying skills relate to cloud computing and modern data infrastructure, such as Google Cloud 
Platform (GCP), Kubernetes, Linux, and Databricks. These technologies are commonly used to store, manage, and process 
data in cloud-based environments. Their appearance indicates that organizations prefer analysts who can work within 
modern cloud ecosystems and understand how data pipelines operate in scalable systems.

4. Data Engineering Skills Are Becoming Important for Analysts
The dataset also highlights the growing overlap between data analysis and data engineering. Skills like Airflow, PostgreSQL, 
Scala, and Elasticsearch are often associated with building and maintaining data pipelines rather than only analyzing data. 
This trend suggests that the highest-paying data analyst roles increasingly require professionals who can both analyze data 
and understand how it is collected, processed, and stored.

5. Machine Learning Skills Increase Earning Potential
Some of the top-paying skills, such as Scikit-learn, DataRobot, and Watson, are related to machine learning and artificial 
intelligence. These technologies are used to build predictive models and automate decision-making processes. Their presence 
among the highest-paying skills indicates that analysts who can move beyond descriptive analytics and contribute to predictive 
or automated analytics tend to command higher salaries.

6. Collaboration and DevOps Tools Are Valued
Tools like GitLab, Bitbucket, Jenkins, and Atlassian appear in the list, showing that collaboration and software development 
practices are becoming important for analysts. Modern data teams often work using version control systems and project management 
platforms. This suggests that organizations value analysts who can work effectively in technical team environments and collaborative 
workflows.

7. Hybrid Technical Roles Are Becoming the Norm
Overall, the top-paying skills indicate that the modern data analyst role is evolving into a hybrid position that combines analytics, 
engineering, and technical infrastructure knowledge. Analysts who possess skills in programming, cloud platforms, big data tools, and 
machine learning are more likely to qualify for higher-paying roles. This trend reflects the growing complexity of data environments and 
the increasing need for analysts who can work across multiple parts of the data ecosystem.
*/