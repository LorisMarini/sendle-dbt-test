/*
    This is the simplest model we can think of for the TICKETS table.
*/

{{ config(tags=["zendesk"]) }}


select * from {{ source('zendesk', 'TICKETS') }} LIMIT 10
