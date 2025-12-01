var database = require("../database/config");

function contarRespostasPorLetraUltimaTentativa(idUsuario) {
  var instrucao = `
  SELECT 
    letra,
    COUNT(*) AS quantidade
 FROM resposta_alternativa
 WHERE fkUsuario = ${idUsuario}
 GROUP BY letra
 ORDER BY letra;
  `;
  return database.executar(instrucao);
}

module.exports = {

  contarRespostasPorLetraUltimaTentativa

};