SELECT
    COUNT(hr.cancao_id) AS musicas_no_historico
FROM historico_reproducoes AS hr
INNER JOIN usuarios AS u
	  ON hr.usuario_id = u.usuario_id
WHERE u.nome = 'Barbara' AND u.sobrenome = 'Liskov';
