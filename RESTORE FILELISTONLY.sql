RESTORE FILELISTONLY
FROM DISK = '/var/opt/mssql/backups/AdventureWorks2025.bak'


RESTORE DATABASE AdventureWorks2025
FROM DISK = '/var/opt/mssql/backups/AdventureWorks2025.bak'
WITH
    MOVE 'AdventureWorks' TO '/var/opt/mssql/data/AdventureWorks2025.mdf',
    MOVE 'AdventureWorks_log' TO '/var/opt/mssql/data/AdventureWorks2025_log.ldf',
    STATS = 5,
    RECOVERY


USE AdventureWorks2025

SELECT TOP 10 * FROM Person.Address