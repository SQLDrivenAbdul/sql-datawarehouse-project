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

```sql
USE MASTER;
GO
```
--- Drop and recreate the 'DataWarehouse' database

*/
