SELECT
	  CONCAT(u.nome, ' ', sobrenome) AS pessoa_usuaria,
    IF(DATE(MAX(hr.data_reproducao)) >= '2021-01-01', 'Ativa', 'Inativa')
		    AS status_pessoa_usuaria
FROM usuarios AS u
INNER JOIN historico_reproducoes AS hr
	  ON u.usuario_id = hr.usuario_id
GROUP BY pessoa_usuaria
ORDER BY pessoa_usuaria;
