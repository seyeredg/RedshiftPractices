CREATE TABLE estudiante (
id int2,
nombre varchar(20),
apellido varchar(20),
edad int2,
fecha_ingreso date
);

SELECT * FROM estudiante;

copy estudiante FROM 's3://mibucketredshift/primer_cargue.csv'
credentials 'aws_iam_role=arn:aws:iam::XXXXXX:role/MiRolRedshift'
region 'us-east-2'
delimiter ';'
ignoreheader 1
ignoreblanklines;

TRUNCATE TABLE estudiante;

copy estudiante FROM 's3://mibucketredshift/primer_cargue.csv'
credentials 'aws_iam_role=arn:aws:iam::XXXXXX:role/MiRolRedshift'
region 'us-east-2'
delimiter ';'
ignoreheader 1
ignoreblanklines
blanksasnull;

copy estudiante FROM 's3://mibucketredshift/segundo_cargue.csv'
credentials 'aws_iam_role=arn:aws:iam::XXXXXX:role/MiRolRedshift'
region 'us-east-2'
delimiter ';'
ignoreheader 1
ignoreblanklines
blanksasnull
dateformat 'mm-dd-yyyy';