

CREATE OR ALTER PROCEDURE bronze.load_bronze 
AS 
BEGIN
    DECLARE @start_time      DATETIME,
            @end_time        DATETIME,
            @start_all_time  DATETIME,
            @end_all_time    DATETIME;

    BEGIN TRY
        SET @start_all_time = GETDATE();

        PRINT '==============================';
        PRINT 'loading bronze layer';
        PRINT '==============================';
        PRINT '------------------------------';
        PRINT 'loading crm tables';
        PRINT '------------------------------';


        ----------------------------------------
        -- CRM: crm_cust_info
        ----------------------------------------
        PRINT '>> truncating table : bronze.crm_cust_info';

        SET @start_time = GETDATE();
        TRUNCATE TABLE bronze.crm_cust_info;

        PRINT '>> inserting data into : bronze.crm_cust_info';

        BULK INSERT bronze.crm_cust_info
        FROM 'C:\Users\salma\AppData\Local\Temp\df887939-45b7-48da-9cb6-468550bd912f_f78e076e5b83435d84c6b6af75d8a679.zip.12f\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

        SET @end_time = GETDATE();
        PRINT 'load duration ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        SELECT COUNT(*) FROM bronze.crm_cust_info;


        ----------------------------------------
        -- CRM: crm_prd_info
        ----------------------------------------
        PRINT '>> truncating table : bronze.crm_prd_info';

        SET @start_time = GETDATE();
        TRUNCATE TABLE bronze.crm_prd_info;

        PRINT '>> inserting data into : bronze.crm_prd_info';

        BULK INSERT bronze.crm_prd_info
        FROM 'C:\Users\salma\AppData\Local\Temp\fa39a4f4-13a0-4d7b-8878-4bd2723cafe9_f78e076e5b83435d84c6b6af75d8a679.zip.fe9\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

        SET @end_time = GETDATE();
        PRINT 'load duration ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        SELECT COUNT(*) FROM bronze.crm_prd_info;


        ----------------------------------------
        -- CRM: crm_sales_details
        ----------------------------------------
        PRINT '>> truncating table : bronze.crm_sales_details';

        SET @start_time = GETDATE();
        TRUNCATE TABLE bronze.crm_sales_details;

        PRINT '>> inserting data into : bronze.crm_sales_details';

        BULK INSERT bronze.crm_sales_details
        FROM 'C:\Users\salma\AppData\Local\Temp\de868c78-7c41-4370-bba2-1f71662be6b0_f78e076e5b83435d84c6b6af75d8a679.zip.6b0\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

        SET @end_time = GETDATE();
        PRINT 'load duration ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        SELECT COUNT(*) FROM bronze.crm_sales_details;


        PRINT 'loading erp tables';


        ----------------------------------------
        -- ERP: erp_cust_az12
        ----------------------------------------
        PRINT '>> truncating table : bronze.erp_cust_az12';

        SET @start_time = GETDATE();
        TRUNCATE TABLE bronze.erp_cust_az12;

        PRINT '>> inserting data into : bronze.erp_cust_az12';

        BULK INSERT bronze.erp_cust_az12
        FROM 'C:\Users\salma\AppData\Local\Temp\d6d08006-299e-4568-92c5-10b8c3de39a6_f78e076e5b83435d84c6b6af75d8a679.zip.9a6\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

        SET @end_time = GETDATE();
        PRINT 'load duration ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        SELECT COUNT(*) FROM bronze.erp_cust_az12;


        ----------------------------------------
        -- ERP: erp_loc_a101
        ----------------------------------------
        PRINT '>> truncating table : bronze.erp_loc_a101';

        SET @start_time = GETDATE();
        TRUNCATE TABLE bronze.erp_loc_a101;

        PRINT '>> inserting data into : bronze.erp_loc_a101';

        BULK INSERT bronze.erp_loc_a101
        FROM 'C:\Users\salma\AppData\Local\Temp\f7ba9f27-ffdb-49c4-b65e-4ce2a7548a50_f78e076e5b83435d84c6b6af75d8a679.zip.a50\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

        SET @end_time = GETDATE();
        PRINT 'load duration ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        SELECT COUNT(*) FROM bronze.erp_loc_a101;


        ----------------------------------------
        -- ERP: erp_px_cat_g1v2
        ----------------------------------------
        PRINT '>> truncating table : bronze.erp_px_cat_g1v2';

        SET @start_time = GETDATE();
        TRUNCATE TABLE bronze.erp_px_cat_g1v2;

        PRINT '>> inserting data into : bronze.erp_px_cat_g1v2';

        BULK INSERT bronze.erp_px_cat_g1v2
        FROM 'C:\Users\salma\AppData\Local\Temp\919c7d26-9205-4c9e-a066-3a42eff8e916_f78e076e5b83435d84c6b6af75d8a679.zip.916\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

        SET @end_time = GETDATE();
        PRINT 'load duration ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        SELECT COUNT(*) FROM bronze.erp_px_cat_g1v2;


        ----------------------------------------
        -- Batch Time
        ----------------------------------------
        SET @end_all_time = GETDATE();

        PRINT '--------------------------------';
        PRINT 'batch time : ' + CAST(DATEDIFF(SECOND, @start_all_time, @end_all_time) AS NVARCHAR) + ' seconds';
        PRINT '--------------------------------';

    END TRY

    BEGIN CATCH
        PRINT '==================================';
        PRINT 'error occurred during loading bronze layer';
        PRINT 'error message: ' + ERROR_MESSAGE();
        PRINT 'error number : ' + CAST(ERROR_NUMBER() AS NVARCHAR);
        PRINT '==================================';
    END CATCH;
END;

EXEC bronze.load_bronze;
