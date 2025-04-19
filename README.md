# 📊 Layoffs Data Exploration - SQL Project

## 🌟 Overview
This SQL project explores trends in company layoffs using a comprehensive dataset. The analysis includes core metrics, temporal trends, and industry-specific insights to understand workforce reductions across different dimensions.

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
# Example of advanced query from my project
with rolling_total as
(
select substring(`date`,1,7) as `month`,
       sum(total_laid_off) as total_off
from layoffs_staging_1
where substring(`date`,1,7) is not null
group by `month`
order by 1 asc 
)
select `month`, total_off, sum(total_off) over(order by `month`)as rol_total
from rolling_total;
```
## 🚀 How to Use
1. Run [SQL_Lyoffs_Exploratory_Data_Analysis](SQL_Lyoffs_Exploratory_Data_Analysis.sql) in MySQL Workbench  
2. View results in `output`📄 folder:  
   - [analysis_samples](output/analysis_samples.csv)   (10-row data preview)  
   - [exploration_stats](output/exploration_stats.txt) (exploration summary)
  







## 📁 Data Source

- [Download Layoffs_Dataset (Excel)](Layoffs_Dataset.xlsx)📄 
This dataset includes information about Layoffing of employees in companies over 3 years (2020-2023)

