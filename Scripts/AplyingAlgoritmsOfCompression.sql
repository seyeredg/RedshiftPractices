---- It contains a cartesion product is not recomendable to do that

SELECT * FROM venue LIMIT 10;
SELECT COUNT(0) FROM venue;
SELECT COUNT(*) FROM listing;
SELECT COUNT(*) FROM cartesian_venue;

SELECT venueid, venuename, venuecity, venuestate, venueseats
FROM venue
LIMIT 10;

CREATE TABLE cartesian_venue as(
SELECT venueid, venuename, venuecity, venuestate, venueseats
FROM venue, listing);

SELECT *
FROM cartesian_venue
LIMIT 10;

CREATE TABLE encoding_venue (
nameraw varchar(100) encode raw,
namebytedict varchar(100) encode bytedict,
namelzo varchar(100) encode lzo,
namerunlength varchar(100) encode runlength,
nametext255 varchar(100) encode text255,
nametext32k varchar(100) encode text32k,
namezstd varchar(100) encode zstd
);

INSERT INTO encoding_venue 
(
SELECT venuename, venuename, venuename, venuename, venuename, venuename, venuename
FROM cartesian_venue 
);

SELECT * FROM encoding_venue LIMIT 10;

SELECT COUNT(0)
FROM encoding_venue;