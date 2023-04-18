SELECT
	ar.artista,
    al.album,
    COUNT(sa.usuario_id) AS pessoas_seguidoras
FROM artistas AS ar
INNER JOIN albuns AS al
	ON ar.artista_id = al.artista_id
INNER JOIN seguidores_artistas AS sa
	ON ar.artista_id = sa.artista_id
GROUP BY ar.artista, al.album
ORDER BY
	pessoas_seguidoras DESC,
    ar.artista,
    al.album;
