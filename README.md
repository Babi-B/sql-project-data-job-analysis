# Introduction
This project explores top-paying jobs, in-demand skills, and where high demand meets high salary in data anlytics.

# Background
This project pinpoint the top-paid and in-demand skills, streamling others work to find optimal jobs.

### The questions answered in the SQL queries are:

1. What are the top-paying data analyst jobs.
2. What skills are required for these top-paying jobs?
3. What skills are most in demand for data analysts
4. Which skills are associated with higher salaries
5. What are the most optimal skills to learn?

# Tools Used
- SQL: Used to query the database and unearth critical insights.
- PostgreSQL: The chosen DBMS
- VS Code: The code Editor used for executing SQL queries and managing the database
- Git & GitHub: The version control used for sharing the SQL scripts and analysis.

# The Analysis
Each query for this project aimed at investigating specific aspects of the data analyst job market. 

### 1. Top Payng Data Analyst Jobs
To identify the highest-paying roles, the data analyst positions were filtered by the avaerage yearly salary and location, focusing on remote jobs.
```sql
SELECT 
    job_postings_fact.job_id,
    job_postings_fact.job_title,
    company_dim.name AS company_name,
    job_postings_fact.job_location,
    job_postings_fact.job_schedule_type,
    job_postings_fact.salary_year_avg,
    job_postings_fact.job_posted_date
FROM job_postings_fact
LEFT JOIN company_dim ON company_dim.company_id=job_postings_fact.company_id
WHERE 
    job_title_short = 'Data Analyst' AND 
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10;
```
Here is the interpretation:
- **Wide Salary Range:** Top 10 paying data analyst roles span from $184,000 to $650,000 indicaitng significant salary potentintal in the file
- **Diverse Employers:** Companies like SmartAsset, Meta and AT&T are among those offering high salaries, showing a broad interest across different industries
- **Job Title Variety:** There's a high diversity in job titles, from Data Analyst to Director of Analytics, reflecting varied roles and specializations within data analytics.

# Lesson learned
- **Complex Query Crafting:** Mastered the art of advanced SQL, merging tables and using `WITH` clauses for table maneuvering
- **Data Aggregation:** Used `GROUP BY` and turned aggregate functions like `COUNT()` and `AVG()`.
- **Analytical Thinking:** Practiced real-world puzzle-solving skills, turning questions into actionable, insightful SQL queries

# Conclusion
### Insights
The highest-paying jobs for data analysts that allow remote work offer a wide range of salaries, the highest at $650,000