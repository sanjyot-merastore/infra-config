USE [master]
GO

-- Function to Create Database and User
DECLARE @Databases TABLE (DbName NVARCHAR(50), UserName NVARCHAR(50), Password NVARCHAR(50));

INSERT INTO @Databases (DbName, UserName, Password)
VALUES
    ('Products', 'mera-store-products', 'N8d!7q#bL3x@9Pz*'),
    ('Users', 'mera-store-users', 'C5v@3Fq*P8t$7Ns#'),
    ('Inventory', 'mera-store-inventory', 'G1b$6Rt!Z9s*8Kw@'),
    ('Cart', 'mera-store-cart', 'Y2h@4Kq*W7v!1Lp$'),
    ('Orders', 'mera-store-orders', 'F9j$2Nq@P4m*6Vz#'),
    ('Authentication', 'mera-store-authentication', 'S7g@8Bc#T5h*3Xd$'),
    ('Logging', 'mera-store-logging', 'J6k*9Pt@X2v#1Qc$'),
    ('Payment', 'mera-store-payment', 'Z3m@5Vp#T8y*2Nx$'),
    ('Notification', 'mera-store-notification', 'L9t@2Wp#Y4k*3Qv$'),
    ('Analytics', 'mera-store-analytics', 'P7g@3Qc#X6y*5Nt$'),
    ('Discount', 'mera-store-discount', 'D8j@4Np#Z2v*7Wq$'),
    ('FraudDetection', 'mera-store-fraud-detection', 'F5x@9Qv#T6y*2Lp$');

DECLARE @DbName NVARCHAR(50), @UserName NVARCHAR(50), @Password NVARCHAR(50);
DECLARE db_cursor CURSOR FOR 
SELECT DbName, UserName, Password FROM @Databases;

OPEN db_cursor
FETCH NEXT FROM db_cursor INTO @DbName, @UserName, @Password;

WHILE @@FETCH_STATUS = 0
BEGIN
    -- Create Database if Not Exists
    IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = @DbName)
    BEGIN
        EXEC('CREATE DATABASE [' + @DbName + ']');
        PRINT '✅ Created Database: ' + @DbName;
    END

    -- Create Login
    IF NOT EXISTS (SELECT * FROM sys.sql_logins WHERE name = @UserName)
    BEGIN
        EXEC('CREATE LOGIN [' + @UserName + '] WITH PASSWORD = ''' + @Password + '''');
        PRINT '🔐 Created Login for: ' + @UserName;
    END

    -- Use Database Context
    EXEC('USE [' + @DbName + '];');

    -- Create User
    IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = @UserName)
    BEGIN
        EXEC('USE [' + @DbName + ']; CREATE USER [' + @UserName + '] FOR LOGIN [' + @UserName + ']');
        PRINT '👤 Created User for: ' + @DbName;
    END

    -- Assign db_owner Role
    EXEC('USE [' + @DbName + ']; ALTER ROLE db_owner ADD MEMBER [' + @UserName + ']');
    PRINT '🎯 Assigned db_owner to: ' + @UserName;

    FETCH NEXT FROM db_cursor INTO @DbName, @UserName, @Password;
END

CLOSE db_cursor;
DEALLOCATE db_cursor;

PRINT '🎉 All databases and users have been created successfully!';
GO
