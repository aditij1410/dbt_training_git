-- This model captures all the attributes related to any track, their price, creator etc.

{{
    config(
        materialized='table'
    )
}}

select
    track_id,
    album_id,
    mediatype_id,
    genre_id,
    track_name,
    track_composer,
    album_title,
    artist_name,
    mediatype_name,
    genre_name,
    track_length_ms,
    track_length_seconds,
    track_length_minutes,
    bytes,
    unit_price
from {{ ref('int_tracks_joined_to_albums_artist_genre_mediatype') }}