----Stored Procedures de las cargas de Tablas Intermedias-----

CREATE PROCEDURE sp_carga_int_CATEGORIA AS
BEGIN
    -- Insertar datos en la tabla INT_DIM_CATEGORIA
    INSERT INTO [DW_COMERCIAL].[dbo].[INT_DIM_CATEGORIA]([COD_CATEGORIA], [DESC_CATEGORIA])
    SELECT [COD_CATEGORIA], [DESC_CATEGORIA]
    FROM [DW_COMERCIAL].[dbo].[STG_DIM_CATEGORIA];

END

-----------------------------------------------------------------------

CREATE PROCEDURE sp_carga_int_PRODUCTO AS
BEGIN
    -- Insertar datos en la tabla INT_DIM_PRODUCTO
    INSERT INTO [DW_COMERCIAL].[dbo].[INT_DIM_PRODUCTO]  ([COD_PRODUCTO], [DESC_PRODUCTO])
    SELECT [COD_PRODUCTO], [DESC_PRODUCTO]
    FROM [DW_COMERCIAL].[dbo].[STG_DIM_PRODUCTO];

END

-----------------------------------------------------------------------

CREATE PROCEDURE sp_carga_int_PAIS AS
BEGIN
    -- Insertar datos en la tabla INT_DIM_PAIS
    INSERT INTO[DW_COMERCIAL].[dbo].[INT_DIM_PAIS] ([COD_PAIS], [DESC_PAIS])
    SELECT [COD_PAIS], [DESC_PAIS]
    FROM [DW_COMERCIAL].[dbo].[STG_DIM_PAIS];

END

---------------------------------------------------------------------

CREATE PROCEDURE sp_carga_int_SUCURSAL AS
BEGIN
    -- Insertar datos en la tabla INT_DIM_SUCURSAL
    INSERT INTO [DW_COMERCIAL].[dbo].[INT_DIM_SUCURSAL]([COD_SUCURSAL], [DESC_SUCURSAL])
    SELECT [COD_SUCURSAL], [DESC_SUCURSAL]
    FROM [DW_COMERCIAL].[dbo].[STG_DIM_SUCURSAL];

END

------------------------------------------------------------------

CREATE PROCEDURE sp_carga_int_CLIENTE AS
BEGIN
    -- Insertar datos en la tabla INT_DIM_CLIENTE
    INSERT INTO INT_DIM_CLIENTE (COD_CLIENTE, NOMBRE, APELLIDO)
    SELECT COD_CLIENTE, 
           SUBSTRING(DESC_CLIENTE, 1, CHARINDEX(' ', DESC_CLIENTE) - 1) AS NOMBRE,
           SUBSTRING(DESC_CLIENTE, CHARINDEX(' ', DESC_CLIENTE) + 1, LEN(DESC_CLIENTE)) AS APELLIDO
    FROM STG_DIM_CLIENTE;

END

------------------------------------------------------------------------

CREATE PROCEDURE sp_carga_int_VENDEDOR AS
BEGIN
    -- Insertar datos en la tabla INT_DIM_CLIENTE
    INSERT INTO INT_DIM_VENDEDOR (COD_VENDEDOR, NOMBRE, APELLIDO)
    SELECT COD_VENDEDOR, 
           SUBSTRING(DESC_VENDEDOR, 1, CHARINDEX(' ', DESC_VENDEDOR) - 1) AS NOMBRE,
           SUBSTRING(DESC_VENDEDOR, CHARINDEX(' ', DESC_VENDEDOR) + 1, LEN(DESC_VENDEDOR)) AS APELLIDO
    FROM STG_DIM_VENDEDOR;

END

------------------------------------------------------------------------

CREATE PROCEDURE Sp_carga_int_FACT_VENTA AS
BEGIN
    -- Insertar datos desde STG_FACT_VENTAS a INT_FACT_VENTAS
    INSERT INTO [DW_COMERCIAL].[dbo].[INT_FACT_VENTAS] ([COD_PRODUCTO]
      ,[COD_CATEGORIA]
      ,[COD_CLIENTE]
      ,[COD_PAIS]
      ,[COD_VENDEDOR]
      ,[COD_SUCURSAL]
      ,[Fecha]
      ,[CANTIDAD_VENDIDA]
      ,[MONTO_VENDIDO]
      ,[PRECIO]
      ,[COMISION_COMERCIAL])
    SELECT [COD_PRODUCTO]
      ,[COD_CATEGORIA]
      ,[COD_CLIENTE]
      ,[COD_PAIS]
      ,[COD_VENDEDOR]
      ,[COD_SUCURSAL]
      ,CONVERT(smalldatetime, Fecha,103)
      ,CAST (Cantidad_Vendida as decimal(18,2))
      ,CAST (Monto_Vendido as decimal(18,2)) 
      ,CAST (Precio as decimal(18,5))
      ,CAST (Comision_Comercial as decimal(18,2)) 
    FROM [DW_COMERCIAL].[dbo].[STG_FACT_VENTAS] ;
END


---- Procedure para ejecutar todos los procedures creados para las tablas INT ----

CREATE PROCEDURE OuterProcedure
AS
BEGIN
    SET NOCOUNT ON;

	execute sp_carga_int_CATEGORIA;

	execute sp_carga_int_PRODUCTO;

	execute sp_carga_int_SUCURSAL;

	execute sp_carga_int_PAIS;

	execute sp_carga_int_CLIENTE;

	execute sp_carga_int_VENDEDOR;

	execute Sp_carga_int_FACT_VENTA;

END

EXECUTE OuterProcedure






