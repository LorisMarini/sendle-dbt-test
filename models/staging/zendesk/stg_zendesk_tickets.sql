

select * from {{ source('zendesk_one', 'TICKETS') }}
