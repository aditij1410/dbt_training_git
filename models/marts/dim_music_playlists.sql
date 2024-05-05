{{
    config(
        materialized='table'
    )
}}

select
    playlist_tracks.playlist_id,
    tracks.track_id,
    tracks.album_id,
    tracks.mediatype_id,
    tracks.genre_id,
    playlists.playlist_name,
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
    tracks.unit_price
from {{ ref('int_tracks_joined_to_albums_artist_genre_mediatype') }} as tracks
inner join {{ ref('stg_music__playlist_tracks') }} as playlist_tracks
    on tracks.track_id = playlist_tracks.track_id
inner join {{ ref('stg_music__playlists') }} as playlists
    on playlist_tracks.playlist_id = playlists.playlist_id