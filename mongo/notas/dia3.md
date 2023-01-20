# Conectando con mongo desde jupyter 

- Instalar Jupyter (mediante un contenedor)
- Dentro de ese notebook hemos de tener instalada una libreria para hablar con mongo: pymongo
- hacer un programa que conecte y realice operaciones en mongo


fichero de datos:
campo: codigo postal: 28770

Al guardar en un fichero, eso se transforma en bits > bytes
1 bit  > 2 potenciales cosas             0   1
2 bits > 4 potenciales cosas             00 01 10 11
2^n
8 bits = 1 byte > 256
2 bytes = 256 x 256 = 65536 potenciales cosas 

0000 0000 0000 0000 
1000 0100 1110 0011 
1111 1111 1111 1111         65k cosas
Me da de sobra para meter los codigos postales de españa? SI 

En un archivo puedo guardar 16 bits sin problema (2 bytes)
Pero la mayor parte de los lenguajes de programación al llevar ese dato a memoria RAM lo tranforman en un 
dato de tipo INTEGER 

En los lenguajes de programación los integer ocupan 4 bytes en la memoria RAM !
numero = 17
int numero = 17;

C => short es un numero entero de 2 bytes!

BIGDATA !


USUARIOS                IDIOMAS_HABLADOS                IDIOMAS
id nombre edad          id_usuario, id_idioma           id nombre

usuarios
{
    nombre: Jose Enrique,
    edad: 27,
    idiomas: [
        español,
        ingles
    ]
    
}

---

# MongoDB

BBDD que es muy cómoda de utilizar y permite desarrollos de aplicaciones muy sencillos y RAPIDOS !

Es una BBDD que guarda documentos JSON (jerarquía).

Preparada para las típicas operaciones de BBDD: CRUD:
-Insert
-Update
-Delete
-Select

# ElasticSearch

No es una BBDD. Es un indexador/motor de búsqueda. >>>> GOOGLE !
Solo está preparado para hacer: SELECT 

Un indexador no tiene por qué guardar el documento /información / datos que se indexan

Su única misión es permitirnos buscar entre muchos documentos y
darnos como respuesta las UBICACIONES/ identificadores de esos documentos.

Opcionalmente, puedo pedir a ElasticSearch que cuando indexa un documento JSON, se quede con una copia del mismo.

Si diera la casualidad que trabaje yo con documentos muertos, es decir, que no cambian ni van a cambiar
la copia que tengo guardada en elasticsearch(o en la cache de google) sería una copia perfecta,
totalmente válida. En ese caso, podría usar ElasticSearch como un sistema de almacenamiento de documentos JSON,
exactamente lo que hace MONGO.

En qué escenarios ocurre eso: 
- Evento: Asociado a un instante de tiempo                  ---> Por eso en el mundo IT se usa Elasticsearch
    Entradas de un Registro (Logs)                               en monitorización
    Metricas que observo en unos servidores, aplicaciones
- Datawarehouse

Elastic tiene opciones MUY AVANZADAS para montar un Datawarehouse.

Todos los partes que se dan de alta en Ocaso con toda su información
2002
2003
2004
2005
2006
2007
....

5 años después... los datos personales de una incidencia ya no sirven.
    Telefono
    Email
    Nombre
    Informe de texto de 10 paginas 
Y puedo configurar en ES mecanismos para su eliminación / resumen

Por ejemplo, puedo tener que me vaya moviendo los datos de unos dispositivos de 
almacenamiento a otros según pase el tiempo.

Almacenamiento es barato o caro? ES DE LAS COSAS MAS CARAS !

Sabeis cuantas copias se hacen de un dato en un entorno de producción? x3 
En casa un HDD 4 Tb -> 100€
En el servidor:     -> 200€ x3 = 600€

Esos discos duros los quiero en computadoras distintas x3 computadoras x 3 zonas geograficas 

Elasticsearch nace como MOTOR DE BUSQUEDAS / INDEXADOR DE DOCUMENTOS.
Genera automáticamente INDICES de todo tipo y condición para hacer búsquedas muy eficientes sobre los datos.

Disponer de un almacen de datos y unos indices ultraoptimizados para postesteriormente hace queries y análisis de datos

ElasticSearch lo fabrica una empresa llamada ELASTIC, que tiene otros productos: KIBANA !
Kibana, que funciona como una Interfaz WEB para acceder a un ElasticSearch.
Kibana permite montar unos dashboards y analíticas más avanzadas (técnicas de datamining y machine learning) 
a golpe de ratón de manera muy cómoda, usando toda la potencia de busquedas de ES de forma nativa.


# Indices
                            ALIAS
polizas-enero-2022          datos-importantes
polizas-febrero-2022
polizas-marzo-2022
polizas-abril-2022
polizas-mayo-2022

incidencias-enero-2022      datos-importanets

polizas*
datos-importantes