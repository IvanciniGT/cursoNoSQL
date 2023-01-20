# NoSQL Databases

Not Only SQL

## Mongo

Base de datos orientada a documentos.

En las bases de datos relacionales la información se guarda en: TABLAS.

Tablas que contienen: 
- Columnas: CAMPOS
- Filas: REGISTROS

Las tablas guardan relaciones entre ellas, a través de lo que denominamos claves externas.

En mongo, se almacenan documentos JSON. 

Los documentos se guardan en COLECCIONES. Las COLECCIONES serían el equivalente a una TABLA en un BBDD relacional.

Los documentos JSON serían el equivalente a un REGISTRO De una BBDD relacional.

Los documentos JSON tienen campos, que serían el equivalente a las COLUMNAS de una tabla en una BBDD relacional.

En mongo, cada documento JSON tiene su propio IDENTIFICADOR, igual que
en las bbdd relacionales, los registros tienen su propio ID (primary key).

## JSON

JSON: Javascript Object Notation

```py
numero = 7
texto = "hola"
logico = True
lista = [ 1, 2, 3 ]
diccionario = { nombre: "Ivan", apellidos: "Osuna Ayuste", edad: 44 }
```

```js
var numero = 7
var texto = "hola"
var logico = true
var lista = [ 1, 2, 3 ]
var diccionario = { "nombre": "Ivan", "apellidos": "Osuna Ayuste", "edad": 44 }
```

Todas las cosas que hay a la derecha del signo igual son JSON.
Habitualmente, los docuemntos JSON contienen a PRIMER NIVEL listas o diccionarios.

En JSON, se pueden crear estructuras jerárquicas para representar información.

Imaginad la información de un producto que vendo en una web (me valdría también un expediente de un seguro).

AMAZON: 

# Producto 1: Zapatillas de deporte

Marca: Nike √
Números disponibles: [38, 39, 40, 41, 42, 43, 44, 45]
Color: [ Blancas ]
Precio: 87 €
Material: Cuero | Lona...

{
    "marca": "Nike",
    "tallas": [38, 39, 40, 41, 42, 43, 44, 45],
    "color": [ "Blanco" ],
    "precio": 87,
    "material": "cuero"
}

# Producto 2: Libro de cocina

{
    "titulo": "1000 y una recetas de cocina",
    "editorial": "RVC" ,
    "autor":  "Arguiñano",
    "genero": "Cocina",
    "paginas": 1001,
    "portada": "dura",
    "impresion": "color"
}

TABLA ZAPATILLAS:

    | ID    | MARCA | PRECIO    | MATERIAL      |
    | ----- | ----- | --------- | ------------- |
    | 1     | nike  |       87  | Cuero         |

TABLA TALLAS:

    | ID    | TALLA |
    | ----- | ----- |
    | 1     |    38 |
    | 1     |    39 |
    | 1     |    40 |
    | 1     |    41 |
    
TABLA COLORES:

    | ID    | COLOR  |
    | ----- | ------ |
    | 1     | Blanco |
    | 2     | Blanco |
    | 2     | Negro  |


## DOCUMENTO NO ES LO MISMO que FICHERO

Si imaginamos que un documento es un fichero, una colección sería el equivalente a una carpeta...
Pero, un fichero puede contener múltiples documentos.

[
    {
        "marca": "Nike",
        "tallas": [38, 39, 40, 41, 42, 43, 44, 45],
        "color": [ "Blanco" ],
        "precio": 87,
        "material": "cuero"
    },
    {
        "titulo": "1000 y una recetas de cocina",
        "editorial": "RVC" ,
        "autor":  "Carlos Arguiñano",
        "genero": "Cocina",
        "paginas": 1001,
        "portada": "dura",
        "impresion": "color",
        "precio": 33
    }
]

## MONGODB

Una base de datos como MongoDB permite guardar información NO ESTRUCTURADA ! o al menos con ESTRUCTURA NO RIGIDA !

En una BBDD Relacional, lo primero que hacemos al crearla es definir SU ESQUEMA !
En un esquema de una BBDD Relacional, especificamos las tablas que vamos a usar y los campos que deben tener los registros que guardemos en esas tablas.

En MONGO ese concepto (ESQUEMA) no existe.

En MONGO me creo una colección... y empiezo a tirar documentos JSON allí dentro, documentos que tengan la estructura que a mi me viene bien en cada momento



Sistema para gestión de expedientes de partes de seguro.

POLIZA: 
    Tomador
    Beneficiario
    Objeto
    Importe
    Precio
    ...

EXPEDIENTE de un PARTE:
    Fotos
    Perito

BBDD Relacionales >>> SQL

## Acceso a la información

TABLA ZAPATILLAS:

    | ID    | MARCA    | PRECIO    | MATERIAL      |
    | ----- | -------- | --------- | ------------- |
    | 3     | converse |       27  | Lona          |
    | 1     | nike     |       87  | Cuero         |
    | 4     | nike     |      107  | Lona          |
    | 2     | reebok   |       67  | Cuero         |
    | 5     | addidas  |       76  | lona          |

    + addidas <<<<

QUERY: Zapatillas "nike" 

Una forma de hacer esta búsqueda sería leer todos los datos para ir marcando los
que coinciden con el criterio establecido: FULLSCAN -> LENTA !!!!!

Podríamos optimizar esa búsqueda si los datos estuvieran preordenados por la marca...
mediante un algoritmo de BUSQUEDA BINARIA !

Si tengo 100.000 datos.... Un full scan obliga a hacer 100.000 comprobaciones
                           Una búsqueda binaria me hace solo: log(n): 18 comprobaciones
    100.000 
     50.000
     25.000
     13.000
      7.000
      3.500
      1.800
        900
        450
        225
        115
         60
         30
         15
          8
          4
          2
          1

Las bases de datos, igual que los humanos al buscar en un diccionario usan un algoritmo más avanzado,
ya que conocen de antemano el reparto de los datos -> ESTADISTICAS

Esto está guay para los diccionarios... pero no para las BBDD... ya que:
- en los diccionarios los términos /registros) no cambian
- pero en las BBDD si cambian

Ya que los datos no pueden estar preordenados en la tabla, como la búsqueda es mucho más rápida si los datos están ordenados
los ORDENO PRIMERO, antes de hacer la búsqueda.

Qué tal se le da a una computadora ordenar datos? FATAL !!!! Son muy ineficientes!

Aquí surje el concepto de INDICE: un INDICE es una COPIA PREORDENADA de los datos, donde asociado a cada dato,
se guarda adicionalmente su ubicación.. en el caso de un libro, la página.
En el caso de un registro de una BBDD, el ID del dato.
Es igual que en un libro... que también tienen índices.

    | ID    | MARCA    | PRECIO    | MATERIAL      |
    | ----- | -------- | --------- | ------------- |
    | 3     | converse |       27  | Lona          |
    | 1     | nike     |       87  | Cuero         |
    | 4     | nike     |      107  | Lona          |
    | 2     | reebok   |       67  | Cuero         |
    | 5     | addidas  |       76  | lona          |

    INDICE MARCA                            Indice directo
    marcas:         IDS:
    addidas         5
    converse        3
    nike            1,4
    reebok          2

    INDICE PRECIO
    precios:         IDS:
    27                  3
    67                  2
    76                  5
    87                  1
    107                 4

Los índices directos son geniales cuando queremos buscar un valor concreto:
    Marca = 'nike'
    Precio > 87€

Si monto la web de amazon... 
    Quiero buscar libros: "Cocina asiatica"
                                    TITULO
                                + "Recetas de cocina asiatica"
                                - "Cocina mediterranea"
                                + "Recetas de asia"

     INDICE DIRECTO para el campo TITULO:
        Cocina mediterranea             2 -
        Recetas de cocina asiatica      1 +
        Recetas de asia                 3 -

QUERY: "Cocina asiatica"-> la BBDD (Oracle o MONGO) va a hacer una operación llamada FULLSCAN del INDICE

En campos de texto, donde queremos hacer búsquedas a texto completo (FULL TEXT), no sirven los INDICES DIRECTOS.
Las BBDD Relaciones trabajan principalmente con ÍNDICES DIRECTOS.
- Oracle tiene un producto que se llama ORACLE TEXT, que permite hacer búsquedas FULL TEXT sobre campos de texto
- SQL Server tiene una funcionalidad que permite hacer búsquedas FULL TEXT sobre campos de texto
- En MySQL, MariaDB y PostgreSQL la funcionalidad FULL TEXT es muy muy pobre

Para búsquedas FULL TEXT existen los llamados INDICES INVERTIDOS. No todas las BBDD los soportan. 
De las relacionales pocas y las que lo soportan, con muy poca funcionalidad.
Mongo los soporta... con algo más de funcionalidad...
Si quiero mucha más funcionalidad y hacer búsquedas FLIPANTES y bien rapidito me tengo que ir a otros productos 
más especializados (indexadores de contenido: ELASTICSEARCH)

ELASTICSEARCH en algunos escenarios (como por ejemplo analítica de datos) puede reemplazar a un mongo DB.
                 -------
Herramienta que al igual que monto trabaja almacenando documentos JSON.

El problema de ELASTICSEARCH es que no es una BBDD... es un indexador... Y esto tiene una implicación:
- Solo guarda una copia de un documento... no admite modificaciones a los documentos.
- Como BBDD para un sistema en el que los datos están cambiando, NO SIRVE como BBDD
- Pero si tengo un sistema con datos MUERTOS (Datawarehouse), es IDEAL !

Si en PRODUCCION tengo una BBDD MongoDB, en el datawarehouse, los datos los meto en ELASTICSEARCH 
que hace mucho mejor análisis de los datos que mongo.
Adicionalmente , ELASTICSEARCH vienen con un programa llamado KIBANA, que es un entorno GRAFICO WEB con el que generar 
informes, cuadros de mando, reportes, ....   (LO QUE VENDRÍA A SER UN POWER BI de Microsoft)

## INDICES INVERTIDOS

COLECCION : Libros

    Documento ID 1
        {
            "titulo": "1000 y una recetas de cocina",
            "editorial": "RVC" ,
            "autor":  "Carlos Arguiñano",
            "genero": "Cocina",
            "paginas": 1001,
            "portada": "dura",
            "impresion": "color",
            "precio": 33
        }
    Documentos ID 2
        {
            "titulo": "301 y una recetas frikis",
            "editorial": "RVC" ,
            "autor":  "Dabiz Muñoz",
            "genero": "Cocina",
            "paginas": 301,
            "portada": "blanda",
            "impresion": "bn",
            "precio": 40
        }

El tener los documentos guardados en una colección (en Elastis se llama INDICE) me permite 
recuperarlos a futuro, a través de su ID.. pero no hacer búsquedas (al menos en tiempos aceptables) sobre los mismos.

EN MONGO una query sería: De la colección LIBROS, quiero los documentos con campo PRECIO > 35
Esa búsqueda puede tardar tanto que sea inasumible... Se realiza mediante un FULLSCAN ... de todos los documentos, 
de todo su contenido. ESTO NO VALE !!!!

Las búsquedas en Mongo (y en ELASTIC) siempre se hacen a través de INDICES.

Para campos sencillos:
- Números
- Fechas
- Valores lógicos
Se usan indices normales.

Para campos de texto se usan índices invertidos.

    DOCUMENTO 1: 
        "titulo": "1000 y una Recetas (de cócina española)"
    DOCUMENTO 2:
        "titulo": "301 y una Recetas FRIKIS"
        
Para generar un índice invertido, se aplican varios pasos:

1- Tokenizar el texto (espacios, parentesis, corchetes, llaves, signos matemáticos)

        1000-y-una-Recetas-de-cócina-española
        301-y-una-Recetas-FRIKIS

2- Se normalizan los tokens (quitando acentos, mayusculas...)

        1000-y-una-recetas-de-cocina-espanola
        301-y-una-recetas-frikis

3- Se eliminan las palabras que no aportan significado (stop words)

        1000-*-*-recetas-*-cocina-espanola
        301-*-*-recetas-frikis

4- Puedo solicitar que se prescinda de información de GENERO, NUMERO... incluso quedarme solo con la RAIZ de la palabra

        1000-*-*-recet-*-cocin-espan
        301-*-*-recet-friki
        
    Para poder hacer ésto, estas herramientas incorporan diccionarios de un montón de idiomas.
    Por ejemplo, de los verbos se quedan con el infinitivo

5- Se ordenan los términos por separado, y se almacena su ubicación dentro de cada documento:

    1000            Documento 1 (posición 1)
    301             Documento 2 (posición 1)
    cocin           Documento 1 (posición 6)
    espan           Documento 1 (posición 7)
    friki           Documento 2 (posición 5)
    recet           Documento 1 (posición 4), Documento 2 (posición 4)
    
    ^^^^ ESO ES EL INDICE INVERTIDO !!!! sobre el que se hacen las búsquedas
    
BUSQUEDA: "RECETAS"
Lo primero que hace mongo (y elastic) es aplicar a los términos de búsqueda el mismo procedimiento que al generar el índice:

    RECETAS > recet

Se búsca "recet" en el INDICE INVERTIDO: documento 1 (4) , documento 2 (4)

SELECT * FROM mi_tabla WHERE titulo LIKE '%receta%'

El uso de "like" SOLO SOLO SOLO debería estar permitido con el % al final... Esto es perfecto.... o por en medio

SELECT * FROM mi_tabla WHERE titulo LIKE 'receta%'              < ESTA IDEAL para campos de formulario de AUTOCOMPLETAR
SELECT * FROM mi_tabla WHERE titulo LIKE 'receta%cocina%'

NUNCA DEBERIA USAR UN LIKE CON UN % al inicio => Esto implica un FULLSCAN siempre ! Y además un FULL SCAN con una 
operación muy compleja (comparaciónd e caratceres)

Un like con un % que no esté al principio, si puede resolverse mediante BUSQUEDAS BINARIAS en INDICES... va como un tiro.

Además, tenemos otro problema... se busca literalmente ese texto: "receta"... por lo que un registro con valor: "Receta"
no saldría.

    SELECT * FROM mi_tabla WHERE TO_UPPER(titulo) LIKE TO_UPPER('%receta%') ... EMPEORA MUCHO LAS COSAS !

Cuando usamos el LIKE, el tiempo de procesamiento se imputa al que hace la búsqueda (cada vez que se hace búsqueda).
Cuando usamos un índice invertido, el tiempo de procesamiento se imputa al cargar el documento (1 sola vez).

Ni hablar de plurales, generos, raices de palabras... SINONIMOS ! ni nada parecido.

Con indices invertidos tengo otra potencia... BUSCAR PALABRAS POR PROXIMIDAD.

    Elastic además permite otras búsqueda mucho más avanzadas:
        campo: IP: "192.168.0.0/24"
                    192.168.0.247 √
                    192.168.1.247 x
        geoespaciales: Los documentos cuyo campo "ubicación" no disten más de 5 kms de este punto.
    
    Una app tipo wallapop ---> con ES se monta en 5 min.

También permiten el uso de diccionarios de sinónimos.

ESTO NOS LLEVA A OTRO PUNTO de diferencia con las BBDD Relacionales.
En este tipo de BBDD los resultados de una query pueden llevar una puntuación asociada (que mide la relevancia del resultado)


---

## Neo4j

Base de datos orientada a grafos.

