IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'jim')
BEGIN
EXEC('CREATE SCHEMA jim')
END
