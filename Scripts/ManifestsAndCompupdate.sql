copy estudiante FROM 's3://mibucketredshift/tercer_cargue.csv'
credentials 'aws_iam_role=arn:aws:iam::XXXXXX:role/MiRolRedshift'
region 'us-east-2'
fixedwidth '0:1,1:9,2:9,3:2,4:10'
dateformat 'mm-dd-yyyy';

{
    "entries": [
        {"url":"s3://mibucketredshift/cargue_1.csv", "mandatory":true},
        {"url":"s3://mibucketredshift/cargue_2.csv", "mandatory":true}
    ]
}

copy estudiante FROM 's3://mibucketredshift/test.manifest'
credentials 'aws_iam_role=arn:aws:iam::XXXXXX:role/MiRolRedshift'
delimiter ';'
ignoreheader 1
manifest
region 'us-east-2';


copy sales_compression_on FROM 's3://mibucketredshift/sales_tab.txt'
credentials 'aws_iam_role=arn:aws:iam::XXXXXX:role/MiRolRedshift'
delimiter '\t' timeformat 'MM/DD/YYYY HH:MI:SS' COMPUPDATE ON region 'us-east-2';

copy sales_compression_off FROM 's3://mibucketredshift/sales_tab.txt'
credentials 'aws_iam_role=arn:aws:iam::XXXXXX:role/MiRolRedshift'
delimiter '\t' timeformat 'MM/DD/YYYY HH:MI:SS' COMPUPDATE OFF region 'us-east-2';

SELECT * 
FROM pg_table_def
WHERE tablename = 'sales_compression_on';

SELECT * 
FROM pg_table_def
WHERE tablename = 'sales_compression_off';