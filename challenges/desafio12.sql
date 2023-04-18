SELECT
	  ar.artista,
    CASE
		WHEN COUNT(cf.usuario_id) >= 5 THEN 'A'
        WHEN COUNT(cf.usuario_id) = 4 OR COUNT(cf.usuario_id) = 3 THEN 'B'
        WHEN COUNT(cf.usuario_id) = 2 OR COUNT(cf.usuario_id) = 1 THEN 'C'
        ELSE '-'
	  END AS ranking
FROM artistas AS ar
INNER JOIN albuns AS al
	  ON al.artista_id = ar.artista_id
INNER JOIN cancoes AS c
	  ON al.album_id = c.album_id
LEFT JOIN cancoes_favoritas AS cf
	  ON c.cancao_id = cf.cancao_id
GROUP BY ar.artista
ORDER BY
	  IF (ranking = '-', 1, 0), ranking,
    ar.artista;
