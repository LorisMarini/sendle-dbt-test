{% docs stg_zendesk_tickets %}

### Zendesk Tickets

This table contains the ID of each ticket created in Zendesk. The events are
ingested through the Zendesk API and piped into the warehouse on an hourly basis.

### Json to Table Conversion
At the moment this happens through the Singer tap for Zendesk via the managed
ETL service "Stitch Data". For details of the schema conversion refer to
[stitch docs](https://www.stitchdata.com/docs/integrations/saas/zendesk#tickets)

### See ya :)!

{% enddocs %}
