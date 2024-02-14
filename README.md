# Store-DB
The provided SQL commands represent the setup of a database system for managing a store. 
Below is a breakdown of the actions taken:

Database Listing:

The SHOW DATABASES; command lists the existing databases in the MySQL server.
Database Selection:

The USE storedb; command selects the database named "storedb" for further operations.
Table Creation:

The CREATE TABLE statements are used to create three tables: "clients", "produits", and "commandes".
The "clients" table includes fields for client information such as name, email, address, and telephone.
The "produits" table includes fields for product information such as name, description, price, and stock.
The "commandes" table includes fields for order information such as order ID, client ID, order date, order status, and total.
Foreign key constraints are applied to ensure referential integrity between related tables.
A check constraint is added to the "commandes" table to limit the "statut" field to specific values.
Table Description:

The DESC command provides the structure of each table after its creation.
It displays the fields, their data types, nullability, keys, and any default values or extra attributes associated with each field.
Default Value Assignment:

The ALTER TABLE command is used to modify the "commandes" table, setting a default value of "en cours" for the "statut" field.
This ensures that when a new order is inserted into the "commandes" table without specifying a status, it defaults to "en cours".
