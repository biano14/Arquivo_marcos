CREATE TABLE  (
    idFuncionario INT ,
    idCliente INT,
    idPagamento INT,
    idEntregador INT,
    idEndereco INT,
    idPizza INT,
    FOREIGN KEY (idFuncionario) REFERENCES funcionario(idFuncionario) ON DELETE SET NULL,
    FOREIGN KEY (idCliente) REFERENCES cliente(idCliente) ON DELETE SET NULL,
    FOREIGN KEY (idPagamento) REFERENCES pagamento(idPagamento) ON DELETE SET NULL,
    FOREIGN KEY (idEntregador) REFERENCES entregador(idEntregador) ON DELETE SET NULL,
    FOREIGN KEY (idEndereco) REFERENCES endereco(idEndereco) ON DELETE SET NULL,
    FOREIGN KEY (idPizza) REFERENCES pizza(idPizza) ON DELETE SET NULL
)