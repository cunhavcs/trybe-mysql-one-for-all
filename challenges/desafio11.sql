SELECT
	  al.album,
    COUNT(cf.cancao_id) AS favoritadas
FROM cancoes AS c
INNER JOIN albuns AS al
	  ON c.album_id = al.album_id
INNER JOIN cancoes_favoritas AS cf
	  ON c.cancao_id = cf.cancao_id
GROUP BY c.album_id
ORDER BY
	  favoritadas DESC,
    al.album
LIMIT 3;
