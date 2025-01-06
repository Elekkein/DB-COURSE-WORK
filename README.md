# DB-COURSE-WORK
Here is the SQL code for the database course work that was given to us at Victoria university and would like to share it here
It is a DB for a hospital management system for Victoria University Hospital/Clinic which seeks to enhance its operational efficiency and fulfill its Corporate Social Responsibility by transitioning its patient registration process from a paper-based system to a robust, database-driven system.


**Overview**

This project showcases a comprehensive SQL database schema designed to manage healthcare data. The schema organizes information about patients, health facilities, resources, treatments, and more. It demonstrates best practices in relational database design, featuring well-structured tables and meaningful relationships to ensure efficient data management.

**Features**

Geographical Data Management: Track locations, population, and malaria risk levels.

Patient Records: Maintain personal and medical data for patients.

Facility Management: Store and manage details of healthcare facilities, including capacity and resources.

Resource and Supply Chain Tracking: Manage resources within facilities and their shipments.

Disease and Treatment Tracking: Log malaria cases, treatments, and outcomes.

User Management: Control access through roles and maintain system logs for accountability.

**Database Tables**

1. geographical_location

Stores data on locations, including population, coordinates, and malaria risk levels.

2. patient_data

Holds personal and contact information for patients.

3. health_facility

Tracks information about healthcare facilities, including type and capacity.

4. resource

Manages available resources in facilities.

5. supply_chain

Tracks resource shipments and statuses.

6. malaria_cases

Logs cases of malaria, linking patients, facilities, and treatments.

7. treatment and treatment_outcome

Store treatment details and outcomes.

8. user_role and user

Define system users and their roles.

9. system_log

Tracks user activity for auditing purposes.


Open the SQL file in your preferred database management tool.

Execute the SQL script to create the database and tables.

Usage

Use the INSERT statements to populate tables with data.

Query the database using SQL to retrieve insights, such as:

Locations with the highest malaria risk.

Facilities with resource shortages.

Treatment outcomes for specific cases.

Contributing

Contributions are welcome! Feel free to fork the repository, make improvements, and submit a pull request.

