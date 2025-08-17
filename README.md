# Online-Canteen-Ordering-System
🍽️ Online College Canteen Ordering System is a JSP, Servlet &amp; Spring Boot-based web app that simplifies food ordering in college canteens. Students can browse menus, filter items, book tables &amp; place orders, while admins manage menus &amp; track orders. Built with JDBC, MySQL, HTML, CSS &amp; DAO–POJO design.
# 🍴 Online College Canteen  

📅 **Duration:** January 2025 – May 2025  
🛠️ **Technologies Used:** JSP, Servlet, JDBC, Spring Boot, Spring Data JPA, MySQL, HTML, CSS  

---

## 🏫 Industry  
Education / Food-Tech  

---

## 📌 Project Title  
**Online College Canteen Ordering System**  

---

## ❓ Problem Statement / Opportunity  
Managing food orders in college canteens is often chaotic due to **long queues, delayed service, and lack of transparency**.  
The opportunity lies in developing an **online canteen ordering system** where students can browse menus, place orders digitally, and track order status. This not only saves time but also improves **canteen efficiency** and user satisfaction.  

---

## 📖 Project Description  
The **Online College Canteen Ordering System** is a web application built in **two phases**:  

1. **JSP + Servlet + JDBC (Core Java Web App)**  
   - Implemented MVC architecture with DAO and POJO classes for database interaction.  
   - Users can browse menus, add items to cart, select a table, and place orders.  
   - Admins can manage food items and track customer orders.  

2. **Spring Boot + JPA (Enhanced Version)**  
   - Migrated to Spring Boot for scalability and modularity.  
   - Built REST APIs for menu, order, and user management.  
   - Integrated Spring Data JPA for efficient database operations.  

The system provides an **interactive interface for users and a robust management panel for admins**.  

---

## 🚀 Features  

### 👤 User (Students/Staff)  
- Register & login securely  
- Browse, search, and filter menu items  
- Select a table and add items to cart  
- Place and confirm orders  
- View order history  
- Track real-time order status  

### 🛠️ Admin (Canteen Manager)  
- Secure login  
- Add/Edit/Delete menu items & categories  
- View & manage user orders  
- Update order status (Pending → Preparing → Ready → Delivered)  
- Manage table availability  

### 🔒 Security  
- Role-based authentication (User & Admin)  
- Session handling in JSP/Servlet version  
- Spring Security in Spring Boot version  
- Secure database interactions with DAO/POJO and JPA  

### 📦 Order Management System  
- Prevents duplicate orders  
- Cancelling an order frees up the table  
- Real-time status updates for users  

---

## 📸 Screenshots *(Add Images Later)*  

- 🏠 Home Page  
- 📋 Food Menu  
- 🛒 Cart & Checkout  
- 📊 Admin Dashboard  

---

## 🛠️ Tech Stack  

| Tech              | Description |
|-------------------|-------------|
| **JSP & Servlet** | Dynamic UI + request handling |
| **JDBC**          | Database connectivity |
| **Spring Boot**   | REST API backend |
| **Spring Data JPA** | ORM for database operations |
| **MySQL**         | Relational database |
| **HTML/CSS**      | Frontend design |
| **Bootstrap**     | UI styling |
| **Maven**         | Build tool |
| **GitHub**        | Version control |

---

## ⚙️ Setup Instructions (Local)  

### 1️⃣ Clone the Repository  
```bash
git clone https://github.com/your-username/OnlineCollegeCanteen.git
cd OnlineCollegeCanteen
Got it ✅ Here’s your complete **README.md file** (all in one Markdown file, clean and ready to use):

````markdown
# 🍴 Online College Canteen Management System

---

## 2️⃣ Setup Database (MySQL)
```sql
CREATE DATABASE canteen_db;
````

---

## 3️⃣ JSP + Servlet + JDBC Version

* Import into **Eclipse/IntelliJ**
* Configure JDBC connection in **DBConnection.java**:

```java
String url = "jdbc:mysql://localhost:3306/canteen_db";
String username = "root";
String password = "yourpassword";
```

* Deploy on **Apache Tomcat**
* Access at: [http://localhost:8080/OnlineCollegeCanteen](http://localhost:8080/OnlineCollegeCanteen)

---

## 4️⃣ Spring Boot + JPA Version

* Navigate to **springboot-version/**
* Configure **application.properties**:

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/canteen_db
spring.datasource.username=root
spring.datasource.password=yourpassword
spring.jpa.hibernate.ddl-auto=update
```

* Run backend:

```bash
mvn spring-boot:run
```

* API available at: [http://localhost:8080/api](http://localhost:8080/api)

---

## 🎯 Role & Responsibilities

* Designed and developed Java web application using JSP, Servlet, DAO, and POJO
* Implemented database connectivity & modeling with JDBC + MySQL
* Migrated application to Spring Boot + JPA for modern scalability
* Built secure session handling & order management system
* Designed responsive JSP pages with HTML & CSS

---

## 🌟 Future Enhancements

* 💳 Online Payment Gateway (UPI/Wallet/NetBanking)
* 📱 Mobile App version (Android/iOS)
* 🔔 Push Notifications for order updates
* 📊 Analytics Dashboard for Admin
* 🧾 Digital Invoice Generation

---

## 👨‍💻 Contributor

**Prince Rajput** – Leader , Frontend , Backend And Database :https://github.com/Pr-09 . 

**Nityanand Dwivedi** – Developer, Frontend , Backend , synopsis, PPT , Management And Content : https://github.com/nitya45 .

---

## ⚠️ Disclaimer

This project is built as an academic/portfolio project for demonstration purposes only.
It does not include production-grade payment systems and does not store sensitive user data.

---

## 📧 Contact

* **Developer:** Nityanand Dwivedi And Prince Rajput
* **Email:** nityananddwivedi896@gmail.com 
* **GitHub:** https://github.com/nitya45
