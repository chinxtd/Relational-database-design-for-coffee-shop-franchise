# Relational database design for coffee shop franchise
This project was created as a final assignment of the Introduction to Relational Databases (RDBMS) by IBM

## Objective
- Design new relational database from the existing data for improved efficiencies.

## Solution
- Analyze the existing data in the tables below
<img src="https://github.com/chinxtd/Relational-database-design-for-coffee-shop-franchise/blob/main/image/existing_data.png" alt="existing_data">

- as you can see ***transaction_id*** column of ***sales_transaction*** table does not contain unique values because it include multiple products.
- Normalized and created a new table ***"sales_detail"*** with columns: ***sales_detail_id, product_id, quantity, price*** and ***transaction_id*** as a foreign key to link relationship with ***sales_transaction*** table
- Another one is the ***product_type*** and ***product_category***, as you can see they have a redundant data
- Normalized by moving both columns to a new table ***"product_type"*** with columns: ***product_type_id, product_type, product_category***
- Add ***product_type_id*** column in the ***product*** table as a foreign key to link the relationship with ***product_type*** table
- now create the rest tables and define a relationship between tables
- the ERD should look like below picture
<img src="https://github.com/chinxtd/Relational-database-design-for-coffee-shop-franchise/blob/main/image/ERD.png" alt="Normalized_ERD">
