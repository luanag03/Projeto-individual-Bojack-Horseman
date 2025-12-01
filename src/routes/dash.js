var express = require("express");
var router = express.Router();
var dashController = require("../controllers/dashController");


router.get("/relatorio/letras-ultima/:idUsuario", function (req, res) {
    dashController.contarRespostasPorLetraUltimaTentativa(req, res);
});

module.exports = router;
