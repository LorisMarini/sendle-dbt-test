/*
    This is the simplest model we can think of for the TICKETS table.
*/

-- Change the way this model is saved in the warehouse
{{ config(materialized='table') }}

-- Logic
select * from {{ source('zendesk', 'TICKETS') }} LIMIT 10
