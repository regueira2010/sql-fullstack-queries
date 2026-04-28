# 📊 SQL & Relational Databases: De Datos Planos a 3FN

[![SQL](https://img.shields.io/badge/Language-SQL-blue.svg)](https://www.postgresql.org/)
[![PostgreSQL](https://img.shields.io/badge/Database-PostgreSQL-336791.svg)](https://www.postgresql.org/)
[![Bootstrap](https://img.shields.io/badge/UI-Bootstrap_5-563d7c.svg)](https://getbootstrap.com/)

Este repositorio contiene la progresión técnica del **Módulo de Bases de Datos Relacionales**. El proyecto documenta el viaje desde la creación de tablas básicas hasta la implementación de un modelo normalizado bajo la Tercera Forma Normal (3FN), culminando en un dashboard interactivo.

🚀 **Visualiza el proyecto aquí:** [Live Demo](https://regueira2010.github.io/sql-fullstack-queries/)

---

## 🗺️ Ruta de Aprendizaje y Ejercicios

El módulo se dividió en hitos incrementales de complejidad:

| Hito | Conceptos Clave | Descripción |
| :--- | :--- | :--- |
| **01-03** | DDL & DML Básico | Creación de tablas, inserción de registros y consultas simples con filtros `WHERE`. |
| **04-05** | Agregaciones | Uso de `GROUP BY`, `SUM`, `AVG` y funciones de conteo para reportes de sueldos. |
| **06-07** | Relaciones (Joins) | Implementación de `INNER JOIN`, `LEFT JOIN` y `FULL OUTER JOIN` para cruzar datos. |
| **08** | Diagrama ER | Diseño y normalización de bases de datos para tres ecosistemas: Envíos, Retail y Banca. |
| **09** | **Normalización Final** | Rediseño completo de la arquitectura: paso de tablas planas a modelo relacional con Tabla Puente. |

---

## 🛠️ El Desafío Final: Normalización 3FN

El proyecto final consistió en transformar un set de datos denormalizado (donde los nombres de actores se repetían constantemente) en una estructura robusta:

1.  **Eliminación de Redundancia:** Creación de tablas maestras de `actores` y `teleseries`.
2.  **Integridad Referencial:** Uso de LLaves Primarias (PK) y Foráneas (FK).
3.  **Tabla Puente:** Creación de una tabla de unión llamada `reparto_actores` para gestionar la relación Muchos-a-Muchos entre actores y teleseries, permitiendo registrar sueldos y roles de forma centralizada.

---

## 💡 SQL Pro-Tips Incluidos en este Módulo

Durante el desarrollo, aplicamos estas "reglas de oro":

*   **COALESCE:** Se usa para manejar valores `NULL` en consultas de `FULL OUTER JOIN` y evitar celdas vacías en los reportes.
*   **Identación por legibilidad:** Siempre se escriben las palabras clave (`SELECT`, `FROM`, `JOIN`) en mayúsculas y en líneas separadas para facilitar el debugging.
*   **Unique Constraints:** No basta con una PK; se uso `UNIQUE` en campos como nombres de actores para evitar que la base de datos se ensucie con duplicados.
*   **La Regla de la Única Verdad:** Si un dato (como un nombre) se repite en dos tablas, tu modelo necesita normalización.

---

## 🚀 Cómo ejecutar los scripts

1.  Instala **PostgreSQL** y **pgAdmin 4**.
2.  Crea una nueva base de datos llamada `evaluacion_sql`.
3.  Carga ejerciocio contiene el archivo descargable.
4.  Ejecuta las queries de consulta para verificar la integridad de los datos migrados.

---

## 🖥️ Tecnologías Utilizadas

*   **Engine:** PostgreSQL 18
*   **Interface:** pgAdmin 4
*   **Frontend:** HTML5 & Bootstrap 5 (Dashboard de resultados)
*   **Versionamiento:** Git & GitHub Pages

---
Creado con ❤️ por **Regueira2010** - 2026.