# 🧱 Data Warehouse Setup

This script creates a new database named **`DataWarehouse`**.  
If it already exists, it will be **dropped and recreated**.  

It also sets up three schemas:
- 🥉 **bronze** – raw data  
- 🥈 **silver** – cleaned and transformed data  
- 🥇 **gold** – curated, analytics-ready data  

> ⚠️ **Warning:** Running this script will permanently delete the `DataWarehouse` database if it exists.  
> Ensure you have a proper backup before running it.

---

## 🚀 How to Run

1. Open **SQL Server Management Studio (SSMS)** or **Azure Data Studio**.  
2. Connect to your SQL Server instance.  
3. Copy and paste the script below.  
4. Press **F5** (or click **Run**) to execute it.  

---

## 📜 SQL Script

```sql
/*
*******************************************************
Create Database and Schemas
*******************************************************
This script creates a new database named 'DataWarehouse'. 
If it already exists, it is dropped and recreated. 
It also sets up three schemas: bronze, silver, and gold.
*/

-- Drop and recreate the 'DataWarehouse' database
USE master;
GO

IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse 
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

-- Create database 'DataWarehouse'
CREATE DATABASE DataWarehouse;
GO

-- Switch to the new database
USE DataWarehouse;
GO

-- Create schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
