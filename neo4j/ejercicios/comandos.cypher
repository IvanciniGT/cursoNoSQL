MATCH (p:Persona{nombre:"Tom Hanks"})-[a:Actuo]->(m:Pelicula)<-[a2:Actuo]-(p2:Persona) RETURN p2
MATCH (p:Persona{nombre:"Tom Hanks"})-[a:Actuo]->(m:Pelicula)<-[a2:Actuo]-(p2:Persona) RETURN p,a,m, a2, p2
MATCH (p:Persona{nombre:"Tom Hanks"})-[a:Actuo]->(m:Pelicula) RETURN p,a,m
MATCH (p:Persona{nombre:"Tom Hanks"})-[a]->(m:Pelicula) RETURN p,a,m
MATCH (p:Persona)-[a]->(m:Pelicula) RETURN p,a,m
MATCH (p:Persona)-[a:Actuo]->(m:Pelicula) RETURN p,a,m
LOAD CSV WITH HEADERS FROM 'https://data.neo4j.com/intro/movies/actors.csv' AS row MATCH (p:Persona {nombre: row.person}) MATCH (m:Pelicula {titulo: row.movie}) MERGE (p)-[a:Actuo]->(m) ON CREATE SET a.papeles=split(row.roles,";")
LOAD CSV WITH HEADERS FROM 'https://data.neo4j.com/intro/movies/actors.csv' AS row RETURN row
MATCH (p:Persona)-[r:Dirigio]->(m:Pelicula) RETURN p,r,m
MATCH (p:Persona)-[r]->(m:Pelicula) RETURN p,r,m
MATCH (p:Persona)-[]->(m:Pelicula) RETURN p,m
MATCH (p:Persona)-[]->(:Pelicula) RETURN p
MATCH (p:Persona) RETURN p
MATCH (p:Persona)-[d:Dirigio]->(m:Pelicula) RETURN p,d,m
LOAD CSV WITH HEADERS FROM 'https://data.neo4j.com/intro/movies/directors.csv' AS row MATCH (p:Persona {nombre: row.person}) MATCH (m:Pelicula {titulo: row.movie}) MERGE (p)-[:Dirigio]->(m)
LOAD CSV WITH HEADERS FROM 'https://data.neo4j.com/intro/movies/directors.csv' AS row RETURN row
LOAD CSV WITH HEADERS FROM 'https://data.neo4j.com/intro/movies/directors.csv' AS row MATCH (p:Persona {nombre: row.person}) MATCH (m:Pelicula {titulo: row.movie}) RETURN p,m
LOAD CSV WITH HEADERS FROM 'https://data.neo4j.com/intro/movies/actors.csv' AS row MATCH (p:Persona {nombre: row.person}) MATCH (m:Pelicula {titulo: row.movie}) RETURN p,m
LOAD CSV WITH HEADERS FROM 'https://data.neo4j.com/intro/movies/actors.csv' AS row MATCH (p:Persona {nombre: row.person}) RETURN p
LOAD CSV WITH HEADERS FROM 'https://data.neo4j.com/intro/movies/actors.csv' AS row RETURN row
match (objeto) return objeto
MATCH (persona:Persona) RETURN persona
MATH (persona:Persona) RETURN persona
LOAD CSV WITH HEADERS FROM 'https://data.neo4j.com/intro/movies/people.csv' AS row CREATE (:Persona { nombre: row.name, nacimiento: toInteger(row.born) })
LOAD CSV WITH HEADERS FROM 'https://data.neo4j.com/intro/movies/people.csv' AS row RETURN row
MATCH (pelicula:Pelicula) RETURN pelicula
LOAD CSV WITH HEADERS FROM 'https://data.neo4j.com/intro/movies/movies.csv' AS row CREATE (:Pelicula { titulo: row.title, fecha: toInteger(row.released), eslogan: row.tagline })
MATCH (unapelicula:Pelicula) DELETE unapelicula
MATCH (pelicula:Pelicula) RETURN pelicula