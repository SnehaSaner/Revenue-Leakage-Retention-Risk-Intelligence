# Revenue Leakage Analysis \& Customer Retention Risk Modeling

A SQL-powered Business Intelligence solution designed to identify revenue leakage, measure customer retention risk, and optimize profitability across regions, segments, and product categories.

---

## 📊 Dashboard Preview

![Dashboard Preview](DASHBOARD.png)

---

## 🗂 Project Structure

```
Revenue-Leakage-Project/
│
├── dataset/
│   └── global_superstore.csv
│
├── sql/
│   └── revenue_project.sql
│
├── powerbi/
│   └── dashboard.pbix
│
└── README.md
```

---

## 🏗 Data Architecture

Raw transactional CSV data was imported into MySQL for structured processing and KPI computation.

The SQL layer performs:
- Data cleaning & schema standardization
- Revenue leakage detection logic
- Retention rate computation
- Aggregated KPI view generation

Power BI is directly connected to the MySQL database for live analytical reporting.

**Pipeline Flow:**

```
CSV Data → MySQL (Cleaning + KPI Views) → Power BI Dashboard
```

---

## 🎯 Project Objective

To build a backend-driven analytics dashboard that enables businesses to:

- Detect revenue loss from negative-profit transactions  
- Analyze the impact of discount strategies  
- Track customer retention against defined targets  
- Monitor profitability across markets and product categories  

---

## 📌 Key KPIs

- Total Revenue  
- Total Profit  
- Average Order Value (AOV)  
- Retention Rate vs Target  
- Revenue Leakage %  
- Profit Margin  

---

## 🔍 Core Features

- Executive KPI summary cards  
- Revenue contribution by customer segment  
- Category-level revenue vs profit comparison  
- Revenue leakage analysis from high-discount transactions  
- Monthly trend analysis  
- Region & market performance tracking  
- Dynamic slicers for real-time filtering  

---

## 🛠 Technologies Used

- **MySQL** – Data import, transformation, KPI view creation  
- **SQL** – Aggregation, conditional logic, subqueries  
- **Power BI Desktop** – Interactive dashboard development  
- **DAX** – Advanced KPI calculations  

---

## 💡 Business Impact

- Identified revenue leakage driven by negative-profit orders  
- Enabled data-backed discount optimization strategy  
- Provided retention visibility for proactive customer strategy  
- Delivered executive-ready reporting for performance monitoring  

---

## ▶️ How to Run This Project

1. Import the dataset into MySQL.
2. Execute `revenue_project.sql` to create required tables and analytical logic.
3. Open `dashboard.pbix` in Power BI Desktop.
4. Connect Power BI to your local MySQL database.
5. Interact with slicers to explore insights dynamically.

---

## 📈 Future Enhancements

- Predictive churn modeling using Python
- Automated refresh via Power BI Service
- Advanced cohort retention analysis
- Margin sensitivity simulation for discount strategies

---

## 👩‍💻 Author

Sneha Saner  
Aspiring Data Analyst | SQL | Power BI | Business Intelligence
