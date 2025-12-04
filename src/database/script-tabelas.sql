-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql server
*/
CREATE DATABASE BojackHorseman;
USE BojackHorseman;

CREATE TABLE personagem (
	idPersonagem INT PRIMARY KEY AUTO_INCREMENT,
    personagem VARCHAR(50),
    texto VARCHAR(800)
);

CREATE TABLE usuario (
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
email VARCHAR(45) UNIQUE,
senha VARCHAR(200),
fkPersonagem INT NULL,
FOREIGN KEY (fkPersonagem) REFERENCES personagem(idPersonagem)
);

CREATE TABLE mural(
id INT PRIMARY KEY auto_increment,
Titulo VARCHAR(100),
descricao VARCHAR(250),
fk_usuario INT,
FOREIGN KEY( fk_usuario) REFERENCES usuario(idUsuario)
);

select * from mural;

CREATE TABLE quiz (
    idQuiz INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(45),
    descricao VARCHAR(45)
);

CREATE TABLE pergunta (
    idPergunta INT AUTO_INCREMENT PRIMARY KEY,
    fkQuiz INT,
    texto VARCHAR(200),
    FOREIGN KEY (fkQuiz) REFERENCES quiz(idquiz)
);

CREATE TABLE alternativa (
    idAlternativa INT AUTO_INCREMENT PRIMARY KEY,
    texto VARCHAR(200),
    letra CHAR(1) CHECK (letra IN ('a','b','c','d','e','f','g','h')),
    fkPergunta INT,
    FOREIGN KEY (fkPergunta) REFERENCES pergunta(idPergunta)
);

CREATE TABLE resposta_alternativa(
    idresposta_alternativa INT PRIMARY KEY auto_increment,
	letra CHAR(1),
    fkUsuario INT,
    fkQuiz INT,
	FOREIGN KEY (fkUsuario) REFERENCES usuario(idUsuario),
    FOREIGN KEY (fkQuiz) REFERENCES quiz(idQuiz)
);


select * from mural;
select * from usuario;
select * from resposta_alternativa;
select* from personagem;
select * from quiz;

INSERT INTO personagem (idPersonagem, personagem, texto) VALUES
(default, 'Bojack Horseman', 'BoJack é alguém que convive com muitos sentimentos difíceis ao mesmo tempo. Ele passa por fases de tristeza profunda, culpa e arrependimentos que parecem nunca deixar ele em paz. Muitas vezes, BoJack tenta se distrair para não pensar no que sente, mas isso só faz com que ele fique preso em um ciclo de autossabotagem. Ele quer ser uma pessoa melhor, mas tem medo de não conseguir e de decepcionar quem está ao redor. Mesmo com todos os erros, BoJack também tem momentos de muito esforço e coragem para mudar, mostrando que, por trás de toda dor, existe alguém que só queria ser aceito e encontrar um pouco de paz consigo mesmo.'),
(default, 'Sarah Lynn', 'Sarah Lynn é o tipo de pessoa que cresceu rápido demais e nunca teve espaço para ser simplesmente uma adolescente normal. A fama a colocou em situações que ela não sabia lidar e, por isso, ela acabou buscando conforto no exagero e nas coisas que davam prazer rápido. Por trás do brilho e do glamour, existe uma jovem cheia de inseguranças, medos e um vazio muito grande que nunca conseguiu preencher. Ela tenta parecer forte e divertida, mas carrega mágoas profundas e uma solidão que ninguém vê. No fundo, Sarah Lynn só queria ser cuidada e enxergada como uma pessoa, não como um produto.'),
(default, 'Princess Carolyn', 'Princess Carolyn é extremamente dedicada e sempre tenta dar conta de tudo, como o trabalho, relacionamentos, projetos, responsabilidade de outras pessoas, mesmo quando está completamente esgotada. Ela raramente pede ajuda, porque acredita que precisa ser forte o tempo inteiro. Isso faz com que viva ansiosa e exausta, carregando mais peso do que deveria. Apesar disso, ela nunca desiste e está sempre tentando criar um futuro melhor para si mesma. Seu coração é enorme, mas ela precisa aprender a cuidar dele com a mesma dedicação que cuida de todos ao seu redor. Princess Carolyn é o tipo de pessoa que sofre calada, mas tem uma força admirável.'),
(default, 'Mr. Peanutbutter', 'Mr. Peanutbutter parece ser felicidade pura. Ele está sempre sorrindo, animado e pronto para ajudar, como se nada ruim existisse no mundo. Porém, essa alegria constante também é uma forma de evitar olhar para dentro e lidar com sentimentos mais profundos. Ele não gosta de conflitos, não sabe lidar com tristeza e prefere acreditar que tudo está sempre bem, mesmo quando não está. Isso faz com que ele seja querido, mas também dificulta que as pessoas o enxerguem de forma completa. No fundo, Mr. Peanutbutter é uma alma boa que tenta fazer o mundo melhor, só precisa aprender que tudo bem às vezes não estar tudo bem.'),
(default, 'Diane', 'Diane é alguém que pensa demais e sente tudo de forma muito intensa. Ela luta contra a depressão, inseguranças e uma pressão interna que coloca sobre si mesma, como de ser útil, de fazer o certo, de melhorar o mundo. Muitas vezes, ela sente que não é suficiente, mesmo quando está fazendo muito mais do que deveria. Diane é crítica, inteligente e sensível, mas tem dificuldade de olhar para si com a mesma compaixão que tem pelos outros. Sua saúde mental é uma jornada cheia de altos e baixos, e ela está sempre tentando encontrar um equilíbrio entre quem é e quem gostaria de ser. Por mais difícil que seja, ela continua tentando, e isso já é enorme.' ),
(default, 'Beatrice Horseman', 'Beatrice carrega traumas profundos desde a infância, que moldaram tudo o que ela se tornou. Ela cresceu em um ambiente frio e sem afeto, e isso fez com que aprendesse a esconder seus sentimentos e se proteger do mundo. Por causa disso, desenvolveu uma forma dura de lidar com as pessoas, especialmente com quem ama. Sua saúde mental é marcada por mágoas não curadas, medo de vulnerabilidade e um jeito rígido de enfrentar a vida. Embora pareça distante e difícil, sua história mostra que muitas vezes pessoas “duras” só estão tentando sobreviver a dores antigas que nunca conseguiram superar.'),
(default, 'Hollyhock', 'Hollyhock é jovem, sensível e está em um momento da vida cheio de descobertas. Ela quer entender quem é, de onde veio e como se encaixa no mundo. Isso a deixa ansiosa e insegura às vezes, mas ela tem uma força interna muito grande e não tem medo de pedir ajuda quando precisa. Sua saúde mental reflete alguém que está aprendendo a se conhecer, a lidar com expectativas e a construir sua própria identidade sem repetir os erros de sua família. Hollyhock é esperança, renovação e coragem para crescer do jeito certo'),
(default, 'Todd Chavez', 'Todd é espontâneo, criativo e tem uma forma única de enxergar a vida. Ele não se encaixa nos padrões tradicionais e muitas vezes se sente perdido, mas consegue transformar isso em algo leve e divertido. Mesmo com dificuldades para se organizar ou manter foco, ele é emocionalmente equilibrado e confortável com quem é. Todd passa por problemas como qualquer pessoa, mas tem uma habilidade natural de não deixar que as coisas ruins definam seu dia. Ele mostra que existe mais de um jeito de viver bem e que autenticidade é uma das maiores formas de saúde mental.' );


INSERT INTO usuario (idUsuario, nome, email, senha, fkPersonagem) VALUES
(default, 'luana', 'luana@email.com', 'senha1', null);

select * from usuario;

-- Inserir quiz
INSERT INTO quiz (idQuiz, titulo, descricao) VALUES
(default, 'Qual personagem você é de bojackhorseman?', 'Descubra qual personagem você é !');



INSERT INTO pergunta (idPergunta, fkQuiz, texto) VALUES
(default, 1, 'Nas festas o que você faz é... '),
(default, 1, 'Como você reage quando está sobrecarregado?'),
(default, 1, 'Qual seria seu maior erro recorrente?'),
(default, 1, 'O que você busca em um relacionamento?'),
(default, 1, 'Como você lida com mudanças?'),
(default, 1, 'Como é seu senso de humor?'),
(default, 1, 'Qual seria seu papel em um grupo?');

-- alternativas pergunta 1
INSERT INTO alternativa (idAlternativa, texto, letra, fkPergunta) VALUES
(default, 'Beber muito ', 'a', 1), 
(default, 'Ficar muito louco(a) e ficar até a festa acabar ', 'b', 1), 
(default, 'Ir embora cedo', 'c', 1), 
(default, 'Socializar', 'd', 1),
(default, 'Querer ir embora mas fica para ser legal', 'e', 1), 
(default, 'Observar e julgar', 'f', 1), 
(default, 'Dançar ', 'g', 1), 
(default, 'Energia que não acaba, sempre dando iniciativa para coisas divertidas', 'h', 1);

-- alternativas pergunta 2
INSERT INTO alternativa (idAlternativa, texto, letra, fkPergunta) VALUES
(default, 'Me afasto e tento esquecer o mundo por um tempo.', 'a', 2),
(default, 'Me destruo aos poucos e finjo que está tudo bem.', 'b', 2),
(default, 'Trabalho ainda mais, porque parar é impossível.', 'c', 2),
(default, 'Continuo otimista, as coisas vão dar certo!', 'd', 2),
(default, 'Reflito profundamente e tento racionalizar tudo.', 'e', 2),
(default, 'Engulo meus sentimentos e mantenho a postura.', 'f', 2),
(default, 'Busco alguém em quem confio para pedir conselhos.', 'g', 2),
(default, 'Me distraio com alguma ideia maluca que aparece na hora.', 'h', 2);


-- alternativas pergunta 3
INSERT INTO alternativa (idAlternativa, texto, letra, fkPergunta) VALUES
(default, 'Sabotar minhas próprias chances de felicidade.', 'a', 3),
(default, 'Afundar em excessos sem medir consequências.', 'b', 3),
(default, 'Assumir responsabilidades demais e não pedir ajuda.', 'c', 3),
(default, 'Querer agradar tanto que ignoro problemas reais.', 'd', 3),
(default, 'Ser dura demais comigo mesma e com o mundo.', 'e', 3),
(default, 'Reprimir emoções até virar amargura.', 'f', 3),
(default, 'Achar que eu preciso ser perfeita para ser amada.', 'g', 3),
(default, 'Me meter nas situações mais improváveis sem perceber.', 'h', 3);


-- alternativas pergunta 4
INSERT INTO alternativa (idAlternativa, texto, letra, fkPergunta) VALUES
(default, 'Alguém que aceite meus defeitos, mesmo eu não aceitando.', 'a', 4),
(default, 'Alguém que me acompanhe no caos.', 'b', 4),
(default, 'Alguém confiável e trabalhador como eu.', 'c', 4),
(default, 'Alguém que adore viver ao meu lado.', 'd', 4),
(default, 'Alguém que me entenda intelectualmente.', 'e', 4),
(default, 'Alguém que mantenha padrões altos e estabilidade.', 'f', 4),
(default, 'Alguém que me ajude a entender quem eu sou.', 'g', 4),
(default, 'Alguém que entre em minhas aventuras espontâneas.', 'h', 4);

-- alternativas pergunta 5
INSERT INTO alternativa (idAlternativa, texto, letra, fkPergunta) VALUES
(default, 'Com resistência e autossabotagem.', 'a', 5),
(default, 'Afundando nelas sem freio.', 'b', 5),
(default, 'Tentando controlar tudo para não desmoronar.', 'c', 5),
(default, 'Aceitando com entusiasmo.', 'd', 5),
(default, 'Questionando profundamente cada detalhe.', 'e', 5),
(default, 'Mantendo a fachada, mesmo inseguro(a).', 'f', 5),
(default, 'Tentando aprender e crescer.', 'g', 5),
(default, 'Improvisando,vai dar certo de algum jeito.', 'h', 5);

-- alternativas pergunta 6
INSERT INTO alternativa (idAlternativa, texto, letra, fkPergunta) VALUES
(default, 'Ácido, autodepreciativo e realista demais.', 'a', 6),
(default, 'Caótico, exagerado e sem limites.', 'b', 6),
(default, 'Inteligente, rápido e profissionalmente afiado.', 'c', 6),
(default, 'Superpositivo, fofo e cheio de energia.', 'd', 6),
(default, 'Sarcástico, reflexivo e crítico.', 'e', 6),
(default, 'Seco, frio e quase imperceptível.', 'f', 6),
(default, 'Leve, gentil e sem intenções negativas.', 'g', 6),
(default, 'Bobo, improvisado e completamente estranho.', 'h', 6);


-- alternativas pergunta 7
INSERT INTO alternativa (idAlternativa, texto, letra, fkPergunta) VALUES
(default, 'O que tenta não destruir tudo, mas falha.', 'a', 7),
(default, 'O que desaparece e volta duas horas depois completamente doido.', 'b', 7),
(default, 'O que organiza os planos, horários e transporte.', 'c', 7),
(default, 'O entusiasta que quer unir todos.', 'd', 7),
(default, 'O que problematiza, mas com razão.', 'e', 7),
(default, 'O que observa e julga silenciosamente.', 'f', 7),
(default, 'O que tenta cuidar dos outros.', 'g', 7),
(default, 'O que inicia acidentalmente uma subtrama absurda.', 'h', 7);


-- selecionar todas as perguntas e alternativas de um quiz
SELECT 
	q.idQuiz AS quiz_id,
    q.titulo AS quiz_titulo, 
    p.idPergunta AS pergunta_id,
    p.texto AS pergunta_texto, 
    a.idAlternativa AS alternativa_id,
    a.texto AS alternativa_texto, 
    a.letra AS alternativa_letra
FROM 
    quiz q
JOIN 
    pergunta p ON q.idQuiz = p.fkQuiz
JOIN 
    alternativa a ON p.idPergunta = a.fkPergunta
WHERE 
    q.idQuiz = 1
ORDER BY 
    p.idPergunta, a.idAlternativa;
    
    
    -- Selecionar os dados do mural
    SELECT 
            a.id AS id,
            a.titulo,
            a.descricao,
            a.fk_usuario,
            u.idUsuario AS idUsuario,
            u.nome,
            u.email,
            u.senha
        FROM mural AS a
            INNER JOIN usuario AS u
                ON a.fk_usuario = u.idUsuario;




