select skills_dim.skills, 
    round(avg(salary_year_avg),0) as avg_salary,
    count(skills_job_dim.job_id) as demand_count  -- add this
from job_postings_fact
inner join skills_job_dim 
    on job_postings_fact.job_id = skills_job_dim.job_id
inner join skills_dim 
    on skills_job_dim.skill_id = skills_dim.skill_id
where job_postings_fact.job_title_short = 'Data Analyst'
    and job_postings_fact.job_work_from_home = true 
    and salary_year_avg is not null
group by skills_dim.skills
having count(skills_job_dim.job_id) >= 5   -- add this
order by avg_salary desc
limit 25;