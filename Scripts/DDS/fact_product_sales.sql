use DDS
go

if exists 
  (select * from sys.tables
   where name = 'fact_product_sales')
drop table fact_product_sales
go

create table fact_product_sales
( sales_date_key     int       not null
, customer_key       int       not null
, product_key        int       not null
, store_key          int       not null
, order_id           int       not null
, line_number        int       not null
, quantity           int
, unit_price         smallmoney
, unit_cost          smallmoney
, sales_value        money
, sales_cost         money
, margin             money
, sales_timestamp    datetime
, source_system_code tinyint   not null
, create_timestamp   datetime  not null
, update_timestamp   datetime  not null
, constraint pk_fact_product_sales 
  primary key clustered (order_id, line_number)
  on dds_fg4
, constraint fk_fact_product_sales_dim_date
  foreign key (sales_date_key)
  references dim_date(date_key)
, constraint fk_fact_product_sales_dim_customer
  foreign key (customer_key)
  references dim_customer(customer_key)
, constraint fk_fact_product_sales_dim_product
  foreign key (product_key)
  references dim_product(product_key)
, constraint fk_fact_product_sales_dim_store
  foreign key (store_key)
  references dim_store(store_key)
) on dds_fg2
go

create index fact_product_sales_sales_date_key
  on fact_product_sales(sales_date_key)
  on dds_fg4
go

create index fact_product_sales_customer_key
  on fact_product_sales(customer_key)
  on dds_fg4
go

create index fact_product_sales_product_key
  on fact_product_sales(product_key)
  on dds_fg4
go

create index fact_product_sales_store_key
  on fact_product_sales(store_key)
  on dds_fg4
go
