# SQL-zepto-data-analysis
This project involves analyzing a sales dataset imported from Kaggle using SQL. The goal was to extract meaningful insights by data cleanig, exploratory data analysis(EDA) and solving business problems using SQL .
# 📦 Zepto E-Commerce Data Analysis | SQL Portfolio Project

Welcome to my Data Analyst Portfolio Project! In this project, I explored a real-world-style dataset inspired by Zepto (an Indian quick-commerce platform), using SQL to perform in-depth analysis. The goal was to extract meaningful business insights that could help improve decision-making in areas such as product performance, customer behavior, and operations.

---

## 📊 Project Overview

This project simulates a real-life scenario where an analyst is tasked with understanding various aspects of e-commerce business performance using structured query language (SQL). I worked with a dataset structured to reflect Zepto-like e-commerce operations, covering orders, customers, product categories, and delivery details.

Using SQL, I:

✅ Set up a messy, real-world e-commerce inventory database.

✅ Perform Exploratory Data Analysis (EDA) to explore product categories, availability, and pricing inconsistencies.

✅ Implement Data Cleaning to handle null values, remove invalid entries, and convert pricing from paise to rupees.

✅ Write business-driven SQL queries to derive insights around pricing, inventory, stock availability, revenue and more.

---

## 🗃️ Dataset Overview
The dataset was sourced from Kaggle and was originally scraped from Zepto’s official product listings.

Each row represents a unique SKU (Stock Keeping Unit) for a product. Duplicate product names exist because the same product may appear multiple times in different package sizes, weights, discounts, or categories to improve visibility – exactly how real catalog data looks.

🧾 Columns:

sku_id: Unique identifier for each product entry (Synthetic Primary Key)

name: name of the product which appears on the app

category: Product category like Fruits, Snacks, Beverages, etc.

mrp: Maximum Retail Price (originally in paise, converted to Rs.)

discountPercent: Discount applied on MRP

discountedSellingPrice: Final price after discount (also converted to Rs.)

availableQuantity:No. of Units available in inventory

weightInGms: weights of product in grams

outOfStock: Boolean flag indicating stock availability

quantity: Number of units per package (mixed with grams for loose produce)

---

## **Project Workflow**
Here’s a step-by-step breakdown of what we do in this project:

**1. 🛠️ Database & Table Creation**  
We start by creating a SQL table with appropriate data types:

CREATE TABLE zepto (
  sku_id SERIAL PRIMARY KEY,
  category VARCHAR(120),
  name VARCHAR(150) NOT NULL,
  mrp NUMERIC(8,2),
  discountPercent NUMERIC(5,2),
  availableQuantity INTEGER,
  discountedSellingPrice NUMERIC(8,2),
  weightInGms INTEGER,
  outOfStock BOOLEAN,
  quantity INTEGER
);


**2. 📥 Data Import**  
- Loaded CSV files into the PostgreSQL database using **pgAdmin 4's Import feature**
- Faced **encoding issues (UTF-8 error)**, which were resolved by re-saving the CSV files in **CSV UTF-8 (Comma delimited)** format using a spreadsheet tool like Excel


**3. 🔍 Data Exploration**  
- Counted the **total number of records** in the dataset.  
- Viewed a **sample of the data** to understand structure and column types.
- Checked for **null or missing values** across all columns.  
- Identified **distinct product categories** available in the dataset.  
- Compared the number of **in-stock vs out-of-stock** products.  
- Detected **duplicate product names** listed under different SKUs.
  

**4. 🧹 Data Cleaning**  
- Identified and **removed rows** where `MRP` or `discountedSellingPrice` was **zero**, as these were likely invalid or incomplete entries.  
- Converted `MRP` and `discountedSellingPrice` values from **paise to rupees** to maintain consistency and improve readability.
  

**5. 📈 Business Insights**  
- Found **top 10 best-value products** based on highest discount percentage.  
- Identified **high-MRP products** that are currently **out of stock**.  
- Estimated **potential revenue** for each product category using price × quantity logic.  
- Filtered **expensive products** (MRP > ₹500) offering **minimal or no discounts**.  
- Ranked **top 5 categories** offering the **highest average discounts**.  
- Calculated **price per gram** to identify the most **value-for-money products**.  
- Grouped products into **Low, Medium, and Bulk weight categories** based on `weightInGms`.  
- Measured **total inventory weight** for each product category to understand stock distribution.

---

## 🛠️ Tech Stack

- **SQL (PostgreSQL)** – For querying and analyzing the dataset.
-  **pgAdmin 4** -  tool used to run and manage PostgreSQL queries and databases.
- **Kaggle** – Dataset source.

---

## 🎯 What I Learned

As someone starting out in data analytics, this project helped me gain hands-on experience with SQL and better understand how real-world e-commerce data can be structured and analyzed. Here’s what I learned:

- ✅ How to import and work with relational data using **pgAdmin 4** and **PostgreSQL**.
- ✅ Writing clean and efficient **SQL queries** using  `GROUP BY`, `ORDER BY`, and `CASE`.
- ✅ Performing **data cleaning** and basic **exploratory data analysis (EDA)** in SQL.
- ✅ Gained confidence in breaking down business problems into **data-driven questions**.
- ✅ How to **document and present** my work clearly on **GitHub** for recruiters and peers.

This was my first complete end-to-end data analysis project using SQL, and it really helped me build a solid foundation and understand how analysts work with structured datasets in real companies.

---

## 👩‍💻 About Me

Hi! I’m **Tanya Nuttakki**, a passionate entry-level data analyst with strong skills in **SQL, Excel, Power BI and data interpretation**. I enjoy solving real-world problems using data and am actively building a portfolio to showcase my skills.

- 🌐 LinkedIn: https://www.linkedin.com/in/tanya-nuttakki-b56954262
- 📫 Email: tanyareena.1408@gmail.com

I’m currently looking for opportunities in **data analytics**, **business intelligence**, or **data-driven roles** where I can grow and contribute.

---



