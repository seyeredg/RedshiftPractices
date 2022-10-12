SELECT 'hola mundo¡¡' texto;
CREATE table estudiante(
id int2
nombre varchar(30),
pais_id int2
);

CREATE table pais (
psid_id int2,
nombre varchar(60),
pais_is int2 
);
INSERT into estuadiante values (1,'David',1),(2,'Rocio',1),(3,'Carlos');
INSERT into pai values (1,'Colombia'),(3,'Mexico')

SELECT * FROM estudiamnte
inner join pais p 
on e.pais_id = p.pais_id;