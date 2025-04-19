# 📊 Layoffs Data Exploration - SQL Project

## 🌟 Overview
This SQL project explores trends in company layoffs using a comprehensive dataset. The analysis provides insights into workforce reductions across companies, industries, and geographies.

## 🔍 Key Features

### 📈 Core Analysis
- Identifies maximum single layoff and percentage cuts
- Examines companies with 100% staff reductions
- Analyzes layoffs by company, industry, country, and stage

### 🕰️ Temporal Trends
- Tracks monthly and yearly layoff patterns
- Calculates rolling totals for cumulative impact
- Identifies seasonal trends and year-over-year changes

### 🏆 Top Performers Analysis
- Ranks top 5 companies by layoff volume each year
- Uses DENSE_RANK() to handle ties fairly
- Compares performance across different years

## 💻 Technical Highlights

```sql
-- Example of advanced query from project
WITH rolling_total AS (
  SELECT SUBSTRING(`date`,1,7) AS `month`, 
         SUM(total_laid_off) AS total_off
  FROM layoffs_staging_1
  GROUP BY `month`
)
SELECT `month`,
       total_off,
       SUM(total_off) OVER(ORDER BY `month`) AS running_total
FROM rolling_total;
