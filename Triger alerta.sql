CREATE TRIGGER t_Cambios 
ON Production.ProductCategory
AFTER INSERT, UPDATE, DELETE 
AS 
   RAISERROR (50005, -- Message id.
           10, -- Severity,
           1, -- State,
           N'abcde'); -- First argument supplies the string.
-- The message text returned is: <<    abc>>.
   EXEC msdb.dbo.sp_send_dbmail 
                        @profile_name = 'Cairo Rocha', 
                        @recipients = 'williamjsg@gmail.com' , 
                        @body = 'Hay cambios en la Base de Datos AdventureWorks2019', 
                        @subject = 'Hubo cambios en la tabla de ProductCategory' 

GO


