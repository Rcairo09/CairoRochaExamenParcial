sp_configure 'show advanced options', 1;
GO
RECONFIGURE;
GO

sp_configure 'Database Mail XPs', 1;
GO
RECONFIGURE
GO

-- Creando perfil de database mail 
EXECUTE msdb.dbo.sysmail_add_profile_sp  
    @profile_name = 'Cairo Rocha',  
    @description = 'Administrador base de datos' ;  
GO

-- Acceso al perfil  
EXECUTE msdb.dbo.sysmail_add_principalprofile_sp  
    @profile_name = 'Cairo Rocha',  
    @principal_name = 'public',  
    @is_default = 1 ;
GO

EXECUTE msdb.dbo.sysmail_add_account_sp  
    @account_name = 'Cairo Rocha',  
    @description = 'Configuracion de Correo',  
    @email_address = 'cairor22@outlook.com',  
    @display_name = 'Administrador',  
    @mailserver_name = 'smtp-mail.outlook.com',
    @port = 587,
    @enable_ssl = 1,
    @username = 'cairor22@outlook.com',
    @password = 'Rcairo091208' ;  
GO

-- Añadiendo cuenta al perfil  
EXECUTE msdb.dbo.sysmail_add_profileaccount_sp  
    @profile_name = 'Cairo Rocha',  
    @account_name = 'Cairo Rocha',  
    @sequence_number =1 ;  
GO


EXEC msdb.dbo.sp_send_dbmail
     @profile_name = 'Cairo Rocha',
     @recipients = 'cairor22@gmail.com',
     @body = 'Enviando correo de prueba',
     @subject = 'Probando configuracion database mail';
GO

SELECT * FROM msdb.dbo.sysmail_event_log;


