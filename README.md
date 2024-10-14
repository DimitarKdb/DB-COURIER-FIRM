# Courier Firm DB - SQL Project

This project simulates the database a courier firm, focusing on managing packages, deliveries, customers, and couriers. The project uses SQL scripts to create and manage the database, and includes a simple Java application to demonstrate database interaction.

## Project Structure

- **CreateTables.sql**: This script contains the SQL statements for creating the necessary tables for the courier firm’s database.
  
- **FillTables.sql**: Populates the tables with initial data to facilitate testing and development.

- **Functions.sql**: Defines functions for various operations.

- **ExecFunctions.sql**: Demonstrates the execution of the functions defined in `Functions.sql` with specific examples.

- **Triggers.sql**: Contains triggers that automate certain tasks.

- **Views.sql**: Defines views to simplify complex queries.

- **Test.sql**: Testing if the tables have been properly created.

- **DB2Test.java**: A simple Java application that connects to the database, performs basic CRUD operations, and demonstrates database interaction through SQL queries.

## How to Use

1. **Set up the Database**: 
   - Run `CreateTables.sql` to create the database schema.
   - Run `FillTables.sql` to populate the tables with sample data.

2. **Functions and Triggers**: 
   - Run `Functions.sql` and `Triggers.sql` to add business logic and automate processes.

3. **Test the Database**: 
   - Use `Test.sql` to verify that everything is as expected.

4. **Run the Java Application**:
   - Compile and run `DB2Test.java` to interact with the database through a Java interface.

