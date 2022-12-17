USE master
GO

--Crea el dispositivo de backups
EXEC sp_addumpdevice 'disk', 'AwDv_wsanchezg',
'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLSERVER2019\MSSQL\Backup\AwDv_wsanchezg.bak';
GO

--Mostrar los dispositivos de Backups
SELECT *
FROM sys.backup_devices
GO

--Procedimiento almacenado para crear backup
CREATE PROCEDURE usp_CrearBackup
AS
DECLARE @NombreBackup VARCHAR (100)
SET @NombreBackup = N'AwBk ' +  FORMAT (GETDATE(),'yyyyMMdd_hhmmss');
BACKUP DATABASE AdventureWorks2019
TO AwDv_wsanchezg
WITH NOFORMAT, NOINIT, NAME = @NombreBackup
GO

EXEC usp_CrearBackup
GO