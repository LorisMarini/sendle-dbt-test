
-- Change the way this model is saved in the warehouse
-- Assign a schema as well, to overrite the default dbt schema naming
{{ config(schema='core', materialized='view') }}

-- Actual model
select
  ID,
  SENDER_ID,
  RECEIVER_ID,
  STATE
from {{ source('sendle', 'DELIVERY_ORDERS_BARE') }}
limit 100
