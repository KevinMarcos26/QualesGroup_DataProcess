---Script de Inserts Iniciales de las tablas pero se terminan haciendo con Stored Prodecures---

INSERT INTO [DW_COMERCIAL].[dbo].[INT_DIM_CATEGORIA] 
([COD_CATEGORIA], [DESC_CATEGORIA])
SELECT [COD_CATEGORIA], [DESC_CATEGORIA]
FROM [DW_COMERCIAL].[dbo].[STG_DIM_CATEGORIA]

INSERT INTO [DW_COMERCIAL].[dbo].[INT_DIM_PRODUCTO] 
([COD_PRODUCTO], [DESC_PRODUCTO])
SELECT [COD_PRODUCTO], [DESC_PRODUCTO]
FROM [DW_COMERCIAL].[dbo].[STG_DIM_PRODUCTO]

INSERT INTO [DW_COMERCIAL].[dbo].[INT_DIM_PAIS] 
([COD_PAIS], [DESC_PAIS])
SELECT [COD_PAIS], [DESC_PAIS]
FROM [DW_COMERCIAL].[dbo].[STG_DIM_PAIS]

INSERT INTO [DW_COMERCIAL].[dbo].[INT_DIM_SUCURSAL] 
([COD_SUCURSAL], [DESC_SUCURSAL])
SELECT [COD_SUCURSAL], [DESC_SUCURSAL]
FROM [DW_COMERCIAL].[dbo].[STG_DIM_SUCURSAL]






