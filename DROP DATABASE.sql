USE master
GO
ALTER DATABASE [dbname] SET single_user WITH ROLLBACK IMMEDIATE
GO
DROP DATABASE [dbname]
GO