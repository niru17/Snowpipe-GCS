use role accountadmin;

create database snowpipe;

create or replace table orders_data_lz(
        order_id int,
        product varchar(20),
        quantity int,
        order_status varchar(30),
        order_date date
);

create or replace storage integration gcs_bucket_read_int
type=external_stage
storage_provider=gcs
enabled=true
storage_allowed_locations=('gcs://data-for_snowpipe');

desc storage integration gcs_bucket_read_int;

create or replace stage snowpipe_stage
url='gcs://data-for_snowpipe'
storage_integration =gcs_bucket_read_int;


show stages;

list @snowpipe_stage;

create or replace notification integration notification_from_pubsub_int
type=queue
notification_provider=gcp_pubsub
enabled=True
gcp_pubsub_subscription_name='projects/fit-legacy-454720-g4/subscriptions/snowpipe_pubsub-sub';

desc integration notification_from_pubsub_int;

create or replace pipe gsc_to_snowflake_pipe
auto_ingest=true
integration=notification_from_pubsub_int
as
copy into orders_data_lz
from @snowpipe_stage
file_format=(type='csv');

show pipes;


select system$pipe_status('gsc_to_snowflake_pipe');


select * from table(information_schema.copy_history(table_name=>'orders_data_lz',start_time=>dateadd(hours, -1, current_timestamp())));

select * from orders_data_lz;

Alter pipe gsc_to_snowflake_pipe set pipe_execution_paused=true;



