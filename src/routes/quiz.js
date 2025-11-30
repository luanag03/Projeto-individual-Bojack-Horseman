var express = require("express");
var router = express.Router();
var quizController = require("../controllers/quizController");

var express = require("express");
var router = express.Router();
var quizController = require("../controllers/quizController");


router.get("/buscarQuiz/:id", function (req, res) {
    quizController.buscarQuizComPerguntas(req, res);
});

router.post("/resposta/alternativa", function (req, res) {
    quizController.criarAlternativasPorResposta(req, res);
});

router.post("/personagem", function (req, res) {
    quizController.buscarPersonagem(req, res);
});

router.post("/salvar-personagem", function (req, res) {
    quizController.salvarPersonagemUsuario(req, res);
});

module.exports = router;
