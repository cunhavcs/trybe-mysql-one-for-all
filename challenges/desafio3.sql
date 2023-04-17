SELECT
	CONCAT(u.nome, ' ', sobrenome) AS pessoa_usuaria,
    COUNT(hr.usuario_id) AS musicas_ouvidas,
    ROUND(SUM(c.duracao_segundos) / 60, 2) AS total_minutos
FROM usuarios AS u
INNER JOIN historico_reproducoes AS hr
	ON u.usuario_id = hr.usuario_id
INNER JOIN cancoes AS c
	ON hr.cancao_id = c.cancao_id
GROUP BY pessoa_usuaria
ORDER BY pessoa_usuaria;
