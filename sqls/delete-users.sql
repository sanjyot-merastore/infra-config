USE [master];
GO

-- Drop Users and Logins
DECLARE @Databases TABLE (DbName NVARCHAR(50), UserName NVARCHAR(50));

INSERT INTO @Databases (DbName, UserName)
VALUES
    ('Products', 'mera-store-products'),
    ('Users', 'mera-store-users'),
    ('Inventory', 'mera-store-inventory'),
    ('Cart', 'mera-store-cart'),
    ('Orders', 'mera-store-orders'),
    ('Authentication', 'mera-store-authentication'),
    ('Logging', 'mera-store-logging'),
    ('Payment', 'mera-store-payment'),
    ('Notification', 'mera-store-notification'),
    ('Analytics', 'mera-store-analytics'),
    ('Discount', 'mera-store-discount'),
    ('FraudDetection', 'mera-store-fraud-detection');

DECLARE @DbName NVARCHAR(50), @UserName NVARCHAR(50);
DECLARE db_cursor CURSOR FOR 
SELECT DbName, UserName FROM @Databases;

OPEN db_cursor;
FETCH NEXT FROM db_cursor INTO @DbName, @UserName;

WHILE @@FETCH_STATUS = 0
BEGIN
    -- Drop User
    IF EXISTS (SELECT * FROM sys.sql_logins WHERE name = @UserName)
    BEGIN
        EXEC('USE [' + @DbName + '];
              IF EXISTS (SELECT * FROM sys.database_principals WHERE name = ''' + @UserName + ''')
              BEGIN
                  DROP USER [' + @UserName + '];
              END');
              
        EXEC('DROP LOGIN [' + @UserName + ']');
        PRINT '❌ Dropped User and Login: ' + @UserName;
    END
    
    FETCH NEXT FROM db_cursor INTO @DbName, @UserName;
END

CLOSE db_cursor;
DEALLOCATE db_cursor;

-- Drop Databases
DECLARE db_cursor CURSOR FOR 
SELECT DbName FROM @Databases;

OPEN db_cursor;
FETCH NEXT FROM db_cursor INTO @DbName;

WHILE @@FETCH_STATUS = 0
BEGIN
    IF EXISTS (SELECT * FROM sys.databases WHERE name = @DbName)
    BEGIN
        EXEC('DROP DATABASE [' + @DbName + ']');
        PRINT '❌ Dropped Database: ' + @DbName;
    END
    
    FETCH NEXT FROM db_cursor INTO @DbName;
END

CLOSE db_cursor;
DEALLOCATE db_cursor;

PRINT '✅ All databases and users have been successfully dropped!';
GO
