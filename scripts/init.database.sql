--use master database;
use master;
GO

--create datawarehouse database;
CREATE DATABASE DataWarehouse;
GO

--use datawarehouse database;
use DataWarehouse;
GO
--creare schemas;
CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO
