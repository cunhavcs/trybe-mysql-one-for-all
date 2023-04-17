SELECT
	  COUNT(c.cancao_id) AS cancoes,
    COUNT(DISTINCT a.album_id) AS albuns,
    COUNT(DISTINCT pa.pessoa_artista_id) AS artistas
FROM cancao AS c
INNER JOIN album AS a
	  ON c.album_id = a.album_id
INNER JOIN pessoa_artista AS pa
	  ON a.pessoa_artista_id = pa.pessoa_artista_id;