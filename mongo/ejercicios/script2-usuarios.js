// Podemos poner comentarios usando la sintaxis de JavaScript
// O bien precediendolos de doble barra (la del 7)
// O bien encerrando un texto entre los simbolos "/*" y "*/"

/*
Esto sería un comentario en
varias lineas
*/

// Vamos a crear nuestra primera Base de datos en Mongo
use curso;
// Este comando nos posiciona en una base de datos para trabajar contra ella.
// Si la base de datos no existe se PRE-crea
// Mongo la creará en automático cuando hagamos el primer insert en ella.

// Hacemos una búsqueda en la colección usuarios
db.usuarios.find()
// OJO: Esta colección (tabla) a pesar de no existir aún, no me devuelve un error!!!!

// Dar de alta nuestro primer documento.
// Al hacerlos, Mongo va a crear la BBDD y la colección
db.usuarios.insertOne(
    {
        "nombre": "Ivan",
        "apellidos": "Osuna Ayuste",
        "edad": 44,
        "fecha nacimiento": ISODate("1978-08-27")
    }
)
//      "fecha nacimiento": ISODate("1978-08-27T00:00:00.000Z")
/*
RESPUESTA: 
{
  acknowledged: true,
  insertedId: ObjectId("63c67c0513ec1d361629a097")
}
*/
// insertOneInMongo # Camel Case . Se usa en JS, JAVA, C, C++
// insert_one_in_mongo # snake Case . Se usa en python

db.usuarios.find()
/*
RESPUESTA: 
[
  {
    _id: ObjectId("63c67c0513ec1d361629a097"),
    nombre: 'Ivan',
    apellidos: 'Osuna Ayuste',
    edad: 44,
    'fecha nacimiento': ISODate("1978-08-27T00:00:00.000Z")
  }
]
*/

// Buscar un documento por su ID
db.usuarios.find( { "_id":  ObjectId("63c67c0513ec1d361629a097") } )
// En SQL el quivalente sería:
// SELECT * FROM usuarios WHERE _id = 63c67c0513ec1d361629a097;

// Buscar los usuarios con nombre "Ivan"
db.usuarios.find( { "nombre":  "Ivan" } )



// Buscar un documento por su ID
db.usuarios.find( { "_id":  ObjectId("63c67c0513ec1d361629a097") } ).explain()
db.usuarios.find( { "nombre":  "Ivan" } ).explain()

db.usuarios.createIndex( { "nombre": 1 } )
// Este es un índice básico que permite hacer operaciones = != > < >= <=


db.usuarios.find( 
    { 
        "nombre":  { "$eq": "Ivan" }
    } 
)

db.usuarios.createIndex( { "nombre": "text" } )


db.usuarios.find( 
    { 
        "edad":  { "$gt": 40 }
    } 
)

// $eq -> IGUAL
// $gt -> MAYOR
// $gte -> MAYOR O IGUAL
// $lt -> MENOR
// $lte -> MENOR O IGUAL


db.usuarios.find( 
    { 
        "$text":  { "$search": "ivan" }
    } 
)

db.usuarios.createIndex( { "nombre": "text", "apellidos": "text" }, {"language": "spanish"} )

// Nos saca los usuarios con nombre y / o apellidos "ivan" "ayuste", pero 
// el los que los apellidos no contengan "osuna"
db.usuarios.find( { "$text": { "$search": "ivan ayuste -osuna" } })



db.usuarios.find( { "$text": { "$search": "ivan ayuste" } } , { "edad" : 1 } )
// SELECT id, edad FROM usuarios WHERE CONSTAINS(nombre || apellidos, "ivan ayuste")
db.usuarios.find( { "$text": { "$search": "ivan ayuste" } } , { "edad" : 0 } )
