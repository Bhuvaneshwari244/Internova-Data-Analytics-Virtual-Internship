# Internova-Data-Analytics-Virtual-Internship


# 🛒 E-Commerce Data Analysis | Internova Data Analytics Internship

## 📌 Project Overview

This project focuses on analyzing e-commerce sales transaction data to understand business performance, identify trends, evaluate product and category performance, investigate customer activity, and uncover data quality issues.

This end-to-end data analytics project includes data cleaning and preprocessing, Exploratory Data Analysis (EDA) using Python, SQL-based analysis using MySQL, and interactive dashboard development using Power BI.

The goal is to transform raw transactional data into meaningful business insights and actionable recommendations that support data-driven decision-making.

---

## 🎯 Project Objectives

- Understand the structure and characteristics of the dataset.
- Clean and preprocess raw transactional data.
- Identify missing values, duplicates, inconsistencies, and invalid records.
- Perform Exploratory Data Analysis (EDA).
- Analyze sales trends across products and categories.
- Investigate customer transactions, payment methods, and order statuses.
- Perform business analysis using SQL.
- Develop an interactive Power BI dashboard.
- Generate actionable insights and business recommendations.

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|---|---|
| Python | Data analysis and preprocessing |
| Pandas | Data manipulation and cleaning |
| NumPy | Numerical operations |
| Matplotlib | Data visualization |
| Seaborn | Statistical visualization |
| Jupyter Notebook | Interactive analysis |
| MySQL | Database management and SQL analysis |
| MySQL Workbench | SQL queries and analysis |
| Microsoft Power BI | Interactive dashboard development |

---

## 🔄 Project Workflow

1. Data Understanding
2. Data Cleaning & Preprocessing
3. Exploratory Data Analysis (EDA)
4. SQL Analysis using MySQL
5. Power BI Dashboard Development
6. Business Insights
7. Recommendations

---

## 📂 Project Structure

```text
Internova_Ecommerce_Analysis/
│
├── dataset/
│   ├── original_dataset
│   └── cleaned_dataset
│
├── excel/
│   └── excel_analysis_files
│
├── python/
│   └── python_notebooks_and_analysis
│
├── sql/
│   └── sql_queries
│
├── powerbi/
│   └── powerbi_dashboard
│
├── reports/
│   └── final_project_report
│
├── screenshots/
│   └── project_screenshots
│
└── README.md
```

---

## 📊 Dataset Description

The dataset contains e-commerce transaction records with information about customers, orders, products, categories, prices, quantities, payment methods, and order statuses.

### Dataset Summary

| Metric | Value |
|---|---:|
| Original Records | 103 |
| Records After Duplicate Removal | 102 |
| Original Columns | 11 |
| Unique Customers | 100 |
| Unique Order IDs | 100 |
| Data Period | January 2023 – November 2025 |

### Dataset Columns

| Column | Description |
|---|---|
| ID | Record identifier |
| Customer_Name | Customer identification |
| Order_ID | Order identifier |
| Order_Date | Order date |
| Product | Product name |
| Category | Product category |
| Quantity | Units purchased |
| Price | Unit price |
| Payment_Method | Payment method |
| Status | Order status |
| Total | Recorded sales value |

---

## 🧹 Data Cleaning & Preprocessing

The following data cleaning operations were performed:

- Removed one exact duplicate record.
- Standardized text values and product names.
- Normalized inconsistent category labels.
- Converted date values into a consistent format.
- Identified invalid or missing dates.
- Converted quantity and price fields into numeric formats.
- Treated invalid, zero, and negative quantities/prices as missing for analysis.
- Removed currency symbols and corrected convertible text-based price entries.
- Filled missing categories only where the product-category relationship was unambiguous.
- Preserved recorded sales totals.
- Calculated Gross Amount using Quantity × Price.
- Created validation fields to compare calculated and recorded totals.
- Investigated suspicious values without making unsupported corrections.

---

## 🔍 Data Quality Assessment

The following data quality issues were identified after preprocessing:

| Data Quality Issue | Count |
|---|---:|
| Total Records | 102 |
| Missing Order Dates | 1 |
| Missing Categories | 2 |
| Missing Quantities | 8 |
| Missing Prices | 8 |
| Missing Sales Totals | 14 |
| Repeated IDs | 2 |
| Repeated Order IDs | 2 |
| Negative Sales Records | 3 |

### Negative Sales Transactions

| ID | Product | Recorded Sales |
|---|---|---:|
| 117 | Blender | -₹20,000.00 |
| 134 | T-Shirt | -₹2,957.65 |
| 137 | Vacuum | -₹300.00 |

Negative transactions were retained for investigation because their exact business meaning could not be confirmed from the available dataset.

---

## 📈 Exploratory Data Analysis (EDA)

EDA was performed to understand the sales performance and identify patterns across different dimensions.

### Overall Performance

| Metric | Value |
|---|---:|
| Total Recorded Sales | ₹108,321.63 |
| Total Transactions | 102 |
| Unique Customers | 100 |
| Unique Order IDs | 100 |
| Total Valid Quantity | 288 Units |
| Valid Sales Records | 88 |
| Missing Sales Records | 14 |
| Average Recorded Value per Valid Sales Record | ₹1,230.93 |

### 📅 Monthly Sales Analysis

| Performance | Month | Recorded Sales |
|---|---|---:|
| Highest Sales | June 2025 | ₹16,376.43 |
| Lowest Sales | February 2025 | -₹830.71 |

June 2025 recorded the highest monthly sales, while February 2025 recorded negative sales due to negative transactions and anomalies.

### 🏆 Top Products by Recorded Sales

| Rank | Product | Sales |
|---|---|---:|
| 1 | Shoes | ₹16,987.08 |
| 2 | Comics | ₹14,454.34 |
| 3 | Lamp | ₹14,306.44 |
| 4 | Biography | ₹9,577.39 |
| 5 | Science | ₹8,005.71 |

Shoes generated the highest recorded sales among the analyzed products.

### 📦 Category Performance

| Category | Units Sold | Recorded Sales |
|---|---:|---:|
| Books | 79 | ₹39,320.91 |
| Clothing | 57 | ₹25,761.19 |
| Home | 59 | ₹24,429.71 |
| Sports | 44 | ₹17,297.70 |
| Electronics | 47 | ₹518.10 |

Books recorded the highest category sales value and unit volume.

Electronics sales were significantly affected by the negative Blender transaction.

### 👥 Customer Analysis

- Total unique customers: **100**
- Highest customer-level recorded sales: **Customer_142**
- Recorded customer sales value: **₹5,484.71**

Repeated order identifiers were identified, so customer-level results were interpreted cautiously.

### 🚚 Order Status Analysis

| Status | Transactions | Recorded Sales |
|---|---:|---:|
| Returned | 27 | ₹37,999.12 |
| Shipped | 23 | ₹29,562.19 |
| Cancelled | 15 | ₹23,005.49 |
| Delivered | 11 | ₹12,706.70 |
| Processing | 26 | ₹5,048.14 |

Returned orders recorded the highest transaction count and sales value among the status groups.

### 💳 Payment Method Analysis

| Payment Method | Transactions | Recorded Sales |
|---|---:|---:|
| Bank Transfer | 22 | ₹41,612.83 |
| Credit Card | 23 | ₹24,076.33 |
| PayPal | 24 | ₹21,390.82 |
| Cash on Delivery | 33 | ₹21,241.64 |

- Bank Transfer generated the highest recorded sales value.
- Cash on Delivery recorded the highest transaction volume, with 33 transactions and 96 units sold.

---

## 🗄️ SQL Analysis — MySQL

SQL analysis was performed using MySQL Workbench in the `internova_ecommerce` database.

### Analysis Performed

- Overall sales analysis
- Monthly sales analysis
- Product performance analysis
- Category performance analysis
- Customer performance analysis
- Order status analysis
- Payment method analysis
- Data quality analysis

SQL results were compared with Python analysis to validate the consistency of key analytical findings.

---

## 📊 Power BI Dashboard

An interactive, single-page dashboard was developed using Microsoft Power BI.

### Dashboard Features

- Total Recorded Sales KPI
- Transaction Count
- Unique Customers
- Units Sold
- Negative Sales Records
- Monthly Sales Trend
- Product Performance
- Category Performance
- Payment Method Analysis
- Order Status Analysis
- Customer Performance

### Interactive Filters

- Date
- Category
- Order Status
- Payment Method

The dashboard uses a professional blue-themed design to present business performance and analytical results in a clear and interactive format.

---

## 💡 Key Business Insights

- **Books** recorded the highest category sales value of ₹39,320.91.
- **Shoes** recorded the highest product sales value of ₹16,987.08.
- **June 2025** was the highest-performing month by recorded sales.
- **Bank Transfer** generated the highest recorded sales value.
- **Cash on Delivery** had the highest transaction volume.
- Returned orders had the highest transaction count among order status groups.
- Negative sales transactions significantly affected certain product and category results.
- Missing values and repeated identifiers highlight the importance of data quality validation.

---

## 💼 Business Recommendations

- Implement automated data validation to reduce missing and invalid data.
- Investigate negative transactions to classify returns, refunds, adjustments, or data-entry errors.
- Monitor product and category performance regularly.
- Review cancellation and return patterns to identify operational issues.
- Maintain reliable customer and order identifiers.
- Analyze payment preferences to improve the customer payment experience.
- Use dashboards for regular business performance monitoring.
- Include profit and cost data in future analysis to evaluate profitability.

---

## ⚠️ Limitations

- The dataset is relatively small, containing 102 records after duplicate removal.
- Missing values remain in several fields.
- Negative sales transactions could not be fully explained.
- Repeated identifiers could not be conclusively classified.
- Recorded sales values are not independently verified as realized revenue.
- Cost, expense, and profit information was unavailable.
- Customer retention and lifetime value analysis were limited by the available information.

---

## 📝 Conclusion

This project demonstrates an end-to-end data analytics workflow using Python, MySQL, and Power BI.

The analysis transformed raw e-commerce transaction data into meaningful insights through data cleaning, exploratory analysis, SQL querying, and dashboard visualization.

The project identified sales trends, product and category performance, customer activity, payment preferences, and order status patterns while highlighting important data quality issues.

It provided practical experience in data preprocessing, analytical thinking, SQL, data visualization, dashboard development, and business interpretation.

---

## 👩‍💻 Project Information

**Project Name:** E-Commerce Data Analysis  
**Program:** Internova Data Analytics Virtual Internship  
**Domain:** Data Analytics  
**Tools:** Python, Pandas, NumPy, Matplotlib, Seaborn, MySQL, Power BI  
**Project Type:** End-to-End Data Analytics

---

⭐ If you find this project interesting, feel free to explore the repository!
