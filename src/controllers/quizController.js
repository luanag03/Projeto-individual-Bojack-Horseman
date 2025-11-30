var quizModel = require("../models/quizModel");

function buscarQuizComPerguntas(req, res) {
  const fkQuiz = req.params.id;

  quizModel.buscarQuiz(fkQuiz)
    .then(resultado => res.json(resultado))
    .catch(erro => {
      console.error("Erro ao buscar quiz:", erro);
      res.status(500).json({ erro: "Erro ao buscar quiz" });
    });
}
function criarAlternativasPorResposta(req, res) {
  var fkUsuario = req.body.fkUsuario;
  var letra = req.body.letra;

  quizModel.criarAlternativaPorResposta(fkUsuario, letra)
    .then(() => res.status(201).send("Alternativa registrada"))
    .catch(erro => res.status(500).send("Erro ao registrar alternativa"));
}

function buscarPersonagem(req, res) {
  var nome = req.body.personagemFinal;

  console.log('personagem', nome);

  quizModel.buscarPersonagemPorNome(nome)
    .then(resultado => {
      if (resultado.length > 0) {
        res.json(resultado[0]);
      } else {
        res.status(404).send("Personagem não encontrado");
      }
    })
    .catch(erro => {
      console.log(erro)
      res.status(500).send("Erro ao buscar personagem")
    });
}

function salvarPersonagemUsuario(req, res) {
  var idUsuario = req.body.idUsuario;
  var idPersonagem = req.body.idPersonagem;

  quizModel.salvarPersonagemUsuario(idUsuario, idPersonagem)
    .then(() => res.send("Personagem salvo para o usuário"))
    .catch(erro => res.status(500).send("Erro ao salvar personagem"));
}

module.exports = {
  buscarQuizComPerguntas,
  criarAlternativasPorResposta,
  buscarPersonagem,
  salvarPersonagemUsuario
};
