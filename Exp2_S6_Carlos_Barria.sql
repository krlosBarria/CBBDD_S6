-- Cracion de usuario
---- User: PRY2205_S6
---- pass: PRY2205.semana_6
----

-- CASO 1:
---- Reporte Totalizar los costos de las consultas realizadas por cada medico (sumatoria de los costos agrupado por medico)
    
---- crear la tabla recaudacion_bonos_medicos 
-------  (RUT completo del medico, nombre y apellidos concatenados, total recuadado y la unidad médica de atnción)
-------  Ordenada total recaudad ascendente.
CREATE TABLE recaudacion_bonos_medicos (
    rut_medico VARCHAR2(12)
    ,nombre_medico VARCHAR2(255)
    ,total_recaudado DECIMAL(12,2)
    ,unidad_atencion VARCHAR2(100)
);


SELECT
    TO_CHAR(SUBSTR(m.rut_med, 1, LENGTH(m.rut_med) - 6))||'.'||
    TO_CHAR(SUBSTR(m.rut_med, LENGTH(m.rut_med) - 5,3))||'.'||
    TO_CHAR(SUBSTR(m.rut_med, LENGTH(m.rut_med) - 2,3))||'-'||
    m.dv_run AS RUT_MEDICO
    ,UPPER(INITCAP(m.pnombre)||' '||INITCAP(m.snombre)||' '||INITCAP(m.apaterno)||' '||INITCAP(m.amaterno)) AS NOMBRE_MEDICO
    ,b.total AS TOTAL_RECAUDADO
    ,e.nombre AS UNIDAD_MEDICA
FROM medico m
INNER JOIN especialidad_medica e
    ON m.uni_id = e.esp_id
INNER JOIN bono_consulta b
    ON m.rut_med = b.rut_met
WHERE c.uni_id NOT IN(100,500,600)
ORDER BY RUT_MEDICO;



SELECT * from medico



