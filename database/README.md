🥗 Nutritional Clinic Database (SQL Server)

This project implements a relational database for a nutritional clinic, designed using real-world business rules and best practices in SQL Server.

It demonstrates database design, data integrity, performance considerations, and automation through constraints, indexes, views, and triggers.

📌 Project Scope

The database supports the core operations of a nutritional clinic, including:

* Patient management

* Nutritionist management

* Appointments scheduling

* Nutrition plans

* Payments and billing

* Reporting and analytics

The goal of this project is to showcase practical SQL skills, not just table creation.

🧱 Database Structure

- Core Entities
- Patient
- Nutritionist
- Appointment
- NutritionPlan
- Payment

All relationships are enforced using foreign keys, ensuring referential integrity.

🛠️ Technologies

* Microsoft SQL Server
* T-SQL

▶️ Execution Order

To run the project from scratch:

1. setup/00_create_database.sql
2. schema/01_create_tables.sql
3. schema/02_create_indexes.sql
4. schema/03_add_constraints.sql
5. data/01_sample_data.sql
6. views/01_create_views.sql
7. triggers/01_create_triggers.sql
8. auditLog/01_create_audit_table.sql
9. auditLog/02_add_audit_constraints.sql
10. (Optional) tests/03_testing.sql

🎯 Design Principles Applied

* Separation of concerns (setup, schema, data, tests)
* Defensive database design
* Real-world business logic
* SQL Server best practices
* Clean and readable scripts

👤 Author 

JD (Luishas)

* SQL Server • Backend • Data-Oriented Design
