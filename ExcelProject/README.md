# HR Employee Attrition Analysis & Retention Dashboard

## Executive Summary

### This project identifies and quantifies the primary factors contributing to employee turnover using the HR attrition dataset. By transforming raw data into targeted metrics, we established a benchmark Overall Attrition Rate of 16.12%. The analysis reveals that attrition risk is critically high among specific segments, notably entry-level sales roles, employees in the lowest salary tiers, and new hires in their first year of service.
The final output is an interactive Excel dashboard designed to enable HR leadership to perform drill-down analysis and prioritize retention efforts.

## I. Data Preparation and Feature Engineering

### The initial phase involved extensive cleaning and engineering on the raw data (HR-Employee-Attrition.csv) to create the analyzable Cleaned_Data sheet.

## 1. Data Cleaning and Standardization

### Irrelevant Column Removal: Columns with constant values (e.g., EmployeeCount, StandardHours, Over18) and unique identifiers (EmployeeNumber) were removed as they provide no analytical value.

Duplicate Check: A validation confirmed zero duplicate records, ensuring data integrity.

## 2. Feature Engineering: Creating Categorical Fields

### We used Excel formulas to convert numerical ratings and continuous income data into intuitive, text-based categories for clear Pivot Table use.

A. Salary Bucket Segmentation
The MonthlyIncome column was segmented into four professional tiers using a nested IF formula to analyze compensation-based risk.

New Column as Salary_Bucket, Segmentation Logic (Example Formula)                                                                    

      =IF(Q2<=5000,"Low",IF(Q2<=10000,"Medium",IF(Q2<=150000,"High","Very High")))

##B. Descriptive Label Creation

Affected Columns: obSatisfaction, EnvironmentSatisfaction, RelationshipSatisfaction
Conversion Type:  1-4 Rating $\rightarrow$ Descriptive Level
Example Conversion: 1, 2, 3, 4 converted to Low, Medium, High, Very High

Affected Columns: WorkLifeBalance  Conversion Type: 1-4 Rating $\rightarrow$ Descriptive Level
Example Conversion: 1, 2, 3, 4 converted to Bad, Good, Better, Best

## II. Analysis Methodology: Pivot Tables and Visuals

### All core metrics were generated using Pivot Tables on the Cleaned_Data sheet. The critical step in creating the Attrition_by_Department.csv, Attrition_by_Salary_Bucket.csv, etc., was the use of the % of Row Total calculation.

## Calculation Method: Attrition Rate 

### Pivot Table Setup: 
Place the grouping field (e.g., Department or Salary_Bucket) in the ROWS area.Count & Rate: Drag a count field (e.g., EmployeeNumber) twice to the VALUES area.The Formula: Right-click the second entry in the VALUES area and select Show Values As % of Row Total. This calculates the percentage of employees who left (Attrition=Yes) relative to the total number of employees in that specific row category.

## III. Key Findings and Insights

### The analysis of employee attrition reveals key trends across job roles, salary levels, and departments:

Sales Representatives experience the highest attrition rate at 39.76%, indicating significant turnover in frontline sales positions.

Employees with low salaries (≤ $5,000) have an attrition rate of 28.61%, highlighting that compensation is a critical factor in retention.

Laboratory Technicians show a moderate attrition rate of 23.94%, suggesting some retention challenges in technical roles.

The Sales Department overall has an attrition rate of 20.63%, reflecting higher turnover compared to other departments.

Insight: Attrition is driven by a massive risk concentration in the entry-level Sales Representative role, where turnover is nearly 40%. This is strongly correlated with compensation, as the Low Salary Bucket exhibits an attrition rate almost 8 times higher than the Very High bracket.

### 2. Attrition by Tenure (The Early Warning Signal)

0 Years (New Hires): 36.36%

1 Year: 34.50%

2 Years: 21.26%

10+ Years: ≤ 15.00%

Insight: Attrition is highest in the first two years, indicating a critical period where new employees are most likely to leave. Retention strategies should focus on onboarding, engagement, and early-career support.

### 3. Work-Life Balance and Well-being

Bad (1): 31.25% attrition

Good (2): 16.86% attrition

Better (3): 14.22% attrition

Insight: Employees reporting poor work-life balance are far more likely to leave. Improving well-being and work-life support can significantly reduce turnover.

## IV. Recommendations

Based on the quantitative analysis, the following actions are recommended to address the highest-impact drivers of attrition:

Immediate Compensation Intervention: Prioritize a targeted salary review for the Sales Representative role and all employees in the Low Salary Bucket. Increasing base pay in these high-risk areas is the most direct way to reduce the immediate threat of attrition.

First-Year Retention Program: Establish a mandatory mentor and structured 90-day check-in program for all new hires. This program must focus on non-performance factors like work-life balance, job satisfaction, and manager-employee alignment to stabilize employees during the critical first year.

Workload & Burnout Audit: Conduct a focused audit of departments and roles (e.g., Sales and Laboratory Technician) with high WLB complaints. This should aim to redistribute workload and enforce limits on required overtime to mitigate burnout risk.
