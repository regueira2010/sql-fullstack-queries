DROP TABLE IF EXISTS finanzas_personales;

CREATE TABLE finanzas_personales
(
    nombre character varying(20) COLLATE pg_catalog."default" NOT NULL,
    me_debe integer,
    cuotas_cobrar integer,
    le_debo integer,
    cuotas_pagar integer,
    CONSTRAINT finanzas_personales_pkey PRIMARY KEY (nombre)
);

insert into finanzas_personales (nombre, me_debe, cuotas_cobrar, le_debo, cuotas_pagar)
values ('t�a carmen', 0, 0, 5000, 1);
insert into finanzas_personales (nombre, me_debe, cuotas_cobrar, le_debo, cuotas_pagar)
values ('pap�', 0, 0, 15000, 3);
insert into finanzas_personales (nombre, me_debe, cuotas_cobrar, le_debo, cuotas_pagar)
values ('nacho', 10000, 2, 7000, 1);
insert into finanzas_personales (nombre, me_debe, cuotas_cobrar, le_debo, cuotas_pagar)
values ('almac�n esquina', 0, 0, 13000, 2);
insert into finanzas_personales (nombre, me_debe, cuotas_cobrar, le_debo, cuotas_pagar)
values ('vicios varios', 0, 0, 35000, 35);
insert into finanzas_personales (nombre, me_debe, cuotas_cobrar, le_debo, cuotas_pagar)
values ('compa�ero trabajo', 50000, 5, 0, 0);

select * from finanzas_personales ;

// 1 
SELECT nombre, le_debo FROM finanzas_personales 
ORDER BY le_debo DESC LIMIT 1;

//2
SELECT nombre, me_debe FROM finanzas_personales 
ORDER BY me_debe DESC LIMIT 1;

//3
SELECT SUM(le_debo) AS total_deuda FROM finanzas_personales;

//4
SELECT AVG(le_debo) AS promedio_deuda FROM finanzas_personales WHERE le_debo > 0;

//5
SELECT 
    SUM(cuotas_pagar) AS total_cuotas,
    SUM(cuotas_pagar) / 12 AS años,
    SUM(cuotas_pagar) % 12 AS meses
FROM finanzas_personales;

//6
SELECT (SUM(le_debo) - SUM(me_debe))/ SUM(cuotas_pagar) AS Valor_Cuota FROM finanzas_personales;

//7
INSERT INTO finanzas_personales (nombre, me_debe, cuotas_cobrar, le_debo, cuotas_pagar)
VALUES ('pareja', 0, 0, 50000, 1);

//8
SELECT SUM(le_debo / cuotas_pagar) AS cuota_mes 
FROM finanzas_personales 
WHERE cuotas_pagar > 0;

//9
UPDATE finanzas_personales 
SET cuotas_pagar = 13 
WHERE nombre = 'almacén esquina';

//10
SELECT SUM(le_debo / cuotas_pagar) AS cuota_final 
FROM finanzas_personales 
WHERE cuotas_pagar > 0;
