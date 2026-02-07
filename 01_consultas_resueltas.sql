/*
  --------------------------------------------------------------------------
  PROYECTO: Prácticas SQL - Gestión de Empleados
  DESCRIPCIÓN: Resolución de 40 consultas de análisis de datos.
  MOTOR: MySQL
  Autor:Pablo de la Rosa
  --------------------------------------------------------------------------
*/

-- 1. Mostrar el apellido, oficio y número de departamento de cada empleado.
SELECT apellido, oficio, dep_no 
FROM empleados;

-- 2. Mostrar el número, nombre y localidad de cada departamento.
SELECT *
FROM departamentos;

-- 3. Mostrar todos los datos de todos los empleados.
SELECT *
FROM empleados;

-- 4. Datos de los empleados ordenados por apellidos.
SELECT * 
FROM empleados 
ORDER BY apellido ASC;

-- 5. Datos de los empleados ordenados por número de departamento descendentemente.
SELECT * 
FROM empleados 
ORDER BY dep_no DESC;

-- 6. Datos de los empleados ordenados por número de departamento desc. y apellido asc.
SELECT *
FROM empleados 
ORDER BY dep_no DESC, apellido ASC;

-- 7. Mostrar los datos de los empleados cuyo salario sea mayor que 2000 €.
SELECT *
FROM empleados 
WHERE salario > 2000;

-- 8. Mostrar los datos de los empleados cuyo oficio sea 'Analista'.
SELECT * 
FROM empleados 
WHERE oficio = 'Analista';

-- 9. Seleccionar el apellido y oficio de los empleados del departamento número 20.
SELECT apellido, oficio, dep_no 
FROM empleados 
WHERE dep_no = 20;

-- 10. Mostrar todos los datos de los empleados ordenados por apellido.
SELECT * 
FROM empleados 
ORDER BY apellido ASC;

-- 11. Seleccionar los empleados cuyo oficio sea 'Vendedor'. Mostrar ordenados por apellido.
SELECT * 
FROM empleados 
WHERE oficio = 'Vendedor' 
ORDER BY apellido ASC;

-- 12. Mostrar los empleados cuyo departamento sea 10 y oficio 'Analista'.
SELECT * 
FROM empleados 
WHERE dep_no = 10 AND oficio = 'Analista'
ORDER BY apellido ASC;

-- 13. Empleados con salario mayor que 2000 € o del departamento 20.
SELECT *
FROM empleados 
WHERE salario > 2000 OR dep_no = 20;

-- 14. Ordenar los empleados por oficio, y dentro de oficio por apellido.
SELECT * 
FROM empleados 
ORDER BY oficio ASC, apellido ASC;

-- 15. Empleados cuyo apellido empiece por 'A'.
SELECT * 
FROM empleados 
WHERE apellido LIKE 'A%';

-- 16. Empleados cuyo apellido termine por 'Z'.
SELECT * 
FROM empleados 
WHERE apellido LIKE '%Z';

-- 17. Apellido empieza por 'A' y Oficio tiene una 'E'.
SELECT * 
FROM empleados 
WHERE apellido LIKE 'A%' AND oficio LIKE '%E%';

-- 18. Empleados cuyo salario esté entre 1000 € y 2000 €.
SELECT * 
FROM empleados 
WHERE salario BETWEEN 1000 AND 2000;

-- 19. Vendedores con comisión superior a 1000 €.
SELECT * 
FROM empleados 
WHERE oficio = 'Vendedor' AND comision > 1000;

-- 20. Ordenados por número de departamento y apellido.
SELECT * 
FROM empleados 
ORDER BY dep_no ASC, apellido ASC;

-- 21. Apellido termina por 'Z' y salario superior a 3000 €.
SELECT emp_no, apellido 
FROM empleados 
WHERE apellido LIKE '%Z' AND salario > 3000;

-- 22. Departamentos cuya localización empiece por 'B'.
SELECT * 
FROM departamentos 
WHERE localidad LIKE 'B%';

-- 23. Empleados 'Empleado', salario > 1000 € y departamento 10.
SELECT * 
FROM empleados 
WHERE oficio = 'Empleado' 
  AND salario > 1000 
  AND dep_no = 10;

-- 24. Apellidos que no tengan comisión y empiecen por 'J'.
SELECT apellido, comision 
FROM empleados 
WHERE comision IS NULL AND apellido LIKE 'J%';

-- 25. Apellidos de empleados que no tengan comisión.
SELECT apellido, comision 
FROM empleados 
WHERE comision IS NULL;

-- 26. Oficio sea 'Vendedor', 'Analista' o 'Empleado'.
SELECT apellido, oficio 
FROM empleados 
WHERE oficio IN ('Vendedor', 'Analista', 'Empleado');

-- 27. Oficio NO sea ni 'Analista' ni 'Empleado', y salario > 2000 €.
SELECT apellido, oficio, salario 
FROM empleados 
WHERE oficio NOT IN ('Analista', 'Empleado') 
  AND salario > 2000;

-- 28. Salario entre 2000 € y 3000 €.
SELECT * 
FROM empleados 
WHERE salario BETWEEN 2000 AND 3000;

-- 29. Salario > 2000 € en los departamentos 10 o 30.
SELECT apellido, salario, dep_no 
FROM empleados 
WHERE salario > 2000 AND dep_no IN (10, 30);

-- 30. Salario NO esté entre 1000 € y 2000 €.
SELECT apellido, salario, emp_no 
FROM empleados 
WHERE salario NOT BETWEEN 1000 AND 2000;

-- 31. Apellido en minúscula.
SELECT LOWER(apellido) AS "En minúscula" 
FROM empleados;

-- 32. Concatenar apellido con oficio.
SELECT CONCAT(apellido, ' ', oficio) AS Concatenación
FROM empleados;

-- 33. Apellido y longitud, ordenados por longitud descendente.
SELECT apellido, LENGTH(apellido) as longitud
FROM empleados 
ORDER BY LENGTH(apellido) DESC;

-- 34. Año de contratación.
SELECT YEAR(fecha_alta) AS año_contrato 
FROM empleados;

-- 35. Empleados contratados en el año 1982.
SELECT * FROM empleados 
WHERE YEAR(fecha_alta) = 1982;

-- 36. Contratados en febrero de cualquier año.
SELECT *, MONTHNAME(fecha_alta) AS Mes
FROM empleados 
WHERE MONTH(fecha_alta) = 2;

-- 37. Mayor valor entre salario y comisión.
SELECT apellido, salario, comision, GREATEST(salario, IFNULL(comision, 0)) as mayor_ingreso
FROM empleados;

-- 38. Apellido empieza por 'A' y contratados en el año 1990.
SELECT * 
FROM empleados 
WHERE apellido LIKE 'A%' AND YEAR(fecha_alta) = 1981;

-- 39. Empleados del departamento 10 sin comisión.
SELECT * 
FROM empleados 
WHERE dep_no = 10 AND comision IS NULL;

-- 40. Salario total (salario + comisión) superior a 3000 €.
SELECT * 
FROM empleados 
WHERE (salario + IFNULL(comision, 0)) > 3000;
