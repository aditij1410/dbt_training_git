select
    tracks.track_id,
    tracks.album_id,
    tracks.mediatype_id,
    tracks.genre_id,
    tracks.track_name,
    tracks.track_composer,
    albums.album_title,
    artists.artist_name,
    media_types.mediatype_name,
    genres.genre_name,
    tracks.track_length_ms,
    tracks.track_length_seconds,
    tracks.track_length_minutes,
    tracks.bytes,
    tracks.unit_price
from {{ ref('stg_music__tracks') }} as tracks
left join {{ ref('stg_music__albums') }} as albums
    on tracks.album_id = albums.album_id
left join {{ ref('stg_music__artists') }} as artists
    on albums.artist_id = artists.artist_id
left join {{ ref('stg_music__genres') }} as genres
    on tracks.genre_id = genres.genre_id
left join {{ ref('stg_music__media_types') }} as media_types
    on tracks.mediatype_id = media_types.mediatype_id