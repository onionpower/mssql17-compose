CREATE DATABASE Sampler
GO

USE Sampler
GO

CREATE TABLE dbo.Samples
(
  ID int PRIMARY KEY NOT NULL IDENTITY(1,1),
  Name varchar(25) NOT NULL,
  Price money NULL,
  Description text NULL
)
GO

INSERT Samples (Name, Price, Description)
VALUES ('zero probe', .52, 'zero probe description')
GO

CREATE PROCEDURE pr_GetSample
AS
  BEGIN
    SELECT TOP 1 * FROM dbo.Samples    
  END
GO

CREATE PROCEDURE pr_GetSamples
  @BatchSize int
AS
  BEGIN
    DECLARE @desc varchar(256) = 'desc', @price decimal = 100, @name varchar(256) = 'name';
    WITH
        t0(i) AS (SELECT 0 UNION ALL SELECT 0),
        t1(i) AS (SELECT 0 FROM t0 a, t0 b),
        t2(i) AS (SELECT 0 FROM t1 a, t1 b),
        t3(i) AS (SELECT 0 FROM t2 a, t2 b),
        n(i) AS (SELECT ROW_NUMBER() OVER(ORDER BY (SELECT 0)) FROM t3)
    SELECT i, @name as Name, @price as Price, @desc as Description FROM n WHERE i BETWEEN 1 AND @BatchSize
  END
GO

CREATE PROCEDURE pr_AddSample
  @Name varchar(25),
  @Price money = null,
  @Description text = null
AS
  BEGIN
  INSERT INTO 
    [Sampler].[dbo].[Samples] ([Name], [Price], [Description]) 
  VALUES 
    (@Name, @Price, @Description)
END
GO