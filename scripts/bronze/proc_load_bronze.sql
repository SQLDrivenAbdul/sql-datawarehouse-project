
/*
=========================================================================================================
Stored procedure: Load Bronze Layer (source -> bronze)
=========================================================================================================
Script purpose:
This stored procedure loads data into the bronze schema from external csv files.

It performs the following actions:
- Truncate the bronze tables before loading data
- Uses the 'BULK INSERT' command to load data from csv files to bronze tables

Parameters:
        None.

This stored procedure does not accept any parameter or return any values.

Usage Example:
              EXEC bronze.load_bronze
===========================================================================================================
*/

```sql
EXEC bronze.load_bronze

CREATE OR ALTER PROCEDURE bronze.load_bronze AS 
BEGIN 
	DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME,@batch_end_time DATETIME
	BEGIN TRY

SET  @batch_start_time = GETDATE()
PRINT '**************************************************';
PRINT 'Loading Bronze Layer';
PRINT '**************************************************';


PRINT '--------------------------------------------------';
PRINT 'Loading CRM tables';
PRINT '--------------------------------------------------';

SET @start_time = GETDATE();
PRINT '>>> Truncating table:  bronze.crm_cust_info';
TRUNCATE  TABLE bronze.crm_cust_info;

PRINT '>>> Inserting Data Into:  bronze.crm_cust_info';

BULK INSERT bronze.crm_cust_info
FROM 'C:\Users\USER\OneDrive\Desktop\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
WITH (
FIRSTROW = 2,
FIELDTERMINATOR = ',',
TABLOCK
);
SET @end_time = GETDATE();
PRINT 'Load duration:' + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS VARCHAR) + 'seconds'
PRINT '---------------'



PRINT('>>> Truncating table:  bronze.crm_prd_info');
TRUNCATE TABLE bronze.crm_prd_info;

SET @start_time = GETDATE();
PRINT('>>> Inserting Data Into:  bronze.crm_prd_info');

BULK INSERT bronze.crm_prd_info 
FROM 'C:\Users\USER\OneDrive\Desktop\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
WITH (
FIRSTROW = 2 ,
FIELDTERMINATOR = ',',
TABLOCK
);
SET @end_time = GETDATE();
PRINT 'Load duration:' + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS VARCHAR) + 'seconds'
PRINT '---------------'



PRINT('>>> Truncating table: bronze.crm_sales_details');
TRUNCATE TABLE bronze.crm_sales_details;

SET @start_time = GETDATE();
PRINT('>>> Inserting Data Into: bronze.crm_sales_details');

BULK INSERT bronze.crm_sales_details
FROM 'C:\Users\USER\OneDrive\Desktop\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
WITH (
FIRSTROW = 2,
FIELDTERMINATOR = ',',
TABLOCK
);
SET @end_time = GETDATE();
PRINT 'Load duration:' + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS VARCHAR) + 'seconds'
PRINT '---------------'




PRINT('--------------------------------------------------');
PRINT('Loading ERP tables');
PRINT('--------------------------------------------------');


PRINT('>>> Truncating table: bronze.erp_loc_a101');
TRUNCATE TABLE bronze.erp_loc_a101;

SET @start_time = GETDATE();
PRINT('>>> Inserting Data Into: bronze.erp_loc_a101');

BULK INSERT bronze.erp_loc_a101
FROM 'C:\Users\USER\OneDrive\Desktop\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
WITH (
FIRSTROW = 2,
FIELDTERMINATOR = ',',
TABLOCK
);
SET @end_time = GETDATE();
PRINT 'Load duration:' + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS VARCHAR) + 'seconds'
PRINT '---------------'



PRINT('>>> Truncating table: bronze.erp_cust_az12');
TRUNCATE TABLE bronze.erp_cust_az12;

SET @start_time = GETDATE();
PRINT('>>> Inserting Data Into: bronze.erp_cust_az12');

BULK INSERT bronze.erp_cust_az12
FROM 'C:\Users\USER\OneDrive\Desktop\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
WITH (
FIRSTROW = 2,
FIELDTERMINATOR = ',',
TABLOCK
);
SET @end_time = GETDATE();
PRINT 'Load duration:' + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS VARCHAR) + 'seconds'
PRINT '---------------'



PRINT('>>> Truncating table: bronze.erp_px_cat_giv2');
TRUNCATE TABLE bronze.erp_px_cat_giv2;

SET @start_time = GETDATE();
PRINT('>>> Inserting Data Into: bronze.erp_px_cat_giv2');

BULK INSERT bronze.erp_px_cat_giv2
FROM 'C:\Users\USER\OneDrive\Desktop\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
WITH (
FIRSTROW = 2,
FIELDTERMINATOR = ',',
TABLOCK
);
SET @end_time = GETDATE();
PRINT 'Load duration:' + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS VARCHAR) + 'seconds'
PRINT '---------------'

	SET  @batch_end_time = GETDATE()
	PRINT '-------------------------------------------'
	PRINT 'Loading Bronze Layer Completed'
	PRINT 'Batch Load Duration:' + CAST(DATEDIFF(SECOND,@batch_start_time,@batch_end_time) AS VARCHAR) + ' seconds';
	PRINT '-------------------------------------------'
	END TRY
	BEGIN CATCH
		PRINT '**************************************************';
		PRINT 'ERROR OCCURED WHILST LOADING BRONZE LAYER';
		PRINT 'Error Message'+ ERROR_MESSAGE();
		PRINT 'Error Number'+ CAST(ERROR_NUMBER() AS VARCHAR);
		PRINT 'Error Number'+ CAST(ERROR_NUMBER() AS VARCHAR) 
		PRINT '**************************************************'
	END CATCH

END
```
