----Simulación de ETL completo-----

--1)--- Creación de Tablas INT ----

EXECUTE  CreateOrDropTables 

--2) ---  Creación de Tablas DIM y FACT ------

EXECUTE CreateOrDropTablesDIM


---2.A --- Carga Manual de STG_FACT_VENTAS  ---- IMPORTANTE

select * from [dbo].[STG_FACT_VENTAS]


---3) ---  Alter de las tablas -------

EXECUTE AlterTables 

--4) -- Stored Procedure de las cargas de Tablas Intermedias-----

EXECUTE OuterProcedure

select * from [dbo].[INT_FACT_VENTAS]

--5)  --- Stored Procedures de las cargas de Tablas de DIM y FACT ventas -----

EXECUTE OuterProcedureDIM


select * from [dbo].[FACT_VENTAS]

/*Fin de simulación de ETL---------

