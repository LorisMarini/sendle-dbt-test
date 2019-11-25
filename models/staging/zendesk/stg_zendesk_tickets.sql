/*
    This is the simplest model we can think of for the TICKETS table.
*/

-- Set the model to be materialized as a view in the warehouse
{{ config(materialized='view') }}

-- select * from {{ source('zendesk_one', 'TICKETS') }}
select 1 as number
