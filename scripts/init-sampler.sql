CREATE DATABASE Sampler
GO
USE Sampler
GO
CREATE TABLE dbo.Samples
(
  ID int PRIMARY KEY NOT NULL,
  Name varchar(25) NOT NULL,
  Price money NULL,
  Description text NULL
)
GO
INSERT Samples (ID, Name, Price, Description)
VALUES (42, 'zero probe', .52, 'zero probe description')
GO
CREATE PROCEDURE pr_GetSample
AS
  BEGIN
    SELECT TOP 1 * FROM dbo.Samples    
  END
GO 