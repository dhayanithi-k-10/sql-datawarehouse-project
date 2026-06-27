CREATE OR ALTER PROCEDURE bronze.load_bronze as
 BEGIN
     DECLARE @start_date DATETIME,@end_date DATETIME,@batch_start_date DATETIME,@batch_end_date DATETIME;
BEGIN TRY
         SET @batch_start_date=GETDATE();
		 PRINT'====================================================';
		 PRINT'LOADING BRONZE LAYER';
		 PRINT'====================================================';

		 PRINT'----------------------------------------------------';
		 PRINT'LOADING CRM TABLES';
		 PRINT'----------------------------------------------------';

		 SET @start_date =GETDATE();
		 PRINT'>>TRUNCATING TABLE:'+'bronze.crm_cust_info';
		TRUNCATE TABLE bronze.crm_cust_info;
		 PRINT'INSERTING DATA INTO TABLE:'+'bronze.crm_cust_info';
		BULK INSERT bronze.crm_cust_info
		FROM 'D:\SQL BY BAARA\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		WITH(
		 FIRSTROW = 2,
		 FIELDTERMINATOR=',',
		 TABLOCK
		 );
		 SET @end_date=GETDATE();
		 PRINT'>> LOADIND DURATION:'+cast( DATEDIFF(SECOND,@start_date,@end_date) as NVARCHAR)+'Seconds';
		 PRINT'>> -------------';


		 SET @start_date =GETDATE();;
		 PRINT'>>TRUNCATING TABLE:'+'bronze.crm_prd_info';
		TRUNCATE TABLE bronze.crm_prd_info;
		 PRINT'INSERTING DATA INTO TABLE:'+'bronze.crm_cust_info';
		BULK INSERT bronze.crm_prd_info
		FROM 'D:\SQL BY BAARA\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		WITH(
		 FIRSTROW = 2,
		 FIELDTERMINATOR=',',
		 TABLOCK
		 );
		  SET @end_date=GETDATE();
		  PRINT'>> LOADIND DURATION:'+cast( DATEDIFF(SECOND,@start_date,@end_date) as NVARCHAR)+'Seconds';
		 PRINT'>> -------------';

		   SET @start_date =GETDATE();
		 PRINT'>>TRUNCATING TABLE:'+'bronze.crm_sales_details';
		TRUNCATE TABLE bronze.crm_sales_details;
		 PRINT'INSERTING DATA INTO TABLE:'+'bronze.crm_cust_info';
		BULK INSERT bronze.crm_sales_details
		FROM 'D:\SQL BY BAARA\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		WITH(
		 FIRSTROW = 2,
		 FIELDTERMINATOR=',',
		 TABLOCK
		 );
		  SET @end_date=GETDATE();
		 PRINT'>> LOADIND DURATION:'+cast( DATEDIFF(SECOND,@start_date,@end_date) as NVARCHAR)+'Seconds';
		 PRINT'>> -------------';

		 PRINT'----------------------------------------------------';
		 PRINT'LOADING ERP TABLES';
		 PRINT'----------------------------------------------------';

		  SET @start_date =GETDATE();
		 PRINT'>>TRUNCATING TABLE:'+'bronze.erp_cust_az12';
		TRUNCATE TABLE bronze.erp_cust_az12;
		 PRINT'INSERTING DATA INTO TABLE:'+'bronze.crm_cust_info';
		BULK INSERT bronze.erp_cust_az12
		FROM 'D:\SQL BY BAARA\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
		WITH(
		 FIRSTROW = 2,
		 FIELDTERMINATOR=',',
		 TABLOCK
		 );
		 SET @end_date=GETDATE();
		 PRINT'>> LOADIND DURATION:'+cast( DATEDIFF(SECOND,@start_date,@end_date) as NVARCHAR)+'Seconds';
		 PRINT'>> -------------';

		  SET @start_date =GETDATE();
		 PRINT'>>TRUNCATING TABLE:'+'bronze.erp_loc_a101';
		TRUNCATE TABLE bronze.erp_loc_a101;
		 PRINT'INSERTING DATA INTO TABLE:'+'bronze.crm_cust_info';
		BULK INSERT bronze.erp_loc_a101
		FROM 'D:\SQL BY BAARA\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
		WITH(
		 FIRSTROW = 2,
		 FIELDTERMINATOR=',',
		 TABLOCK
		 );
		  SET @end_date=GETDATE();
		 PRINT'>> LOADIND DURATION:'+cast( DATEDIFF(SECOND,@start_date,@end_date) as NVARCHAR)+'Seconds';
		 PRINT'>> -------------';

		   SET @start_date =GETDATE();
		 PRINT'>>TRUNCATING TABLE:'+'bronze.erp_px_cat_g1v2';
		TRUNCATE TABLE bronze.erp_px_cat_g1v2;
		 PRINT'INSERTING DATA INTO TABLE:'+'bronze.crm_cust_info';
		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'D:\SQL BY BAARA\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'
		WITH(
		 FIRSTROW = 2,
		 FIELDTERMINATOR=',',
		 TABLOCK
		 );
		 SET @end_date=GETDATE();
		 PRINT'>> LOADIND DURATION:'+cast( DATEDIFF(SECOND,@start_date,@end_date) as NVARCHAR)+'Seconds';
		 PRINT'>> -------------';
		
		SET @batch_end_date=GETDATE();
		PRINT'=============================================';
		PRINT'LOADIND BRONZE LAYER IS COMPLETED';
		PRINT'TOTAL LOAD DURATION:'+ CAST(DATEDIFF(SECOND,@batch_start_date,@batch_end_date) as NVARCHAR)+'SECONDS'; 
		PRINT'=============================================';


END TRY
	 BEGIN CATCH
		 PRINT'===========================================';
		 PRINT'ERROR OCCURED DURING LOADING BRONZE LAYER';
		 PRINT'ERROR MESSAGE'+ERROR_MESSAGE();
		 PRINT'ERROR MESSAGE'+CAST(ERROR_NUMBER() AS NVARCHAR);
		 PRINT'ERROR MESSAGE'+CAST(ERROR_NUMBER() AS NVARCHAR);
		 PRINT'===========================================';
	 END CATCH
 END;
