var dashModel = require("../models/dashModel");

function contarRespostasPorLetraUltimaTentativa(req, res) {
  const idUsuario = req.params.idUsuario;

  if (!idUsuario) {
    return res.status(400).send("ID do usuário não fornecido.");
  }

  dashModel.contarRespostasPorLetraUltimaTentativa(idUsuario)
    .then(resultado => {
      res.status(200).json(resultado);
    })
    .catch(erro => {
      console.error("Erro ao contar respostas por letra:", erro);
      res.status(500).send("Erro ao contar respostas por letra.");
    });
}

module.exports = {
  contarRespostasPorLetraUltimaTentativa
 
};