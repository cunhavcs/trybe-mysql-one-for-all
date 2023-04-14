DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE SpotifyClone.plano (
    plano_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_plano VARCHAR(32) NOT NULL,
    valor_plano DECIMAL(5,2) NOT NULL,
) engine = InnoDB;

CREATE TABLE SpotifyClone.pessoa_artista (
    pessoa_artista_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_pessoa_artista VARCHAR(32)
) engine = InnoDB;

INSERT INTO SpotifyClone.plano (
    nome_plano,
    valor_plano
) VALUES
    ('gratuito', 0),
    ('universitário', 5.99),
    ('pessoal', 6.99),
    ('familiar', 7.99);

INSERT INTO SpotifyClone.pessoa_artista (
    nome_pessoa_artista
) VALUES
    ('Baco Exu do Blues'),
    ('Beyoncé'),
    ('Blind Guardian'),
    ('Elis Regina')
    ('Nina Simone')
    ('Queen');