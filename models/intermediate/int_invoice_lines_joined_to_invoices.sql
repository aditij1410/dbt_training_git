select
    invoice_lines.invoice_lineid,
    invoice_lines.invoice_id,
    invoice_lines.track_id,
    invoices.customer_id,
    invoices.invoice_date_est,
    invoices.billing_address,
    invoices.billing_city,
    invoices.billing_state,
    invoices.billing_country,
    invoices.billing_zipcode,
    invoice_lines.quantity_purchased,
    invoice_lines.invoice_lineitem_revenue_usd
from {{ ref('stg_music__invoice_lines') }} as invoice_lines
left join {{ ref('stg_music__invoices') }} as invoices
    on invoice_lines.invoice_id = invoices.invoice_id