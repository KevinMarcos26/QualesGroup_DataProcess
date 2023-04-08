---DW_COMERCIAL_SCRIPT_VALIDACIONES_STG---

SELECT TOP (12000) [COD_PRODUCTO]
      ,[COD_CATEGORIA]
      ,[COD_CLIENTE]
      ,[COD_PAIS]
      ,[COD_VENDEDOR]
      ,[COD_SUCURSAL]
      ,[Fecha]
      ,[Cantidad_Vendida]
      ,[Monto_Vendido]
      ,[Precio]
      ,[Comision_Comercial]
  FROM [DW_COMERCIAL].[dbo].[STG_FACT_VENTAS]


SELECT * FROM [DW_COMERCIAL].[dbo].[STG_DIM_VENDEDOR]

SELECT * FROM [DW_COMERCIAL].[dbo].[STG_DIM_SUCURSAL]

SELECT * FROM [DW_COMERCIAL].[dbo].[STG_DIM_PRODUCTO]

SELECT * FROM [DW_COMERCIAL].[dbo].[STG_DIM_PAIS]

SELECT * FROM [DW_COMERCIAL].[dbo].[STG_DIM_CLIENTE]

SELECT * FROM [DW_COMERCIAL].[dbo].[STG_DIM_CATEGORIA]

SELECT TOP (12000) [COD_PRODUCTO]
      ,[COD_CATEGORIA]
      ,[COD_CLIENTE]
      ,[COD_PAIS]
      ,[COD_VENDEDOR]
      ,[COD_SUCURSAL]
      ,[Fecha]
      ,[Cantidad_Vendida]
      ,[Monto_Vendido]
      ,[Precio]
      ,[Comision_Comercial]
  FROM [DW_COMERCIAL].[dbo].[INT_FACT_VENTAS]

  SELECT  * FROM [DW_COMERCIAL].[dbo].[FACT_VENTAS] ORDER BY TIEMPO_KEY ASC