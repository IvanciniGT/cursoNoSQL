# Clientes de MongoDB

- mongosh (forma parte de las mongo-tools: mongodump mongoexport mongoimport)
    Es el cliente de linea de comandos de Mongo
    Para trabajar contra mongo lanzamos comandos.... lo que sería el equivalente a SQL
- mongo-express
    Es un cliente web para accecer a mongo
    Para trabajar contra mongo usamos el ratón y botones. 
        Apretar botones NO NOS GUSTA MUCHO!
- compass
    Es un cliente de escritorio para acceder a mongo
- En los distintos lenguajes de programación, existen librerias para acceder a mongo
    - Para python: pymongo mongoose

# Mongosh

Lo primero que necesitamos es instalar el cliente: https://www.mongodb.com/docs/mongodb-shell/install/

Para ejecutarlo basta con abrir una terminal (en linux, windows, mac) y escribir el comando mongosh.

    $ mongosh

En nuestro caso, como estamos usando contenedores, podemos aprovecharnos de que el programa ya está instalado dentro del contenedores.
Y solicitar a nuestro gestor de contenedores: DOCKER que ejecute el comando mongosh dentro de nuestro contenedor de mongo.

    $ docker exec -it mimongo mongosh
    
    ------------------------- -------
    Le pedimos a docker que     El cliente de mongo
    dentro del contenedor 
    llamado mimongo ejecute...

## Comandos

### use <BBDD>

Cambia a una determinada base de datos para operar contra ella.

### db.<NOMBRE_COLECCION>.VERBOS

    Notación Mongo                          Notación SQL
    ----------------------------------------------------------------------------------
    VERBOS: find()                          Sería el equivalente a un SELECT
            insertOne()                     Sería el equivalente a un INSERT SQL
            
    $ db.usuarios.find()                    SELECT * FROM usuarios    
    $ db.getCollection("usuarios").find()   SELECT * FROM usuarios

# Claves primarias en MongoDB

Todo documento de MONGO tiene un campo llamado "_id", que es su clave primaria. Su identificador.

Si al cargar un nuevo documento, el documento no lleva campo "_id", Mongo le asigna uno automáticamente.

IMPORTANTE: Los IDS generados por Mongo no son correlativos.

Automáticamente, MONGO crea un INDICE para el campo "_id" de cualquier colección.

# Herramientas para análisis de datos

SAS
SPSS
R
Python + pandas, tensorflow, sklearn

Todas esas librerias y programas, y todas las técnicas de analisis de datos, están preparadas para tratar
con datos en forma de tabla!

Regresión lineal    \
Modelo generalidazo / Matrices ! (tabla de datos)

Variable dependiente: Y 
Variables independeientes Xi

Id          Y X0 X1 X2 X3... Xn
Juanito    SI 
Lucas      NO
Marcial    SI

    ^^^ DATOS = INFORMACION !

Esa información como la estructuro de cara a su almacenamiento !

BBDD (repositorio de los datos)
 ESTRUCTURA DE ALMACENAMIENTO                           >>>>    ANALISIS
 Tabla
 Matriz 3D Cualquiera que trabaje con SERIES DE TIEMPO     <>       Técnica de análisis
 Grafos                                                             Requiere de una determinada estructura de datos
 Arboles: Estructuras jerárquicas

^ Cómo extraigo la información del Almacen de datos para su posterior Procesamiento y análsis
  = QUERY 
    BBDD Relacionales   Teorias matematicas de conjuntos y uniones ... lenguaje SQL (ANSI/ISO)
    
---

Expediente de parte de incidencia en un seguro.

"Se me ha levantado el suelo del salón por una rotura de un radiador"

Datos relativos al expediente:
    Datos de apertura del expediente (fecha, motivo, ....)
    Datos del asegurado
    Datos de la poliza
    Actuaciones
        Perito... cuántas veces va? Puede que ninguna.... puede que 17
        Recepción de documentación (videos, imágenes,...)
        Intervenciones de profesionales (carpintero)
        Aprobaciones
        

# Representación en una BBDD Relacional

    ASEGURADOS -< POLIZAS -< INCIDENCIAS -< ACTUACIONES
                                             fecha, tipo_actuacion, id
                                                -< Peritos
                                                -< Documentación
                                                -< Intervenciones
                                                -< Aprobaciones

    -< = Relación 1-n

# Representación en una BBDD Jerárquica como Mongo

Colección: ASEGURADOS
    {
        "_id":          ,
        "nombre":       ,
        "dni":          ,
        "telefono":     ,
        "email":
    }

Colección: POLIZAS?
    {
        "_id":          ,
        "dni"           ,
        "tipo":         ,
        "numero":       ,
        "importe":      ,
        "beneficiario": ,
        "condiciones particulares": ,
        ...
    }

Esto sería lo mismo que hemos hecho en la BBDD Relacional, con una diferencia: 
En mongo no existe el concepto de CLAVE Externa (Foreign Key)

Y eso implica que alguien puede dar de alta en la BBDD un documento cuyo DNI 
no esté dado de alta en la COLECCION asegurados... Y NO HAY FORMA HUMANA EN MONGO DE ASEGURAR ESA INTEGRIDAD !



Colección: ASEGURADOS
    {
        "_id":          , // DNI
        "nombre":       ,
        "telefono":     ,
        "email":        ,
        "polizas": [
            {
                "_id":          ,
                "tipo":         ,
                "numero":       ,
                "importe":      ,
                "beneficiario": ,
                "condiciones particulares": ,
                "incidencias": [
                    "numero de incidencia": ,
                    "detalle": , 
                    "fecha": , 
                    ...
                ]
                ...
            },     
            {
                "_id":          ,
                "tipo":         ,
                "numero":       ,
                "importe":      ,
                "beneficiario": ,
                "condiciones particulares": ,
                ...
            },  
            {...},
            {...},
            {...}
        ]
    }

db.asegurados.find("_id": "53024501W")

Cambian mucho (con mucha frecuencia) las polizas que tiene contratadas un asegurado? NO
El dato ASEGURADO-POLIZAS se consulta muchas más veces que se actualiza? SI

Si el documento se actualiza mucho... y esas actualizaciones implican que el documento vaya creciendo mucho en tamaño,
Mongo NO VA A DAR UN BUEN RENDIMIENTO si los datos se almacenan de esta forma.

COLECCION: Actuaciones
{
    "_id": "", 
    "numero de incidencia" "",
    "tipo": "Envio de fotos por parte de cliente",
    "fotos": [
        "12367129376190467012630871237",
        "12367129376190467012630871237",
        "12367129376190467012630871237",
        "12367129376190467012630871237",
    ]
}

$lookup -> EQUIVALENTE A UN JOIN de SQL... pero esto tiende a usarse poco en MONGO !


Estoy desarrollando una aplicación para controlar el estado y tramitación de estos expedientes:

Pantalla búsqueda: Número de expediente -> QUERY1 ASEGURADOS
                   Número de poliza
                   Número de asegurado
                   
Pantalla del asegurado -> Vería las polizas
Pantalla de una poliza -> Incidencias
Pantalla de una incidencia -> Listado de actuaciones : QUERY2 ACTUACIONES


MONGODB es una BBDD que se emplea en Entornos de producción!
En los entornos de producción las BBDD tienen muchas operaciones de Acctualización de datos 
(Insert, Delete, Update)

En entornos DATAWAREHOUSE, para almacenar información jerárquica la herramienta es ELASTICSEARCH