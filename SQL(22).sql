-- =============================================
-- LAYOFFS DATA EXPLORATION PROJECT
-- Purpose: Analyze trends in company layoffs
-- =============================================

select*
from layoffs_staging_1;

-- CORE METRICS
-- Get max single layoff and max percentage cut
select max(total_laid_off), max(percentage_laid_off)
from layoffs_staging_1;

-- COMPANIES WITH 100% STAFF REDUCTION
-- Ordered by both layoff size and funding
select* 
from layoffs_staging_1
where percentage_laid_off =1
order by total_laid_off desc;

select* 
from layoffs_staging_1
where percentage_laid_off =1
order by funds_raised_millions desc;

-- AGGREGATE ANALYSIS
-- Layoffs by company (highest first)
select company,sum(total_laid_off)
from layoffs_staging_1
group by company 
order by 2 desc;

select max(`date`), min(`date`)
from layoffs_staging_1;

select industry,sum(total_laid_off)
from layoffs_staging_1
group by industry 
order by 2 desc;

select country,sum(total_laid_off)
from layoffs_staging_1
group by country 
order by 2 desc;

select year(`date`),sum(total_laid_off)
from layoffs_staging_1
group by year(`date`)
order by 1 desc;

select stage,sum(total_laid_off)
from layoffs_staging_1
group by stage
order by 2 desc;

select company,avg(percentage_laid_off)
from layoffs_staging_1
group by company 
order by 2 desc;

select substring(`date`,1,7) as `month`, sum(total_laid_off)
from layoffs_staging_1
where substring(`date`,1,7) is not null
group by `month`
order by 1 asc; 

-- TEMPORAL TRENDS
-- Monthly layoffs with rolling total
with rolling_total as
(
select substring(`date`,1,7) as `month`, sum(total_laid_off) as total_off
from layoffs_staging_1
where  substring(`date`,1,7) is not null
group by `month`
order by 1 asc 
)
select `month`,total_off,sum(total_off) over(order by `month`)as ro_total
from rolling_total;

select company,year(`date`),sum(total_laid_off)
from layoffs_staging_1
group by company,year(`date`) 
order by 3 desc;

-- TOP 5 COMPANIES PER YEAR
-- Using DENSE_RANK() to handle ties
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















