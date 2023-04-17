SELECT
	  COUNT(c.cancao_id) AS cancoes,
    COUNT(DISTINCT a.album_id) AS albuns,
    COUNT(DISTINCT pa.artista_id) AS artistas
FROM cancoes AS c
INNER JOIN albuns AS a
	  ON c.album_id = a.album_id
INNER JOIN artistas AS pa
	  ON a.artista_id = pa.artista_id;
