{{
    config(
        materialized='table'
    )
}}

select
    invoices.invoice_lineid,
    invoices.invoice_id,
    tracks.track_id,
    tracks.album_id,
    tracks.mediatype_id,
    tracks.genre_id,
    customers.customer_id,
    customers.employee_id,
    invoices.invoice_date_est,
    invoices.billing_state,
    invoices.billing_country,
    invoices.quantity_purchased,
    invoices.invoice_lineitem_revenue_usd,
    tracks.track_name,
    tracks.track_composer,
    tracks.album_title,
    tracks.artist_name,
    tracks.mediatype_name,
    tracks.genre_name,
    tracks.track_length_ms,
    tracks.track_length_seconds,
    tracks.track_length_minutes,
    tracks.bytes,
    customers.customer_mailing_state,
    customers.customer_mailing_country,
    customers.customer_email_address,
    customers.employee_name,
    customers.employee_title,
    customers.employee_city,
    customers.employee_state,
    customers.employee_country
from {{ ref('int_invoice_lines_joined_to_invoices') }} as invoices
inner join {{ ref('int_customers_joined_to_employees') }} as customers
    on invoices.customer_id = customers.customer_id
inner join {{ ref('int_tracks_joined_to_albums_artist_genre_mediatype') }} as tracks
    on invoices.track_id = tracks.track_id