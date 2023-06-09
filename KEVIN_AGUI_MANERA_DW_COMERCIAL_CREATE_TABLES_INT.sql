---- Script de Creaci�n de Tablas INT ----

CREATE PROCEDURE CreateOrDropTables
AS
BEGIN
    SET NOCOUNT ON;

	IF OBJECT_ID('DW_COMERCIAL.[dbo].STG_FACT_VENTAS', 'U') IS NOT NULL
        DROP TABLE DW_COMERCIAL.[dbo].[STG_FACT_VENTAS];

	IF OBJECT_ID('DW_COMERCIAL.[dbo].[INT_DIM_CATEGORIA]', 'U') IS NOT NULL
        DROP TABLE DW_COMERCIAL.[dbo].[INT_DIM_CATEGORIA];
    
    IF OBJECT_ID('DW_COMERCIAL.[dbo].[INT_DIM_CLIENTE]', 'U') IS NOT NULL
        DROP TABLE DW_COMERCIAL.[dbo].[INT_DIM_CLIENTE];
    
    IF OBJECT_ID('DW_COMERCIAL.[dbo].[INT_DIM_PAIS]', 'U') IS NOT NULL
        DROP TABLE DW_COMERCIAL.[dbo].[INT_DIM_PAIS];
    
    IF OBJECT_ID('DW_COMERCIAL.[dbo].[INT_DIM_PRODUCTO]', 'U') IS NOT NULL
        DROP TABLE DW_COMERCIAL.[dbo].[INT_DIM_PRODUCTO];
    
    IF OBJECT_ID('DW_COMERCIAL.[dbo].[INT_DIM_SUCURSAL]', 'U') IS NOT NULL
        DROP TABLE DW_COMERCIAL.[dbo].[INT_DIM_SUCURSAL];
    
    IF OBJECT_ID('DW_COMERCIAL.[dbo].[INT_DIM_VENDEDOR]', 'U') IS NOT NULL
        DROP TABLE DW_COMERCIAL.[dbo].[INT_DIM_VENDEDOR];
    
    IF OBJECT_ID('DW_COMERCIAL.[dbo].[INT_FACT_VENTAS]', 'U') IS NOT NULL
        DROP TABLE DW_COMERCIAL.[dbo].[INT_FACT_VENTAS];

    CREATE TABLE DW_COMERCIAL.[dbo].INT_DIM_PRODUCTO (
    COD_PRODUCTO VARCHAR(500) NOT NULL,
    DESC_PRODUCTO VARCHAR(500) NOT NULL);
    
    CREATE TABLE DW_COMERCIAL.[dbo].INT_DIM_CATEGORIA (
    COD_CATEGORIA VARCHAR(500) NOT NULL,
    DESC_CATEGORIA VARCHAR(500) NOT NULL );

	CREATE TABLE DW_COMERCIAL.[dbo].INT_DIM_CLIENTE (
    COD_CLIENTE Varchar(500) NOT NULL,
    NOMBRE Varchar(500) NOT NULL,
    APELLIDO Varchar(500)NOT NULL);

	CREATE TABLE DW_COMERCIAL.[dbo].INT_DIM_PAIS (
    COD_PAIS Varchar(3) NOT NULL,
    DESC_PAIS Varchar(500) NOT NULL);
    
    CREATE TABLE DW_COMERCIAL.[dbo].INT_DIM_VENDEDOR (
     COD_VENDEDOR Varchar(500) NOT NULL,
     NOMBRE Varchar(500) NOT NULL,
     APELLIDO Varchar(500) NOT NULL);
    
    CREATE TABLE DW_COMERCIAL.[dbo].INT_DIM_SUCURSAL (
     COD_SUCURSAL Varchar(500) NOT NULL,
     DESC_SUCURSAL Varchar(500) NOT NULL);

	 CREATE TABLE DW_COMERCIAL.[dbo].INT_FACT_VENTAS (
  COD_PRODUCTO Varchar(100) NOT NULL,
  COD_CATEGORIA Varchar(100)NOT NULL,
  COD_CLIENTE Varchar(100)NOT NULL,
  COD_PAIS Varchar(100)NOT NULL,
  COD_VENDEDOR Varchar(100)NOT NULL,
  COD_SUCURSAL Varchar(100)NOT NULL,
  Fecha smalldatetime NOT NULL,
  CANTIDAD_VENDIDA decimal(18,2)NOT NULL,
  MONTO_VENDIDO decimal(18,2)NOT NULL,
  PRECIO decimal(18,5)NOT NULL,
  COMISION_COMERCIAL decimal(18,2)NOT NULL) ;

END

EXECUTE  CreateOrDropTables 











