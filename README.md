# 🔍 Layoffs Data Exploration - SQL Project

This SQL project explores trends in company layoffs using a comprehensive dataset. The analysis includes core metrics, temporal trends, and industry-specific insights to understand workforce reductions across different dimensions.

## 🎯 Key Features

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

## 💻 Highlight Analysis: Annual Layoff Leaders

```sql
-- =============================================
-- TOP 5 COMPANIES BY LAYOFFS PER YEAR 
-- Uses DENSE_RANK() to handle ties fairly
-- Shows which companies were most affected each year
-- =============================================
with company_year (company, years, total_laid_off) as
(
select company,year(`date`),sum(total_laid_off)
from layoffs_staging_1
group by company,year(`date`) 
), company_year_rank as
(
select*,
dense_rank() over(partition by years order by total_laid_off desc) as ranking
from company_year
where years is not null
)
select*
from company_year_rank
where ranking <= 5;

```
## 🚀 How to Use
1. Run [SQL_Lyoffs_Exploratory_Data_Analysis](SQL_Lyoffs_Exploratory_Data_Analysis_Project.sql) in MySQL Workbench  
2. View results in `output`📄 folder:  
   - [analysis_samples](output/analysis_samples.csv)   (20-row data preview)  
   - [exploration_stats](output/exploration_stats.txt) (exploration summary)

  
## 💡 Skills Demonstrated
- Data Analysis:  Trend identification, Metric calculation, Comparative analysis
- SQL Expertise:  Window functions, CTEs, Date manipulation, Complex aggregations
- Business Acumen:  Workforce analytics, Risk assessment, Strategic planning


## 📁 Data Source

- [Download Layoffs_Dataset (Excel)](Layoffs_Dataset.xlsx)📄 
This dataset includes information about Layoffing of employees in companies over 3 years (2020-2023)


