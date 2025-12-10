# Cyclistic Bike-Share Analysis  
End-to-end data analytics case study using SQL (PostgreSQL), R, Excel (Power Query), and Tableau.  
**Time Period Analyzed:** October 2024 – September 2025  

---

## 📌 Project Overview  
This project analyzes Cyclistic’s bike-share usage patterns to understand how **casual riders** and **annual members** differ in their riding behavior. Insights were used to create data-backed marketing recommendations aimed at increasing annual memberships.

The workflow follows the Google Data Analytics framework:  
**Ask → Prepare → Process → Analyze → Share → Act**

---

## 📁 Repository Structure  
Cyclistic-Bike-Share-Analysis/
│
├── r_analysis/
│ ├── cyclistic_analysis.R
│ ├── cyclistic_markdown.Rmd
│ └── cyclistic_markdown.html
│
├── sql_scripts/
│ ├── 01_data_prep.sql
│ ├── 02_data_validation.sql
│ ├── 03_transform_and_clean.sql
│ └── 04_analysis_and_insights.sql
│
├── tableau_dashboard/
│ ├── Cyclistic_Dashboard.mp4 # Dashboard walkthrough video
│ ├── screenshots/ # Dashboard visuals
│
├── Cyclistic Bike-Share Analysis.pptx # Full presentation (uploaded directly)
│
└── README.md

---

## 🧭 ASK  
### **Business Task**  
Identify behavioral differences between casual and member riders to help Cyclistic’s marketing team convert casual riders into annual subscribers.

### **Key Questions**
1. How do annual members and casual riders use Cyclistic bikes differently?  
2. What motivates casual riders, and how can Cyclistic encourage them to subscribe?  
3. How can digital strategies influence conversion behavior?

---

## 🗂 PREPARE  
### **Data Source**  
Cyclistic trip data from **Oct 2024 to Sept 2025**, publicly provided by Motivate International Inc. under a usage license.  
Each monthly dataset includes:  
- Trip timestamps  
- Bike type used  
- Start & end stations + coordinates  
- Rider type (member/casual)

### **Data Organization**
12 massive CSVs, each representing one month of trips.  
Important columns include:  
`ride_id`, `rideable_type`, `started_at`, `ended_at`,  
`start_station_name`, `end_station_name`,  
`start_lat`, `start_lng`, `end_lat`, `end_lng`,  
`member_casual`

---

## ⚙ PROCESS  
### **Tools Used**
- **PostgreSQL** → Data ingestion, cleaning, transformations, EDA  
- **R** → Validation, visualization, analysis document  
- **Excel (Power Query)** → Additional transformations  
  - *Note:* The original dataset is extremely large (~5.6M+ rows).  
    Excel was only used via **Power Query** to avoid row-limit issues and crashes.  
- **Tableau** → Visualization & dashboard  
- **PowerPoint** → Final storytelling & presentation

### **Data Cleaning Steps**
- Removed missing/invalid station IDs, coordinates, and blank entries  
- Excluded rides with negative duration or durations > 24 hours  
- Created fields: `ride_length`, `day_of_week`, `month`  
- Validated primary key uniqueness (ride_id)  
- Ensured timestamp consistency  
- Checked for duplicates (none found)

---

## 📊 ANALYZE  
### Behavior Insights
- Casual riders take **longer rides** but **ride less frequently**  
- Members ride **short, consistent, commute-based trips**  
- Weekend spikes indicate leisure-driven casual riders  
- Weekday AM/PM spikes indicate member commuters  

### Bike Type Usage
- Casual riders prefer **electric & classic** bikes  
- Members heavily use **docked bikes**  

### Temporal Patterns
- Casual use peaks in **summer weekends**  
- Member activity aligns with **work routines**

All SQL queries and analysis scripts are provided in the `sql_scripts` and `r_analysis` folders.

---

## 📈 SHARE  
This phase includes **Tableau dashboard**, **PowerPoint presentation**, and **supporting visuals**.

### 🔵 Tableau Dashboard  
A full screen-recorded walkthrough is available:  
`/tableau_dashboard/Cyclistic_Dashboard.mp4`

Screenshots of all charts are included inside `/tableau_dashboard/screenshots/`.

### 🟣 Presentation (PowerPoint)  
A polished storytelling deck summarizing insights, visuals, SQL/R workflow, and recommendations:  

📄 **Cyclistic Bike-Share Analysis.pptx**

Uploaded directly into the project root for easy access.

---

## 🎯 ACT  
Based on insights:

1. **Launch seasonal membership campaigns**  
   Targeted at heavy summer/weekend leisure riders.

2. **Promote commuter benefits**  
   Highlight cost savings & convenience for weekday travel.

3. **Push digital engagement**  
   App-based nudges, referral bonuses, personalized discounts.

4. **Offer weekend-focused value packs**  
   Designed for long-duration casual riders.

---

## 🧾 Excel Dataset Access  
Due to the dataset’s large size (~400MB), Excel files are stored externally via Google Drive.  

🔗 [**Excel Source File:** ](https://drive.google.com/drive/folders/1LA3VSyHLBXSgXy_MCERfP2bUJqRslfLF?usp=drive_link)

---

## 🛠 Technical Stack  
**Languages:** SQL (PostgreSQL), R  
**Tools:** Excel (Power Query), Tableau, GitHub, PowerPoint  
**Skills Demonstrated:**  
- Data wrangling & cleaning  
- Working with large datasets  
- SQL transformations & joins  
- R-driven validation  
- Dashboard design & storytelling  
- Business-focused analytics

---

## ✨ Final Summary  
This repository documents a complete, end-to-end analytics pipeline:  
- Large dataset engineering  
- Clean SQL workflows  
- Visualization in Tableau  
- Insights backed by R & Excel  
- A full presentation deck  
- Actionable recommendations fully aligned with business needs

This project demonstrates both **technical competence** and **professional communication**, making it suitable for analytics, BI, and consulting roles.

---
