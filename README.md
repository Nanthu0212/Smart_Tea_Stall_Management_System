# ☕ Smart Tea Stall Management System

## 📌 Project Overview

The **Smart Tea Stall Management System** is a Java-based console application connected to a MySQL database, built using JDBC for connectivity. It allows both customers and administrators to manage every part of running a tea stall — ordering, seating, inventory, staff, suppliers, finances, and reporting — through a single command-line interface.

This project demonstrates core concepts of:
- Java (OOP, layered design)
- JDBC (Database Connectivity)
- SQL Operations (CRUD across 20 tables)
- Business Logic & Reporting (revenue, profit, stock calculations)

---

## 🚀 Features

### 🧑‍🍳 Customer Functionalities
- 📝 Enter customer details (name, phone, group size)
- 🍽️ Choose table sharing preference and get a recommended table
- 📋 Browse menu category-by-category with live prices
- 🛒 Add items to cart, update quantity, or remove items
- 💳 Place order and pay via Cash / UPI / Card
- ⭐ Leave feedback with rating and comments

### 👨‍💼 Admin Functionalities
- ➕ Manage menu, categories, and add-ons
- 🪑 Manage tables and seats
- 📦 Manage inventory with low-stock detection and stock value calculation
- 👥 Manage employees, attendance, and leave requests
- 🚚 Manage suppliers
- 🏷️ Manage assets, expenses, and utility bills
- 🛠️ Track maintenance and damage records
- 📊 Generate business reports (revenue, expenses, profit, average order value)
- 🔐 Manage admin accounts

### 🔐 Authentication
- Admin login system (username + password)

---

## 🧠 System Workflow
User Input → Main Menu → Customer / Admin
↓
Customer: Info → Table → Menu → Cart → Order → Payment → Feedback
Admin: Login → 20-Option Dashboard → Selected Module
↓
Service Layer → DAO Layer → JDBC → MySQL Database
↓
Process Data (Totals, Stock, Salary, Profit)
↓
Display Output in Console

---

## 🛠 Technologies Used

- ☕ Java (Core Java, OOP)
- 🔌 JDBC (Java Database Connectivity)
- 🛢 MySQL Database
- 🧰 Eclipse IDE (Development Environment)

---

## 🗄 Database Details

**Database Name:** `SmartTeaStall`
**Total Tables:** 20

| Table | Purpose |
|---|---|
| `admin` | Stores administrator login credentials |
| `menu_categories` | Menu groupings such as Tea, Coffee, Snacks |
| `menu_items` | Products sold, with price, description, and availability |
| `addons` | Optional add-ons linked to menu items |
| `tables` | Dining tables with capacity, status, and location |
| `seats` | Individual seats linked to each table |
| `orders` | Customer orders and their status |
| `order_items` | Items and quantities inside each order |
| `payments` | Payment amount, method, status, and time |
| `feedback` | Customer ratings and comments linked to orders |
| `employees` | Staff records, roles, and salary details |
| `attendance` | Daily employee attendance records |
| `leaves` | Employee leave applications and status |
| `inventory` | Stock quantity, unit, minimum stock, and purchase price |
| `suppliers` | Supplier contact details and supplied items |
| `assets` | Fixed assets and equipment owned by the stall |
| `expenses` | Day-to-day operational expenses |
| `utility_bills` | Electricity, water, and other recurring bills |
| `maintenance` | Equipment repair records and technician details |
| `damages` | Damaged or lost stock records with cost and status |

### Sample Table Structure — `menu_items`

| Column | Type |
|---|---|
| item_id | INT (PK) |
| category_id | INT (FK) |
| item_name | VARCHAR |
| description | VARCHAR |
| price | DECIMAL |
| available | BOOLEAN |

### Sample Table Structure — `orders`

| Column | Type |
|---|---|
| order_id | INT (PK) |
| table_id | INT (FK) |
| customer_count | INT |
| sharing_allowed | BOOLEAN |
| order_status | VARCHAR |
| total_amount | DECIMAL |
| order_time | DATETIME |

---

## 📂 Project Structure
com.smartteastall/
├── database/ → DatabaseConnection.java
├── model/ → 19 entity classes (Order, Employee, Inventory, Table, etc.)
├── dao/ → 19 DAO classes handling all SQL/CRUD operations
├── service/ → OrderService, PaymentService, InventoryService,
│ EmployeeService, ReportService
├── main/ → Main.java (Customer + Admin console interface)
└── test/ → ConnectionTest, TableTest, SeatTest

---

## ⚙️ How to Run the Project

1. Open the project in Eclipse IDE
2. Ensure MySQL is running
3. Create the database:
CREATE DATABASE SmartTeaStall;

4. Create all 20 tables (schema included in the project)
5. Update database credentials in:

DatabaseConnection.java

6. Run:

Main.java

---

## 📊 Business Logic Highlights

| Calculation | Logic |
|---|---|
| Order Total | Sum of (item price × quantity) across cart |
| Net Profit | Total Revenue − Total Expenses |
| Inventory Value | Σ (quantity × purchase price) |
| Low Stock Alert | Current quantity < minimum stock |
| Average Order Value | Total Revenue ÷ Total Orders |
| Salary Payable | Salary + Bonus − Deduction |

---

## 🏆 Key Functional Highlights

1. Fully working guided customer ordering flow, tested live with MySQL
2. Complete 20-module admin dashboard
3. All SQL queries use `PreparedStatement` — no SQL injection risk
4. Clean separation into Model, DAO, Service, and CLI layers
5. Real-time stock, price, and table data — nothing hardcoded

---

## ⚠️ Limitations

- Console-based UI (no graphical interface yet)
- Admin password currently stored as plain text
- Database credentials are currently hardcoded in source
- JDBC connections are not yet closed with try-with-resources

---

## 🚀 Future Enhancements

- 🖥️ Add a JavaFX or web-based graphical interface on top of the existing Service layer
- 🔐 Hash admin passwords and externalize database credentials
- 🔄 Wrap multi-step operations (order + payment + stock update) in database transactions
- 📄 Generate downloadable order receipts and reports as PDF
- 📊 Add chart-based visualization for reports

---

## 👩‍💻 Author

Nantha Kishore N (Nanthu)

---

## 🙌 Conclusion

This project demonstrates a strong foundation in Java programming, JDBC database connectivity, layered software architecture, and real-world business logic. It serves as a solid, portfolio-ready example of a full backend system, built to be extended with a graphical or web front end in the future.
