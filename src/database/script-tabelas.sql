-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql server
*/
CREATE DATABASE BojackHorseman;
USE BojackHorseman;

drop database bojackhorseman;

CREATE TABLE Usuario (
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
email VARCHAR(45),
senha VARCHAR(200)
);

CREATE TABLE Quiz (
    idquiz INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(45),
    descricao VARCHAR(45),
    data DATETIME
);

CREATE TABLE Personagem (
    idQuiz INT AUTO_INCREMENT PRIMARY KEY,
    fkCadastro INT,
    fkQuiz INT,
    personagens VARCHAR(50),
    Texto VARCHAR(200),
    FOREIGN KEY (fkCadastro) REFERENCES Usuario(idUsuario),
    FOREIGN KEY (fkQuiz) REFERENCES quiz(idquiz)
);

CREATE TABLE Pergunta (
    idPergunta INT AUTO_INCREMENT PRIMARY KEY,
    fk_quiz INT,
    Texto VARCHAR(200),
    FOREIGN KEY (fk_quiz) REFERENCES quiz(idquiz)
);

CREATE TABLE Alternativa (
    idAlternativa INT AUTO_INCREMENT PRIMARY KEY,
    texto VARCHAR(200),
    letra CHAR(1),
    fkPergunta INT,
    Pergunta_fk_quiz INT,
    FOREIGN KEY (fkPergunta) REFERENCES Pergunta(idPergunta),
    FOREIGN KEY (Pergunta_fk_quiz) REFERENCES quiz(idquiz)
);

