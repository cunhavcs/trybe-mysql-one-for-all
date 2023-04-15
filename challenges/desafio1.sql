DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

CREATE TABLE plano (
    plano_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_plano VARCHAR(32) NOT NULL,
    valor_plano DECIMAL(5,2) NOT NULL
) engine = InnoDB;

CREATE TABLE pessoa_artista (
    pessoa_artista_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_pessoa_artista VARCHAR(32) NOT NULL
) engine = InnoDB;

CREATE TABLE pessoa_usuaria (
    pessoa_usuaria_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_pessoa_usuaria VARCHAR(32) NOT NULL,
    sobrenome_pessoa_usuaria VARCHAR(32) NOT NULL,
    idade INT NOT NULL,
    plano_id INT NOT NULL,
    data_assinatura DATE NOT NULL,
    FOREIGN KEY (plano_id) REFERENCES plano(plano_id)
) engine = InnoDB;

CREATE TABLE seguindo_pessoa_artista (
    -- seguindo_pessoa_artista_id INT PRIMARY KEY AUTO_INCREMENT,
    pessoa_usuaria_id INT NOT NULL,
    pessoa_artista_id INT NOT NULL,
    PRIMARY KEY (pessoa_usuaria_id, pessoa_artista_id),
    FOREIGN KEY (pessoa_usuaria_id) REFERENCES pessoa_usuaria(pessoa_usuaria_id),
    FOREIGN KEY (pessoa_artista_id) REFERENCES pessoa_artista(pessoa_artista_id)
) engine = InnoDB;

CREATE TABLE album (
    album_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_album VARCHAR(32) NOT NULL,
    pessoa_artista_id	INT NOT NULL,
    ano_lancamento_album INT NOT NULL,
    FOREIGN KEY (pessoa_artista_id) REFERENCES pessoa_artista(pessoa_artista_id)
) engine = InnoDB;

CREATE TABLE cancao (
    cancao_id	INT PRIMARY KEY AUTO_INCREMENT,
    nome_cancao	VARCHAR(64) NOT NULL,
    duracao_segundos_cancao	INT NOT NULL,
    album_id INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES album(album_id)
) engine = InnoDB;

CREATE TABLE reproducao (
    -- reproducao_id	INT PRIMARY KEY AUTO_INCREMENT,
    pessoa_usuaria_id	INT NOT NULL,
    cancao_id	INT NOT NULL,
    data_reproducao	DATETIME NOT NULL,
    PRIMARY KEY (pessoa_usuaria_id, cancao_id),
    FOREIGN KEY (pessoa_usuaria_id) REFERENCES pessoa_usuaria(pessoa_usuaria_id),
    FOREIGN KEY (cancao_id) REFERENCES cancao(cancao_id)
) engine = InnoDB;

INSERT INTO plano (
    nome_plano,
    valor_plano
) VALUES
    ('gratuito', 0),
    ('universitário', 5.99),
    ('pessoal', 6.99),
    ('familiar', 7.99);

INSERT INTO pessoa_artista (
    nome_pessoa_artista
) VALUES
    ('Baco Exu do Blues'),
    ('Beyoncé'),
    ('Blind Guardian'),
    ('Elis Regina'),
    ('Nina Simone'),
    ('Queen');

INSERT INTO pessoa_usuaria (
    nome_pessoa_usuaria,
    sobrenome_pessoa_usuaria,
    idade,
    plano_id,
    data_assinatura
) VALUES
    ('Barbara', 'Liskov', 82, 1, '2019-10-20'),
    ('Robert', 'Cecil Martin', 58, 1, '2017-01-06'),
    ('Ada', 'Lovelace', 37, 4, '2017-12-30'),
    ('Martin', 'Fowler', 46, 4, '2017-01-17'),
    ('Sandi', 'Metz', 58, 4, '2018-04-29'),
    ('Paulo', 'Freire', 19, 2, '2018-02-14'),
    ('Bell', 'Hooks', 26, 2, '2018-01-05'),
    ('Christopher', 'Alexander', 85, 3, '2019-06-05'),
    ('Judith', 'Butler', 45, 3, '2020-05-13'),
    ('Jorge', 'Amado', 58, 3, '2017-02-17');

INSERT INTO seguindo_pessoa_artista (
    pessoa_usuaria_id,
    pessoa_artista_id
) VALUES
    (1, 2),
    (1, 6),
    (1, 4),
    (2, 2),
    (2, 4),
    (3, 6),
    (4, 1),
    (5, 3),
    (5, 5),
    (6, 5),
    (6, 2),
    (7, 5),
    (9, 4),
    (10, 6);

INSERT INTO album (
    nome_album,
    pessoa_artista_id,
    ano_lancamento_album
) VALUES
    ('Renaissance', 2, 2022),
    ('Jazz', 6, 1978),
    ('Hot Space', 6, 1982),
    ('Falso Brilhante', 4, 1998),
    ('Vento de Maio', 4, 2001),
    ('QVVJFA?', 1, 2003),
    ('Somewhere Far Beyond', 3, 2007),
    ('I Put A Spell On You', 5, 2012);

INSERT INTO cancao (
    nome_cancao,
    duracao_segundos_cancao,
    album_id
) VALUES
    ("BREAK MY SOUL", 279, 1),
    ("VIRGO'S GROOVE", 369, 1),
    ("ALIEN SUPERSTAR", 118, 1),
    ("Don't Stop Me Now", 203, 2),
    ("Under Pressure", 152, 3),
    ("Como Nossos Pais", 105, 4),
    ("O Medo de Amar é o Medo de Ser Livre", 207, 5),
    ("Samba em Paris", 267, 6),
    ("The Bard's Song", 244, 7),
    ("Feeling Good", 100, 8);

INSERT INTO reproducao (
    pessoa_usuaria_id,
    cancao_id,
    data_reproducao
) VALUES
    (1, 8, '2022-02-28 10:45:55'),
    (1, 2, '2020-05-02 05:30:35'),
    (1, 10, '2020-03-06 11:22:33'),
    (2, 10, '2022-08-05 08:05:17'),
    (2, 7, '2020-01-02 07:40:33'),
    (3, 10, '2020-11-13 16:55:13'),
    (3, 2, '2020-12-05 18:38:30'),
    (4, 8, '2021-08-15 17:10:10'),
    (5, 8, '2022-01-09 01:44:33'),
    (5, 5, '2020-08-06 15:23:43'),
    (6, 7, '2017-01-24 00:31:17'),
    (6, 1, '2017-10-12 12:35:20'),
    (7, 4, '2011-12-15 22:30:49'),
    (8, 4, '2012-03-17 14:56:41'),
    (9, 9, '2022-02-24 21:14:22'),
    (10, 3, '2015-12-13 08:30:22');