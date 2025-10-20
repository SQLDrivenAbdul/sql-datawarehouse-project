# 🧱 Data Warehouse Setup Script

This script creates a new database named **`DataWarehouse`**.  
If it already exists, it will be **dropped and recreated**.  

It also sets up three schemas:
- `bronze` 🥉  
- `silver` 🥈  
- `gold` 🥇  

> ⚠️ **Warning:** Running this script will permanently delete the `DataWarehouse` database if it exists.  
> Ensure you have a proper backup before running.

---

### 📜 SQL Script

```sql
/*
*******************************************************
Create Database and Schema
*******************************************************

Script Purpose:
This script creates a new database named 'DataWarehouse'. 
If it already exists, it is dropped and recreated. 
Additionally, the script sets up three schemas within the database: 'bronze', 'silver', and 'gold'.

WARNING:
Running this script will drop the entire 'DataWarehouse' database permanently if it exists.
Proceed with caution and ensure you have a proper backup before running this script.
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
