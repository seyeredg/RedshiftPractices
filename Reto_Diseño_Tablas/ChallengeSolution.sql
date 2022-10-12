------------------------------------------------------------------------


analyze compression customer;

CREATE table if not exists public.customer_pro 
(
  c_custkey      INTEGER NOT null encode az64 distkey,
  c_name         VARCHAR(25) NOT null encode zstd,
  c_address      VARCHAR(25) NOT null encode zstd,
  c_city         VARCHAR(10) NOT null encode bytedict,
  c_nation       VARCHAR(15) NOT null encode bytedict,
  c_region       VARCHAR(12) NOT null encode bytedict,
  c_phone        VARCHAR(15) NOT null encode zstd,
  c_mktsegment   VARCHAR(10) NOT null encode bytedict
)
;

insert into customer_pro (select * from customer);

------------------------------------------------------------------------

analyze compression part;


CREATE table if not exists public.part_pro
(
  p_partkey     INTEGER NOT null encode delta distkey,
  p_name        VARCHAR(22) NOT null encode text255,
  p_mfgr        VARCHAR(6) NOT null encode zstd,
  p_category    VARCHAR(7) NOT null encode bytedict,
  p_brand1      VARCHAR(9) NOT null encode zstd,
  p_color       VARCHAR(11) NOT null encode bytedict,
  p_type        VARCHAR(25) NOT null encode bytedict,
  p_size        INTEGER NOT null encode az64,
  p_container   VARCHAR(10) NOT null encode bytedict
);

insert into part_pro (select * from part);



------------------------------------------------------------------------


analyze compression supplier;



CREATE table if not exists public.supplier_pro
(
  s_suppkey   INTEGER NOT null encode az64 distkey,
  s_name      VARCHAR(25) NOT null encode zstd,
  s_address   VARCHAR(25) NOT null encode zstd,
  s_city      VARCHAR(10) NOT null encode bytedict,
  s_nation    VARCHAR(15) NOT null encode bytedict,
  s_region    VARCHAR(12) NOT null encode bytedict,
  s_phone     VARCHAR(15) NOT null encode zstd
);

insert into supplier_pro (select * from supplier);


------------------------------------------------------------------------


analyze compression dwdate ;

CREATE table if not exists public.dwdate_pro
(
  d_datekey            INTEGER NOT null encode raw distkey,
  d_date               VARCHAR(19) NOT null encode zstd,
  d_dayofweek          VARCHAR(10) NOT null encode raw,
  d_month              VARCHAR(10) NOT null encode raw,
  d_year               INTEGER NOT null encode raw,
  d_yearmonthnum       INTEGER NOT null encode raw,
  d_yearmonth          VARCHAR(8) NOT null encode raw,
  d_daynuminweek       INTEGER NOT null encode raw,
  d_daynuminmonth      INTEGER NOT null encode raw,
  d_daynuminyear       INTEGER NOT null encode raw,
  d_monthnuminyear     INTEGER NOT null encode raw,
  d_weeknuminyear      INTEGER NOT null encode raw,
  d_sellingseason      VARCHAR(13) NOT null encode raw,
  d_lastdayinweekfl    VARCHAR(1) NOT null encode raw,
  d_lastdayinmonthfl   VARCHAR(1) NOT null encode raw,
  d_holidayfl          VARCHAR(1) NOT null encode raw,
  d_weekdayfl          VARCHAR(1) NOT null encode raw
);

insert into dwdate_pro (select * from dwdate);


------------------------------------------------------------------------


analyze compression lineorder ;

CREATE table if not exists public.lineorder_pro
(
  lo_linenumber        INTEGER NOT null encode delta32k distkey,
  lo_orderkey          INTEGER NOT null encode az64,
  lo_custkey           INTEGER NOT null encode az64,
  lo_partkey           INTEGER NOT null encode az64,
  lo_suppkey           INTEGER NOT null encode az64,
  lo_orderdate         INTEGER NOT null encode az64,
  lo_orderpriority     VARCHAR(15) NOT null encode bytedict,
  lo_shippriority      VARCHAR(1) NOT null encode zstd,
  lo_quantity          INTEGER NOT null encode az64,
  lo_extendedprice     INTEGER NOT null encode zstd,
  lo_ordertotalprice   INTEGER NOT null encode zstd,
  lo_discount          INTEGER NOT null encode az64,
  lo_revenue           INTEGER NOT null encode zstd,
  lo_supplycost        INTEGER NOT null encode az64,
  lo_tax               INTEGER NOT null encode az64,
  lo_commitdate        INTEGER NOT null encode az64,
  lo_shipmode          VARCHAR(10) NOT null encode bytedict
);

insert into lineorder_pro (select * from lineorder);

