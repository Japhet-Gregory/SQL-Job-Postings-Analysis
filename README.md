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
   Filtered to skills appearing in 5+ postings to ensure the averages are statistically meaningful.

4. **What are the optimal skills to learn — high demand AND high pay?**
   Combined demand and salary data, filtered to skills with 10+ postings, to surface the best 
   skills to prioritize learning.

## Key Findings

- **Top salaries cluster around specific companies, not just industries.** The highest-paying 
  remote Data Analyst postings ranged from roughly $280K to $650K, with tech and AI-focused 
  companies (e.g. Meta, Anthropic, OpenAI) appearing prominently — suggesting company choice 
  can matter as much as skill choice when targeting top compensation.

- **SQL is essential.** It appears in more Data Analyst postings than any other skill 
  (7,291 postings) — by a wide margin over the next closest skill, Excel.

- **Some niche skills pay a premium.** Skills like Databricks, Go, and Snowflake command 
  the highest average salaries, but appear in relatively few postings — likely reflecting 
  specialized or senior roles rather than typical entry points.

- **Python and Tableau offer the best balance.** Both appear in 200+ postings while still 
  commanding strong average salaries (~$100K), making them high-value, lower-risk skills 
  to prioritize compared to rarer, higher-paying niche tools.

- **Data quality matters as much as the analysis.** During this project, I caught and 
  filtered out several distortions — a single high-salary outlier from a low-posting-volume 
  country, and skills whose "average salary" was based on just one or two job postings. 
  Without these filters, the results would have been misleading.

## What I Learned

- How to write multi-table JOINs across fact and dimension tables to connect job 
  postings, companies, and skills
- Using CTEs to break complex logic into readable, reusable steps
- The importance of filtering for statistical reliability (e.g. `HAVING count(...) >= N`) 
  rather than trusting raw averages at face value
- How small-sample distortions can silently skew results, and how to catch them 
  before drawing conclusions
- Structuring a project end-to-end: from raw data, to querying, to communicating findings

