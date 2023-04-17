SELECT
	  c.cancao,
    COUNT(hr.cancao_id) AS reproducoes
FROM cancoes AS c
INNER JOIN historico_reproducoes AS hr
	  ON c.cancao_id = hr.cancao_id
GROUP BY cancao
ORDER BY reproducoes DESC, cancao
LIMIT 2;
