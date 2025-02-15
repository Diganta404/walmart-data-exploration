# 📊 Walmart Sales Data Analysis

![Project Banner](https://github.com/Diganta404/walmart-data-exploration/blob/main/home.png)

This project is an **end-to-end data analysis solution** designed to extract critical business insights from Walmart sales data. We utilize **Python (Pandas)** for data processing, **SQL (PostgreSQL/MySQL)** for advanced querying, and structured problem-solving techniques to derive key business insights. 

---

## 🚀 Project Workflow

### **1️⃣ Data Collection & Cleaning**
- Download the Walmart sales dataset using the **Kaggle API**.
- Clean and preprocess the data using **Pandas**:
  - Handle missing values, duplicates, and formatting inconsistencies.
  - Ensure proper data types for numerical and categorical fields.

### **2️⃣ Loading Data into SQL**
- Convert the cleaned dataset into a structured format.
- Load the data into **PostgreSQL & MySQL** using **SQLAlchemy**.

### **3️⃣ SQL Analysis & Business Insights**
- Write **complex SQL queries** to answer key business questions:
  - Identify **peak sales hours** and **best-selling products**.
  - Analyze **revenue trends** across branches.
  - Determine **customer purchasing patterns** based on time, city, and payment methods.

### **4️⃣ Documentation & Project Deployment**
- Maintain **clear documentation** for queries, insights, and future improvements.
- Publish the project on **GitHub** with a well-structured repository.

---

---

## 🏬 Database Schema

The Walmart sales dataset schema:

| Column Name     | Data Type    | Description                                      |
|----------------|-------------|--------------------------------------------------|
| `invoice_id`   | VARCHAR(20)  | Unique identifier for each transaction.         |
| `branch`       | VARCHAR(5)   | Store branch code (e.g., A, B, C).              |
| `city`         | VARCHAR(50)  | City where the branch is located.               |
| `customer_type`| VARCHAR(20)  | Type of customer (Member / Normal).             |
| `gender`       | VARCHAR(10)  | Gender of the customer.                         |
| `product_line` | VARCHAR(100) | Category of product purchased.                  |
| `unit_price`   | DECIMAL(10,2)| Price per unit of the product.                  |
| `quantity`     | INT          | Number of units purchased.                      |
| `tax`          | DECIMAL(10,2)| VAT applied to the total amount.                |
| `total`        | DECIMAL(10,2)| Final amount including VAT.                     |
| `date`         | DATE         | Date of the transaction.                        |
| `time`         | TIME         | Time of the transaction.                        |
| `payment`      | VARCHAR(20)  | Payment method used (Cash, Credit Card, E-Wallet). |
| `cogs`         | DECIMAL(10,2)| Cost of goods sold.                             |
| `gross_margin_percentage` | DECIMAL(10,2) | Gross margin as a percentage. |
| `gross_income` | DECIMAL(10,2)| Total gross income for the sale.                |
| `rating`       | DECIMAL(2,1) | Customer rating of the transaction.             |

## 🚀 Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/Diganta404/walmart-data-exploration.git
   cd walmart-data-exploration


## 📊 Results & Insights

- **📅 Peak Sales Days:** Identify the busiest days for each branch.
- **💰 Revenue Trends:** Determine which branches and product categories generate the most sales.
- **🛒 Customer Behavior:** Analyze purchasing patterns based on time, payment methods, and quantity.

---

## 🛠️ Technologies Used

- **Python** → `Pandas`, `NumPy`, `SQLAlchemy`
- **Databases** → `PostgreSQL`, `MySQL`
- **Jupyter Notebook** → Data exploration & visualization
- **Kaggle API** → Automated dataset retrieval
- **VS Code** → Development environment

---

## 🔧 Getting Started

1️⃣ **Clone the repository**  
```bash
git clone <repo-url>

```


## Contributing
Contributions are welcome! If you have any queries or want to add new analyses, feel free to open a pull request.

## Contact
- **Name**: Diganta Mitra
- **Email**: dgntmitra@gmail.com
- **LinkedIn**: [Diganta Mitra](https://www.linkedin.com/in/diganta-mitra-77b634264?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=ios_app)
