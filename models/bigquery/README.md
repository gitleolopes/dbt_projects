### 📊 BigQuery Cost Observability

#### 📌 Project Overview
This project demonstrates a data pipeline focused on Data Cost Observability using Google Cloud Platform (GCP) and analytics engineering best practices.

The main goal is to demonstrate how raw usage data can be transformed, documented, tested, and visualized to support BigQuery cost monitoring.

#### 📊 Live Dashboard (Tableau Public)
Explore the Cost Observability Dashboard:

🔗 https://public.tableau.com/app/profile/leonardo.lopes.da.costa/viz/BigQueryCosts/General

This dashboard provides visibility into BigQuery processing costs, key cost drivers, and user-level cost distribution.

#### 🏗️ Architecture Overview
Data Flow:
1. Mock data generation using Python
2. Raw data ingestion into BigQuery
3. Data Transformation and Modeling using dbt
4. Data Quality Tests and Documentation with dbt
5. Refined data ingestion into BigQuery
6. Cost Dashboard built in Tableau

#### 🧰 Tech Stack
- Data Warehouse: BigQuery
- Transformation Tool: dbt
- Data Visualization: Tableau
- Version Control: GitHub

#### 🧪 Data Modeling & Quality
The transformation layer was built using dbt:
- Staging model to standardize raw data
- Mart models to optimize data for analytics and reporting
- Generic tests: unique, not null and acceptable values
- Documentation using dbt docs

#### 📊 Dashboard Highlights
- KPIs (Jobs, TBytes, Price, Users, Projects)
- Total cost and processing over time
- Cost and processing distribution per project
- Highlight of users responsible for more than 10% of project cost
<img width="1362" height="612" alt="image" src="https://github.com/user-attachments/assets/b39c3544-91cb-4c7e-86be-3be2d48d3587" />


#### 🎯 Key Skills Demonstrated
- Cloud data warehousing and analytics
- Analytics engineering with dbt
- Data quality testing and documentation
- Cost observability concepts
- Data visualization
- Version control


**← [Back to main README](../../README.md)**
