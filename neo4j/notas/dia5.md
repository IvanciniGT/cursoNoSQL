# Syntaxis cypher

    Nodo (Objeto, vertice):                 ( )
    Relación (arista):                      <-[ ]-   -[ ]->  

Dentro de estos simbolos podemos escribir:

    Tipo de ralación o de nodo              :LABEL
    Propiedades                             { nombre_propiedad1: propvalue, nombre_propiedad2: propvalue2}
    Nombre de variable con la que           nombre_variable
        referirme al nodo o relación
    
Ejemplos:

    Nodo de tipo Persona                    (:Persona)
    Nodo de tipo Persona,                   (persona:Persona)
        guardandolo en una variable
        llamada persona
    Nodo cualquiera, guardándolo en        (nodo)
        una variable llamada nodo
    Nodo de tipo persona,                   (:Persona { nombre: "Ivan" })
        con la propiedad nombre 
        con valor Ivan
    Nodo de tipo persona,                   (ivan:Persona { nombre: "Ivan" })
        con la propiedad nombre 
        con valor Ivan
        guardandolo en una variable
        llamada ivan

OPERACIONES QUE QUIERO HACER:

    Sería el equivalente a un select            match XXXXX
        XXXX lo que quiero encontrar
        
                                                match (ivan:Persona { nombre: "Ivan" })
        Con esta sintaxis tendríamos una variable ivan para cada nodo de tipo 
        Persona con la propiedad nombre valiendo "Ivan"

    Crear un nodo                               merge XXXXXX
                                                create XXXXXX
                                            
                                                create (:Persona { nombre: "Ivan" })

    Devolver a quien pide la query un valor     return NOMBRE_DE_VARIABLE1,NOMBRE_DE_VARIABLE2

    Asignar un valor a una propiedad            set 