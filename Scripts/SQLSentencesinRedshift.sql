copy users from 's3://<mybucket>/tickitdb/allusers_pipe.txt' 
iam_role '<Arn Rol>' 
delimiter '|' region 'us-east-1';

copy venue from 's3://<mybucket>/tickitdb/venue_pipe.txt' 
iam_role '<Arn Rol>' 
delimiter '|' region 'us-east-1';

copy category from 's3://<mybucket>/tickitdb/category_pipe.txt' 
iam_role '<Arn Rol>' 
delimiter '|' region 'us-east-1';

copy date from 's3://<mybucket>/tickitdb/date2008_pipe.txt' 
iam_role '<Arn Rol>' 
delimiter '|' region 'us-east-1';

copy event from 's3://<mybucket>/tickitdb/allevents_pipe.txt' 
iam_role '<Arn Rol>' 
delimiter '|' timeformat 'YYYY-MM-DD HH:MI:SS' region 'us-east-1';

copy listing from 's3://<mybucket>/tickitdb/listings_pipe.txt' 
iam_role '<Arn Rol>' 
delimiter '|' region 'us-east-1';

copy sales from 's3://<mybucket>/tickitdb/sales_tab.txt'
iam_role '<Arn Rol>'
delimiter '\t' timeformat 'MM/DD/YYYY HH:MI:SS' region 'us-east-1';




SELECT * FROM sales LIMIT 10;

SELECT COUNT(0) FROM listing;