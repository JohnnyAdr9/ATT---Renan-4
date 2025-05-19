CREATE DATABASE FilmesBrasileirosDB;
USE FilmesBrasileirosDB;



CREATE TABLE Diretores (
    DiretorID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100)
);


CREATE TABLE Generos (
    GeneroID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(50)
);


CREATE TABLE Filmes (
    FilmeID INT PRIMARY KEY AUTO_INCREMENT,
    Titulo VARCHAR(100),
    Ano INT,
    DiretorID INT,
    GeneroID INT,
    FOREIGN KEY (DiretorID) REFERENCES Diretores(DiretorID),
    FOREIGN KEY (GeneroID) REFERENCES Generos(GeneroID)
);


CREATE TABLE Atores (
    AtorID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100)
);


CREATE TABLE Filme_Ator (
    FilmeID INT,
    AtorID INT,
    PRIMARY KEY (FilmeID, AtorID),
    FOREIGN KEY (FilmeID) REFERENCES Filmes(FilmeID),
    FOREIGN KEY (AtorID) REFERENCES Atores(AtorID)
);


INSERT INTO Diretores (Nome) VALUES 
('Fernando Meirelles'),
('José Padilha'),
('Kleber Mendonça Filho'),
('Walter Salles'),
('Cacá Diegues'),
('Anna Muylaert'),
('Laís Bodanzky'),
('Jorge Furtado'),
('Andrucha Waddington'),
('Daniel Filho');


INSERT INTO Generos (Nome) VALUES 
('Drama'),
('Comédia'),
('Ação'),
('Romance'),
('Documentário'),
('Suspense'),
('Policial'),
('Fantasia'),
('Ficção Científica'),
('Biografia');



INSERT INTO Filmes (Titulo, Ano, DiretorID, GeneroID) VALUES
('Cidade de Deus', 2002, 1, 7),
('Tropa de Elite', 2007, 2, 3),
('Que Horas Ela Volta?', 2015, 6, 1),
('O Som ao Redor', 2012, 3, 1),
('Central do Brasil', 1998, 4, 1),
('O Auto da Compadecida', 2000, 5, 2),
('Bicho de Sete Cabeças', 2001, 7, 1),
('Ilha das Flores', 1989, 8, 5),
('2 Filhos de Francisco', 2005, 10, 10),
('Casa de Areia', 2005, 9, 1);



INSERT INTO Atores (Nome) VALUES 
('Wagner Moura'),
('Rodrigo Santoro'),
('Fernanda Montenegro'),
('Seu Jorge'),
('Lázaro Ramos'),
('Leandra Leal'),
('Débora Falabella'),
('Selton Mello'),
('Caio Blat'),
('Matheus Nachtergaele');






SELECT F.Titulo, D.Nome AS Diretor, G.Nome AS Genero
FROM Filmes F
INNER JOIN Diretores D ON F.DiretorID = D.DiretorID
INNER JOIN Generos G ON F.GeneroID = G.GeneroID
WHERE F.Titulo LIKE '%de%';



SELECT A.Nome AS Ator, F.Titulo
FROM Atores A
INNER JOIN Filme_Ator FA ON A.AtorID = FA.AtorID
INNER JOIN Filmes F ON F.FilmeID = FA.FilmeID
WHERE F.Titulo LIKE '%Cidade%';



SELECT F.Titulo, D.Nome
FROM Filmes F
INNER JOIN Diretores D ON F.DiretorID = D.DiretorID
WHERE D.Nome LIKE '%Fernando%';



SELECT F.Titulo, A.Nome AS Ator
FROM Filmes F
INNER JOIN Generos G ON F.GeneroID = G.GeneroID
INNER JOIN Filme_Ator FA ON F.FilmeID = FA.FilmeID
INNER JOIN Atores A ON A.AtorID = FA.AtorID
WHERE G.Nome LIKE '%Drama%';


SELECT F.Titulo, D.Nome AS Diretor
FROM Filmes F
INNER JOIN Diretores D ON F.DiretorID = D.DiretorID
WHERE F.Titulo LIKE '%da%';
