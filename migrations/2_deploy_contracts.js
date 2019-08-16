var Certificacion = artifacts.require("Certificacion");
module.exports = function(deployer) {
  deployer.deploy(Certificacion);
};