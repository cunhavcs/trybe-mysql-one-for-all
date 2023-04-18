SELECT
	  ar.artista,
    al.album
FROM artistas AS ar
INNER JOIN albuns AS al
	  ON ar.artista_id = al.artista_id
WHERE artista = 'Elis Regina'
ORDER BY al.album;
