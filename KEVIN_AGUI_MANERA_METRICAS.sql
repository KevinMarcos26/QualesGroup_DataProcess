------ Métricas --------

----- 1) Monto Total de Ventas = 5122990000.00 ($)------------

SELECT SUM(MONTO_VENDIDO) AS MontoTotalVentas
FROM FACT_VENTAS;

---------- Se puede usar una Function ------------------

-- Crear la función--
CREATE FUNCTION CalcularMontoTotalVentas()
RETURNS DECIMAL(18, 2)
AS
BEGIN
    DECLARE @MontoTotal DECIMAL(18, 2)

    -- Calcular el monto total de ventas
    SELECT @MontoTotal = SUM(MONTO_VENDIDO)
    FROM FACT_VENTAS

    -- Retornar el monto total
    RETURN @MontoTotal
END

SELECT dbo.CalcularMontoTotalVentas()

-------- 2) Cantidad vendida = 306208.00 (#)--------

SELECT SUM(CANTIDAD_VENDIDA) AS CantidadTotalVendida
FROM FACT_VENTAS;

--- Funcion-----

-- Crear la función
CREATE FUNCTION dbo.CalcularCantidadTotalVendida()
RETURNS INT
AS
BEGIN
    DECLARE @CantidadTotal INT;

    SELECT @CantidadTotal = SUM(CANTIDAD_VENDIDA)
    FROM FACT_VENTAS;

    RETURN @CantidadTotal;
END;

SELECT dbo.CalcularCantidadTotalVendida()

----- 3)  Monto promedio de Ventas  = 427200.633755 ($) --------------

SELECT AVG(MONTO_VENDIDO) AS MontoPromedioVentas
FROM FACT_VENTAS;

--- Funcion----------

-- Crear la función
CREATE FUNCTION dbo.CalcularMontoPromedioVentas()
RETURNS DECIMAL(18,2)
AS
BEGIN
    DECLARE @MontoPromedio DECIMAL(18,2);

    SELECT @MontoPromedio = AVG(MONTO_VENDIDO)
    FROM FACT_VENTAS;

    RETURN @MontoPromedio;
END;

SELECT dbo.CalcularMontoPromedioVentas()

------4) Importe Comisión Comercial = 629902544.00 ($)--------

SELECT SUM(COMISION_COMERCIAL) AS MontoTotalComision
FROM FACT_VENTAS;

-- FUNCTION-----------

-- Crear la función
CREATE FUNCTION dbo.CalcularMontoTotalComision()
RETURNS DECIMAL(18,2)
AS
BEGIN
    DECLARE @MontoTotal DECIMAL(18,2);

    SELECT @MontoTotal = SUM(COMISION_COMERCIAL)
    FROM INT_FACT_VENTAS;

    RETURN @MontoTotal;
END;

SELECT dbo.CalcularMontoTotalComision()


------5) Cantidad de Clientes = 795 (#) -------

SELECT COUNT(DISTINCT [CLIENTE_KEY]) AS CantidadClientes
FROM FACT_VENTAS;

---- Funcion---
-- Crear la función
CREATE FUNCTION calcularCantidadClientes()
RETURNS INT
AS
BEGIN
    DECLARE @cantidad INT

    -- Utilizar DISTINCT para obtener los valores únicos de la columna COD_CLIENTE y contarlos
    SELECT @cantidad = COUNT(DISTINCT [CLIENTE_KEY])
    FROM FACT_VENTAS

    RETURN @cantidad
END

SELECT dbo.CalcularCantidadClientes()

