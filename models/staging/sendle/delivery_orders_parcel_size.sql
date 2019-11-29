
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
end as WEIGHT_UNITS,
case
    when ((WEIGHT is null) or (CUBIC_METRE_VOLUME is null)) then null
    when greatest(WEIGHT, CUBIC_METRE_VOLUME*250) <= 0.5 then 'A: 500g/A5'
    when greatest(WEIGHT, CUBIC_METRE_VOLUME*250) between 0.5 and 1 then 'B: 1kg/6L'
    when greatest(WEIGHT, CUBIC_METRE_VOLUME*250) between 1 and 2 then 'C: 2kg/8L'
    when greatest(WEIGHT, CUBIC_METRE_VOLUME*250) between 2 and 3 then 'D: 3kg/12L'
    when greatest(WEIGHT, CUBIC_METRE_VOLUME*250) between 3 and 5 then 'E: 5kg/20L'
    when greatest(WEIGHT, CUBIC_METRE_VOLUME*250) between 5 and 10 then 'F: 10kg/40L'
    when greatest(WEIGHT, CUBIC_METRE_VOLUME*250) between 10 and 18 then 'G: 18kg/72L'
    when greatest(WEIGHT, CUBIC_METRE_VOLUME*250) between 18 and 25 then 'G: 25kg/100L'
    when greatest(WEIGHT, CUBIC_METRE_VOLUME*250) > 25 then 'H: >25kg/100L'
end as PARCEL_SIZE
from {{ ref('delivery_orders_parcel_weight') }}
