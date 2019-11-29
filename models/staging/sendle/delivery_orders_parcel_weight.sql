
-- Change the way this model is saved in the warehouse
-- Assign a schema as well, to overrite the default dbt schema naming
{{ config(schema='core', materialized='view') }}

-- Actual model
select
ID, SENDER_ID, ORIGIN_COUNTRY_ISO_2, STATE, WEIGHT, CUBIC_METRE_VOLUME,
case
    when ORIGIN_COUNTRY_ISO_2='AU' then 'kg'
    when ORIGIN_COUNTRY_ISO_2='US' then 'lb'
    else ''
end as WEIGHT_UNITS
from {{ source('sendle', 'DELIVERY_ORDERS_BARE') }}
