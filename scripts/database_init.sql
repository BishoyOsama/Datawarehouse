DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM pg_database WHERE datname = 'datawarehouse'
    ) THEN
        RAISE NOTICE 'Database exists.';
    ELSE
        RAISE NOTICE 'Database does not exist.';
    END IF;
END $$;


CREATE DATABASE DataWarehouse;

CREATE SCHEMA bronze;
CREATE SCHEMA silver;
CREATE SCHEMA gold;
