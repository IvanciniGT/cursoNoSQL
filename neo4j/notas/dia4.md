# Neo4J

Es una base de datos orientada a grafos. Una entre muchas otras. 
Posiblemente la más usada y funcional!

## Qué es eso de un grafo y cómo nos puede ayudar a la hora de procesar información?


TABLA 

Personas

ID      |   Nombre      |   PadreID     |   MadreID |
-----------------------------------------------------
1       |   Ivan        |   2           |   3       |
2       |   Isidoro     |   4           |   5       |
3       |   Maria       |   6           |   7       |
4       |   Manuel      |   -           |   -       |
5       |   Carmen      |   -           |   -       |
6       |   Blas        |   -           |   -       |
7       |   Sofia       |   -           |   -       |

Dame las personas que tienen un ancestro llamado "Lucas"

Dame los nombre de los padres de Ivan

SELECT 
    hijo.nombre,
    padre.nombre,
    madre.nombre
FROM
    personas as hijo
    INNER JOIN personas as padre ON hijo.padreid = padre.id    
    INNER JOIN personas as madre ON hijo.madreid = madre.id
WHERE
    hijo.nombre = "Ivan"

Dame los nombre de los abuelos de Ivan

SELECT 
    hijo.nombre,
    abuelopaterno.nombre,
    abuelomaterno.nombre,
    abuelapaterna.nombre,
    abuelamaterna.nombre
FROM
    personas as hijo
    INNER JOIN personas as padre ON hijo.padreid = padre.id    
    INNER JOIN personas as madre ON hijo.madreid = madre.id
    INNER JOIN personas as abuelopaterno ON padre.padreid = abuelopaterno.id    
    INNER JOIN personas as abuelomaterno ON madre.padreid = abuelomaterno.id
    INNER JOIN personas as abuelapaterna ON padre.madreid = abuelapaterna.id    
    INNER JOIN personas as abuelamaterna ON madre.madreid = abuelamaterna.id
WHERE
    hijo.nombre = "Ivan"


Ivan ****
    |- Isidoro
    |       |- Manuel
    |       |- Carmen
    |- Maria
            |- Blas
            |- Sofia

Ismael ****
    |- Isidoro
    |       |- Manuel
    |       |- Carmen
    |- Maria
            |- Blas
            |- Sofia

{
    nombre: Ivan,
    padres: [
        padre: {
            nombre: Isidoro,
            padres:
                padre: {
                    nombre: Manuel
                }
                madre: {
                    nombre: Carmen
                }
        }
        madre: {
            nombre: Maria,
            padres:
                padre: {
                    nombre: Blas
                }
                madre: {
                    nombre: Sofia
                }
        }
    ]
}

{
    nombre: Ismael,
    padres: [
        padre: {
            nombre: Isidoro,
            padres:
                padre: {
                    nombre: Manuel
                }
                madre: {
                    nombre: Carmen
                }
        }
        madre: {
            nombre: Maria,
            padres:
                padre: {
                    nombre: Blas
                }
                madre: {
                    nombre: Sofia
                }
        }
    ]
}
Pregunta... 
Si hiciera esto.... Podría hacer búsquedas sencillas? MUCHO !
$.padres.*.padres.padre.nombre

Me serviría esto en la realidad? 
Cómo se los padres de Maria?


Sitio web de amazon
    Ivan
    |- Direcciones
    |- Tarjetas
    |- Pedidos
        |- Pedido1
                |-Productos

Datos de un asegurado
    Ivan *****
     |- Datos contacto
     |- Datos personales
     |- Polizas
         |- Partes
            |- id = 17
         
    Lucas *****
     |- Datos contacto
     |- Datos personales
     |- Polizas
         |- Partes
            |- id = 18
            |- rel_id = 17

TEORIA DE GRAFOS ! Matemática - XVIII Euler -> Topología!

Se empieza a utilizar este tipo de respresentación de datos en el mundo de las REDES SOCIALES!


                   Manuel
                    |
                   padre
                    |
                    v
Ivan <-- padre -- Isidoro <--- madre --- Carmen
  ^                 |
  |               padre
  |                 |
  |                 v
  |               Ismael
  |                 ^
  |                 |
  |               madre
  |                 |
  |-- madre ---  Maria <--- madre --- Sofia
                   ^
                   |
                  padre
                   |
                  Blas

Quiero los nodos que tenga una relación de tipo padre con otro:
    Isidoro es un padre
    Blas es un padre
    Manuel es un padre >
    
----
    
Neo4j define su pripio lenguaje para representar nodos y relaciones: cypher
 CREATE (:PERSONA{ nombre: "Daniel" }) -[AMA{ intensidad: "alta" }]-> (:PERSONA{ nombre: "Leticia" }) 


 MATCH (:PERSONA{ nombre: "Daniel" }) -[AMA{ intensidad: "alta" }]-> (amada) RETURN amada
 
 PERSONAS
 | ID     |  NOMBRE  |
 | 1      |  Daniel  |
 | 2      |  Leticia |
 
 AMA
 | EL_QUE_AMA_ID | A_QUIEN_AMA_ID | INTENSIDAD |
 |  1            |  2             | "alta"     |
 
SELECT
    persona_amada.nombre
FROM
    personas as persona_que_ama
    INNER JOIN ama ON persona_que_ama.id=ama.el_que_ama_id
    INNER JOIN personas as persona_amada ON persona_amada.id=ama.a_quien_ama_id 
WHERE
    persona_que_ama.nombre = "Daniel";
    
La diferencia con NEO... o en general con las BBDD orientadas a grafos, es que los 
JOINS ya están precalculados en el momento que se hace el INSERT !


---

Ejemplo Neo4j
- Peliculas.  *Tablas
- Personas    *Tablas
- Actores     *RELACIONES
- Directores. *RELACIONES

Ficheros con los datos: 
    https://data.neo4j.com/intro/movies/movies.csv
    https://data.neo4j.com/intro/movies/people.csv
    https://data.neo4j.com/intro/movies/actors.csv
    https://data.neo4j.com/intro/movies/directors.csv

# Representación en una BBDD Relacional

    Personas -< Actuaciones >- Peliculas
     |                            |
     ---------< Director >---------
 
# En neo4j
 
No existe el concepto de tabla.
Lo que guardamos son objetos (teoria de grafos: vertices)
Los objetos se guardan en la BBDD.

Vamos a tener objetos de 2 tipos: 
    Personas
    Peliculas

Vamos a tener relaciones (Teoría de grafos: ARISTAS) entre esos objetos, de 2 tipos:
    Actor
    Director
    

    Personas ---Actor---> Peliculas
             --Director->



