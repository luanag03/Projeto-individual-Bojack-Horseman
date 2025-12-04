var database = require("../database/config");

function buscarQuiz(fkQuiz) {
  var instrucaoSql =`
    SELECT 
      q.idQuiz AS quiz_id,
      q.titulo AS quiz_titulo, 
      p.idPergunta AS pergunta_id,
      p.Texto AS pergunta_texto, 
      a.idAlternativa AS alternativa_id,
      a.texto AS alternativa_texto, 
      a.letra AS alternativa_letra
    FROM Quiz q
    JOIN Pergunta p ON q.idQuiz = p.fkQuiz
    JOIN Alternativa a ON p.idPergunta = a.fkPergunta
    WHERE q.idQuiz = ${fkQuiz}
    ORDER BY p.idPergunta, a.idAlternativa;
  ` 
  return database.executar(instrucaoSql);
}

function criarAlternativaPorResposta(fkUsuario, letra) {
  var instrucaoSql = `
    INSERT INTO resposta_alternativa (fkUsuario, letra)
    VALUES ('${fkUsuario}', '${letra}');
  `;

  return database.executar(instrucaoSql);
}

function buscarPersonagemPorNome(personagem) {
  var instrucaoSql = `
    SELECT * FROM personagem WHERE personagem = '${personagem}';
  `;

  return database.executar(instrucaoSql);
}

function salvarPersonagemUsuario(idUsuario, idPersonagem) {
  var instrucaoSql = `
    UPDATE usuario 
    SET fkPersonagem = '${idPersonagem}'
    WHERE idUsuario = '${idUsuario}';
  `;

  return database.executar(instrucaoSql);
}

module.exports = {
  buscarQuiz,
  criarAlternativaPorResposta,
  buscarPersonagemPorNome,
  salvarPersonagemUsuario
};
