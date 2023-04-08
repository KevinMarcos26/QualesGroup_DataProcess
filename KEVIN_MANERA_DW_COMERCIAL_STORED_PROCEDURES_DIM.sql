-------- Stored Procedures de las cargas de Tablas de DIM y FACT ventas -----

----- 1)  Stored Procedure - Genera Dim Producto--- 

CREATE PROCEDURE sp_carga_dim_PRODUCTO
AS
BEGIN
    
    -- Insertar datos en la tabla DIM_PRODUCTO
    
	INSERT INTO [DW_COMERCIAL].[dbo].[DIM_PRODUCTO] (COD_PRODUCTO,DESC_PRODUCTO)
	SELECT COD_PRODUCTO,DESC_PRODUCTO
    FROM [DW_COMERCIAL].[dbo].[INT_DIM_PRODUCTO]
END

------------------------------------------------------

----- 2)  Stored Procedure - Genera Dim Categoria---

CREATE PROCEDURE sp_carga_dim_CATEGORIA
AS
BEGIN
    -- Insertar datos en la tabla DIM_CATEGORIA
    INSERT INTO [DW_COMERCIAL].[dbo].[DIM_CATEGORIA] (COD_CATEGORIA,DESC_CATEGORIA)
    SELECT COD_CATEGORIA, DESC_CATEGORIA
    FROM [DW_COMERCIAL].[dbo].[INT_DIM_CATEGORIA]

END

------------------------------------------------------

----- 3) Stored Procedure - Genera Dim CLIENTE--- 

CREATE PROCEDURE sp_carga_dim_CLIENTE
AS
BEGIN
    -- Insertar datos en la tabla DIM_CLIENTE
    INSERT INTO [DW_COMERCIAL].[dbo].[DIM_CLIENTE] (COD_CLIENTE,NOMBRE,APELLIDO)
    SELECT COD_CLIENTE,NOMBRE,APELLIDO
    FROM [DW_COMERCIAL].[dbo].[INT_DIM_CLIENTE]

END

----------------------------------------------------

----- 4) Stored Procedure - Genera Dim PAIS--- 

CREATE PROCEDURE sp_carga_dim_PAIS
AS
BEGIN
    -- Insertar datos en la tabla DIM_PAIS
    INSERT INTO [DW_COMERCIAL].[dbo].[DIM_PAIS] (COD_PAIS,DESC_PAIS)
    SELECT COD_PAIS,DESC_PAIS
    FROM [DW_COMERCIAL].[dbo].[INT_DIM_PAIS]

END

----- 5) Stored Procedure - Genera Dim SUCURSAL--- 

CREATE PROCEDURE sp_carga_dim_SUCURSAL
AS
BEGIN
    -- Insertar datos en la tabla DIM_SUCURSAL
    INSERT INTO [DW_COMERCIAL].[dbo].[DIM_SUCURSAL] (COD_SUCURSAL,DESC_SUCURSAL)
    SELECT COD_SUCURSAL,DESC_SUCURSAL
    FROM [DW_COMERCIAL].[dbo].[INT_DIM_SUCURSAL]

END

----- 6) Stored Procedure - Genera Dim VENDEDOR--- 

CREATE PROCEDURE sp_carga_dim_VENDEDOR
AS
BEGIN
    -- Insertar datos en la tabla DIM_VENDEDOR
    INSERT INTO [DW_COMERCIAL].[dbo].[DIM_VENDEDOR] (COD_VENDEDOR,NOMBRE,APELLIDO)

    SELECT COD_VENDEDOR,NOMBRE,APELLIDO
    FROM [DW_COMERCIAL].[dbo].[INT_DIM_VENDEDOR]

END

----- 7) Stored Procedure - Genera Dim TIEMPO--- 

CREATE PROCEDURE sp_Carga_dim_TIEMPO
@anio Int
As
SET NOCOUNT ON
SET arithabort off
SET arithignore on

/**************/
/* Variables */
/**************/

SET DATEFIRST 1;
SET DATEFORMAT mdy
DECLARE @dia smallint
DECLARE @mes smallint
DECLARE @f_txt varchar(10)
DECLARE @fecha smalldatetime
DECLARE @key int

DECLARE @vacio smallint
DECLARE @fin smallint
DECLARE @fin_mes int
DECLARE @anioperiodicidad int

SELECT @dia = 1
SELECT @mes = 1
SELECT @f_txt = Convert(char(2), @mes) + '/' + Convert(char(2), @dia) + '/' + Convert(char(4), @anio)
SELECT @fecha = Convert(smalldatetime, @f_txt)
select @anioperiodicidad = @anio



/*************************/
/* Se inserta d¡a a d¡a */
/* hasta terminar el a¤o */
/*************************/

SELECT @fin = @anio + 1
WHILE (@anio < @fin)
BEGIN
--Armo la fecha
IF Len(Rtrim(Convert(Char(2),Datepart(mm, @fecha))))=1
BEGIN
IF Len(Rtrim(Convert(Char(2),Datepart(dd, @fecha))))=1
SET @f_txt = Convert(char(4),Datepart(yyyy, @fecha)) + '0' +

Rtrim(Convert(Char(2),Datepart(mm, @fecha))) + '0' + Rtrim(Convert(Char(2),Datepart(dd, @fecha)))
ELSE
SET @f_txt = Convert(char(4),Datepart(yyyy, @fecha)) + '0' +

Rtrim(Convert(Char(2),Datepart(mm, @fecha))) + Convert(Char(2),Datepart(dd, @fecha))
END
ELSE
BEGIN
IF Len(Rtrim(Convert(Char(2),Datepart(dd, @fecha))))=1
SET @f_txt = Convert(char(4),Datepart(yyyy, @fecha)) + Convert(Char(2),Datepart(mm,

@fecha)) + '0' + Rtrim(Convert(Char(2),Datepart(dd, @fecha)))
ELSE
SET @f_txt = Convert(char(4),Datepart(yyyy, @fecha)) + Convert(Char(2),Datepart(mm,

@fecha)) + Convert(Char(2),Datepart(dd, @fecha))

END
--Calculo el último día del mes
SET @fin_mes = day(dateadd(d, -1, dateadd(m, 1, dateadd(d, - day(@fecha) + 1, @fecha))))

INSERT [DW_COMERCIAL].[dbo].DIM_TIEMPO (Tiempo_Key, Anio, MES_NRO, Mes_Nombre, Semestre, Trimestre, Semana_Anio ,Semana_Nro_Mes, Dia, Dia_Nombre, Dia_Semana_Nro)

SELECT
tiempo_key = @fecha
, anio = Datepart(yyyy, @fecha)
, mes = Datepart(mm, @fecha)
--, mes_nombre = Datename(mm, @fecha)
, mes_nombre = CASE Datename(mm, @fecha)
when 'January' then 'Enero'
when 'February' then 'Febrero'
when 'March' then 'Marzo'
when 'April' then 'Abril'
when 'May' then 'Mayo'
when 'June' then 'Junio'
when 'July' then 'Julio'
when 'August' then 'Agosto'
when 'September' then 'Septiembre'
when 'October' then 'Octubre'
when 'November' then 'Noviembre'
when 'December' then 'Diciembre'

else Datename(mm, @fecha)
END

, semestre = CASE Datepart(mm, @fecha)
when (SELECT Datepart(mm, @fecha)

WHERE Datepart(mm, @fecha) between 1 and 6) then 1

else 2
END

, trimestre = Datepart(qq, @fecha)
, semana_anio = Datepart(wk, @fecha)
, semana_nro_mes = Datepart(wk, @fecha) - datepart(week,
dateadd(dd,-day(@fecha)+1,@fecha)) +1
, dia = Datepart(dd, @fecha)
, dia_nombre = CASE Datename(dw, @fecha)
when 'Monday' then 'Lunes'
when 'Tuesday' then 'Martes'
when 'Wednesday' then 'Miercoles'
when 'Thursday' then 'Jueves'
when 'Friday' then 'Viernes'
when 'Saturday' then 'Sabado'
when 'Sunday' then 'Domingo'
else Datename(dw, @fecha)
END
--, dia_nombre = Datename(dw, @fecha)
, dia_semana_nro = Datepart(dw, @fecha)

SELECT @fecha = Dateadd(dd, 1, @fecha)

SELECT @dia = Datepart(dd, @fecha)
SELECT @mes = Datepart(mm, @fecha)
SELECT @anio = Datepart(yy, @fecha) CONTINUE

END


----- 8) Stored Procedure - Genera FACT VENTAS---
 
CREATE PROCEDURE sp_carga_FACT_VENTAS

@FechaDesde smalldatetime,
@FechaHasta smalldatetime

AS
BEGIN

	DELETE FROM [DW_COMERCIAL].[dbo].FACT_VENTAS
	where TIEMPO_KEY between @FechaDesde and @FechaHasta 

-- INSERTO NUEVOS REGISTROS
	INSERT INTO [DW_COMERCIAL].[dbo].FACT_VENTAS(
	   [PRODUCTO_KEY]
      ,[CATEGORIA_KEY]
      ,[CLIENTE_KEY]
      ,[PAIS_KEY]
      ,[VENDEDOR_KEY]
      ,[SUCURSAL_KEY]
      ,[TIEMPO_KEY]
      ,[CANTIDAD_VENDIDA]
      ,[MONTO_VENDIDO]
      ,[PRECIO]
      ,[COMISION_COMERCIAL]
	  )
	SELECT
	p.PAIS_KEY as PAIS_KEY   ,
	vend.VENDEDOR_KEY as VENDEDOR_KEY   ,
	clie.CLIENTE_KEY  as CLIENTE_KEY ,
	seg.CATEGORIA_KEY as CATEGORIA_KEY ,
	prod.PRODUCTO_KEY as PRODUCTO_KEY ,
	bd.SUCURSAL_KEY  as SUCURSAL_KEY ,
	tie.TIEMPO_KEY as TIEMPO_KEY  ,
    [CANTIDAD_VENDIDA],
	[MONTO_VENDIDO],
	[PRECIO],
	[COMISION_COMERCIAL]

FROM [DW_COMERCIAL].[dbo].[INT_FACT_VENTAS] i

 left Join [DW_COMERCIAL].[dbo].[DIM_VENDEDOR] vend on i.COD_VENDEDOR = vend.COD_VENDEDOR
 left Join [DW_COMERCIAL].[dbo].[DIM_CLIENTE] clie on i.[COD_CLIENTE] = clie.COD_CLIENTE
 left Join [DW_COMERCIAL].[dbo].[DIM_PRODUCTO] prod on i.[COD_PRODUCTO] = prod.COD_PRODUCTO
 left Join [DW_COMERCIAL].[dbo].DIM_CATEGORIA seg on i.[COD_CATEGORIA] = seg.COD_CATEGORIA
 left Join [DW_COMERCIAL].[dbo].Dim_Pais p on i.[COD_PAIS] = p.COD_PAIS
 left  Join [DW_COMERCIAL].[dbo].DIM_SUCURSAL bd on i.COD_SUCURSAL = bd.COD_SUCURSAL
 left join [DW_COMERCIAL].[dbo].Dim_Tiempo tie on i.Fecha = tie.TIEMPO_KEY

where i.Fecha between @FechaDesde and @FechaHasta

ALTER TABLE [DW_COMERCIAL].[dbo].[FACT_VENTAS] ADD CONSTRAINT fk_PRODUCTO FOREIGN KEY (PRODUCTO_KEY) REFERENCES DIM_PRODUCTO(PRODUCTO_KEY)
ALTER TABLE [DW_COMERCIAL].[dbo].[FACT_VENTAS] ADD CONSTRAINT fk_CLIENTE FOREIGN KEY (CLIENTE_KEY) REFERENCES DIM_CLIENTE(CLIENTE_KEY)
ALTER TABLE [DW_COMERCIAL].[dbo].[FACT_VENTAS] ADD CONSTRAINT fk_PAIS FOREIGN KEY (PAIS_KEY) REFERENCES DIM_PAIS(PAIS_KEY)
ALTER TABLE [DW_COMERCIAL].[dbo].[FACT_VENTAS] ADD CONSTRAINT fk_SUCURSAL FOREIGN KEY (SUCURSAL_KEY) REFERENCES DIM_SUCURSAL(SUCURSAL_KEY)
ALTER TABLE [DW_COMERCIAL].[dbo].[FACT_VENTAS] ADD CONSTRAINT fk_TIEMPO FOREIGN KEY (TIEMPO_KEY) REFERENCES DIM_TIEMPO(TIEMPO_KEY)
ALTER TABLE [DW_COMERCIAL].[dbo].[FACT_VENTAS] ADD CONSTRAINT fk_VENDEDOR FOREIGN KEY (VENDEDOR_KEY) REFERENCES DIM_VENDEDOR(VENDEDOR_KEY)
	
END
 TRUNCATE TABLE [DW_COMERCIAL].[dbo].[DIM_CATEGORIA]

---- Procedure para ejecutar todos los procedures creados para las tablas DIM Y FACT ----

CREATE PROCEDURE OuterProcedureDIM
AS
BEGIN
    SET NOCOUNT ON;

	execute sp_carga_dim_PRODUCTO;

	execute sp_carga_dim_CATEGORIA; 

	execute sp_carga_dim_CLIENTE; 

	execute sp_carga_dim_PAIS; 

	execute sp_carga_dim_SUCURSAL; 

	execute sp_carga_dim_VENDEDOR;

    execute sp_Carga_dim_TIEMPO 2015;
	
	execute sp_Carga_dim_TIEMPO 2016

	execute sp_Carga_dim_TIEMPO 2017;

	execute sp_Carga_dim_TIEMPO 2018;

	execute sp_Carga_dim_TIEMPO 2019;

	execute sp_Carga_dim_TIEMPO 2020;

	execute sp_Carga_dim_TIEMPO 2021;

	execute sp_Carga_dim_TIEMPO 2022;

	Execute sp_carga_FACT_VENTAS "2015","2023";

END



EXECUTE OuterProcedureDIM

