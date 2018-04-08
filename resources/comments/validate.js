
if (this.name.length < 5) {
  error("O nome precisa ter mais de 5 caracteres");
}

var hoje = new Date();
anoAtual = hoje.getFullYear();
anoNasc = this.nascimento.getFullYear()


if (anoAtual - anoNasc < 18) {
  error("NESSARIO SER MAIOR DE IDADE");
}
