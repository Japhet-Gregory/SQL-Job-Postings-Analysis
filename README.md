# Remote-Data Analyst Job Market Insights

## Overview
This project analyzes real-world job posting data to answer a practical question: 
what skills should someone learn to break into or grow in a Data Analyst career? 

Using SQL, I explored ~788,000 job postings to uncover which skills are most in 
demand, which pay the most, and which offer the best balance of both — with a 
focus on remote-friendly roles.

## Dataset
The data comes from [Luke Barousse's Data Analyst job postings dataset](https://lukebarousse.com/), 
covering job postings scraped from Google job search results. The dataset includes:

- **job_postings_fact** – ~788,000 job postings with title, location, salary, and remote-work status
- **company_dim** – company names and details
- **skills_dim** – a lookup table of individual skills (e.g. SQL, Python, Excel)
- **skills_job_dim** – a bridge table linking job postings to the skills they require

I loaded this data locally into PostgreSQL and queried it using SQL in VS Code.

## Tools Used
- **SQL (PostgreSQL)** – core querying, joins, CTEs, aggregations
- **VS Code** with SQLTools extension – writing and running queries
- **Git & GitHub** – version control and project hosting

## The Questions

1. **What are the top 10 highest-paying Data Analyst jobs?**
   Filtered to companies with multiple postings to avoid outlier salaries skewing results.

2. **What skills are most in demand for Data Analyst roles?**
   Focused on remote positions to reflect the growing remote job market.

3. **Which skills are associated with the highest average salaries?**
   Filtered to skills appearing in 30+ postings to ensure the averages are statistically reliable.

4. **What are the optimal skills to learn — high demand AND high pay?**
   Combined demand and salary data, filtered to skills with 30+ postings, to surface the best 
   skills to prioritize learning.

---

## Findings

### 1. Top 10 Highest-Paying Remote Data Analyst Jobs

![Top 10 highest-paying jobs](images/top_10_highest_paying_jobs.png)

Top salaries cluster around specific companies rather than a specific industry — Meta, 
AT&T, Google, and TikTok appear repeatedly near the top, suggesting company choice can 
matter as much as skill choice when targeting top compensation.

### 2. Most In-Demand Skills

![Skills in demand](images/skills_in_demand.png)

SQL is the clear foundation skill — appearing in nearly 60% more postings than the next 
closest skill (Excel), and over 8x more than niche tools like Looker or Azure.

### 3. Skills Associated with the Highest Salaries

![Skills by average salary](images/skills_by_salary.png)

With the sample-size threshold raised to 30+ postings, every skill on this list is backed 
by a reliable amount of data. Snowflake leads at $112,948 (37 postings), followed closely 
by Azure, AWS, and Oracle — all in the $104K-$111K range.

### 4. Optimal Skills — High Demand AND High Salary

![Optimal skills — Python and Tableau highlighted](images/optimal_skills_dual_axis.png)

SQL and Excel sit at the top of the demand chart but near the bottom on pay (about $97K 
and $87K) — they're foundational, near-universal skills, which keeps demand high but 
doesn't command a premium. Python and Tableau break that pattern: both see nearly as much 
demand (230+ postings each) while still paying noticeably more ($99K-$101K), making them 
the standout "optimal" picks — broadly requested *and* well-compensated, unlike SQL/Excel 
(high demand, lower pay) or niche tools like Snowflake and Azure (high pay, lower demand).

## A Note on Sample Size

Every finding in this analysis is backed by **30+ postings** per skill — a commonly used 
rule of thumb in statistics for when a sample average starts to reliably reflect the true 
underlying value, rather than being skewed by a small handful of outliers. This makes the 
salary and demand figures throughout this project more defensible and trustworthy.

## Key Takeaways

- **Top salaries cluster around specific companies, not just industries.** Meta, AT&T, 
  Google, and TikTok all appear among the highest-paying remote Data Analyst postings, 
  spanning tech, telecom, and social media.
- **SQL is essential.** It appears in more Data Analyst postings than any other skill 
  (7,291 postings) — by a wide margin over the next closest skill, Excel.
- **High demand doesn't guarantee high pay.** SQL and Excel top the demand chart but rank 
  near the bottom on salary among skills with 30+ postings.
- **Python and Tableau offer both.** Strong demand (230+ postings) *and* competitive pay 
  (~$100K) make them the clearest "optimal skills" picks in this analysis.
- **Every finding here is backed by 30+ postings**, a stricter statistical bar than many 
  beginner analyses use, making these results more trustworthy.

## What I Learned

- How to write multi-table JOINs across fact and dimension tables to connect job 
  postings, companies, and skills
- Using CTEs to break complex logic into readable, reusable steps
- The importance of filtering for statistical reliability (e.g. `HAVING count(...) >= N`) 
  rather than trusting raw averages at face value, and how to choose a defensible threshold
- How small-sample distortions can silently skew results, and how to catch and correct 
  for them
- Structuring a project end-to-end: from raw data, to querying, to visualizing, 
  to communicating findings

