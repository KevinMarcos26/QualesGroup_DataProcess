------ Script de Creaci�n de Tablas DIM y FACT ------

CREATE PROCEDURE CreateOrDropTablesDIM
AS
BEGIN
SET NOCOUNT ON;



	IF OBJECT_ID('DW_COMERCIAL.[dbo].[DIM_CATEGORIA]', 'U') IS NOT  NULL
        TRUNCATE TABLE DW_COMERCIAL.[dbo].[DIM_CATEGORIA];
    
    IF OBJECT_ID('DW_COMERCIAL.[dbo].[DIM_CLIENTE]', 'U') IS NOT NULL
        TRUNCATE TABLE DW_COMERCIAL.[dbo].[DIM_CLIENTE];
    
    IF OBJECT_ID('DW_COMERCIAL.[dbo].[DIM_PAIS]', 'U') IS NOT  NULL
        TRUNCATE TABLE DW_COMERCIAL.[dbo].[DIM_PAIS];
    
    IF OBJECT_ID('DW_COMERCIAL.[dbo].[DIM_PRODUCTO]', 'U') IS NOT  NULL
        TRUNCATE TABLE DW_COMERCIAL.[dbo].[DIM_PRODUCTO];
    
    IF OBJECT_ID('DW_COMERCIAL.[dbo].[DIM_SUCURSAL]', 'U') IS NOT  NULL
        TRUNCATE TABLE DW_COMERCIAL.[dbo].[DIM_SUCURSAL];
    
    IF OBJECT_ID('DW_COMERCIAL.[dbo].[DIM_VENDEDOR]', 'U') IS NOT  NULL
        TRUNCATE TABLE DW_COMERCIAL.[dbo].[DIM_VENDEDOR];

	IF OBJECT_ID('DW_COMERCIAL.[dbo].[DIM_TIEMPO]', 'U') IS  NOT NULL
       TRUNCATE TABLE DW_COMERCIAL.[dbo].[DIM_TIEMPO];
    
    IF OBJECT_ID('DW_COMERCIAL.[dbo].[FACT_VENTAS]', 'U') IS  NOT NULL
        TRUNCATE TABLE DW_COMERCIAL.[dbo].[FACT_VENTAS];


    CREATE TABLE DW_COMERCIAL.[dbo].DIM_PRODUCTO (
  PRODUCTO_KEY Integer identity(1,1) PRIMARY KEY NOT NULL,
  COD_PRODUCTO Varchar(500)NOT NULL,
  DESC_PRODUCTO Varchar(500)NOT NULL,
  FECHA_ALTA Datetime NOT NULL,
  USUARIO_ALTA Varchar(500)  NULL,
  FECHA_UPDATE Datetime NOT  NULL,
  USUARIO_UPDATE Varchar(500)  NULL );
    
    CREATE TABLE DW_COMERCIAL.[dbo].DIM_CATEGORIA (
  CATEGORIA_KEY Integer identity(1,1) PRIMARY KEY NOT NULL,
  COD_CATEGORIA Varchar(500)NOT NULL,
  DESC_CATEGORIA Varchar(500)NOT NULL,
  FECHA_ALTA Datetime NOT NULL,
  USUARIO_ALTA Varchar(500)  NULL,
  FECHA_UPDATE Datetime NOT NULL,
  USUARIO_UPDATE Varchar(500)  NULL );

	CREATE TABLE DW_COMERCIAL.[dbo].DIM_CLIENTE (
  CLIENTE_KEY Integer identity(1,1) PRIMARY KEY NOT NULL,
  COD_CLIENTE Varchar(500)NOT NULL ,
  NOMBRE Varchar(500)NOT NULL ,
  APELLIDO Varchar(500)NOT NULL ,
  FECHA_ALTA Datetime   NOT NULL ,
  FECHA_UPDATE Datetime   NOT NULL ,
  USUARIO_ALTA Varchar(500) NULL ,
  USUARIO_UPDATE Varchar(500) NULL );

	CREATE TABLE DW_COMERCIAL.[dbo].DIM_PAIS (
  PAIS_KEY Integer identity(1,1) PRIMARY KEY NOT NULL,
  COD_PAIS Varchar(3)NOT NULL,
  DESC_PAIS Varchar(500)NOT NULL,
  FECHA_ALTA Datetime NOT NULL,
  USUARIO_ALTA Varchar(500)  NULL,
  FECHA_UPDATE Datetime  NOT NULL,
  USUARIO_UPDATE Varchar(500) NULL );
    
    CREATE TABLE DW_COMERCIAL.[dbo].DIM_VENDEDOR (
  VENDEDOR_KEY Integer identity(1,1) PRIMARY KEY NOT NULL,
  COD_VENDEDOR VARCHAR(500) NOT NULL,
  NOMBRE Varchar(500)NOT NULL,
  APELLIDO Varchar(500)NOT NULL,
  FECHA_ALTA Datetime NOT  NULL,
  USUARIO_ALTA Varchar(500) NULL,
  FECHA_UPDATE Datetime NOT NULL,
  USUARIO_UPDATE Varchar(500) NULL);
    
    CREATE TABLE DW_COMERCIAL.[dbo].DIM_SUCURSAL (
  SUCURSAL_KEY Integer identity(1,1) PRIMARY KEY NOT NULL,
  COD_SUCURSAL Varchar(500) NOT NULL,
  DESC_SUCURSAL Varchar(500) NOT NULL,
  FECHA_ALTA Datetime  NOT NULL,
  USUARIO_ALTA Varchar(500)  NULL,
  FECHA_UPDATE Datetime  NOT NULL,
  USUARIO_UPDATE Varchar(500)  NULL );

    CREATE TABLE DW_COMERCIAL.[dbo].DIM_TIEMPO (
  TIEMPO_KEY smalldatetime PRIMARY KEY NOT NULL,
  ANIO integer NOT NULL,
  MES_NRO integer NOT NULL,
  MES_NOMBRE varchar(15)NOT NULL,
  SEMESTRE integer NOT NULL,
  TRIMESTRE integer NOT NULL,
  SEMANA_ANIO integer NOT NULL,
  SEMANA_NRO_MES integer NOT NULL,
  DIA integer NOT NULL,
  DIA_NOMBRE varchar(20)NOT NULL,
  DIA_SEMANA_NRO integer NOT NULL,
  FECHA_ALTA Datetime NOT NULL,
  USUARIO_ALTA Varchar(500) NULL,
  FECHA_UPDATE Datetime NOT NULL,
  USUARIO_UPDATE Varchar(500) NULL );

	 CREATE TABLE DW_COMERCIAL.[dbo].FACT_VENTAS (
  PRODUCTO_KEY INT  NOT NULL,
  CATEGORIA_KEY INT   NOT NULL,
  CLIENTE_KEY INT   NOT NULL,
  PAIS_KEY INT   NOT NULL,
  VENDEDOR_KEY INT   NOT NULL,
  SUCURSAL_KEY INT   NOT NULL,
  TIEMPO_KEY smalldatetime NOT NULL,
  CANTIDAD_VENDIDA decimal(18,2) NOT NULL,
  MONTO_VENDIDO decimal(18,2) NOT NULL,
  PRECIO decimal(18,5) NOT NULL,
  COMISION_COMERCIAL decimal(18,2) NOT NULL,
  FECHA_ALTA Datetime NOT NULL,
  USUARIO_ALTA Varchar(500) NULL); 


END

EXECUTE CreateOrDropTablesDIM






















