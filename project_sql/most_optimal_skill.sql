/*
- Top-paying jobs for Data Analyst
- Skills for these top-paying jobs
- most in-demand skills for Data Analyst
- top skills based on salary
- most optimal skill to learn (high dd and high paying)
*/

WITH skills_demand AS (
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(job_postings_fact.job_id) AS demand_count
    FROM
        job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE job_work_from_home = TRUE AND job_title_short = 'Data Analyst' AND salary_year_avg IS NOT NULL
    GROUP BY skills_dim.skill_id
), top_avg_salary AS (
    SELECT
        skills_dim.skill_id,
        ROUND(AVG(salary_year_avg),0) AS avg_salary
    FROM 
        job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE 
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = TRUE
    GROUP BY skills_dim.skill_id
)

SELECT 
    skills_demand.skill_id,
    skills_demand.skills,
    skills_demand.demand_count,
    top_avg_salary.avg_salary
FROM skills_demand
INNER JOIN top_avg_salary ON skills_demand.skill_id = top_avg_salary.skill_id
ORDER BY skills_demand.demand_count DESC
LIMIT 40;
