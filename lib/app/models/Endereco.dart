class Endereco {
  final int id;
  final int id_cidade;
  final String logradouro;
  final int numero;
  final String complemento;
  final String bairro;
  final String cep;

  const Endereco({
    required this.id,
    required this.id_cidade,
    required this.logradouro,
    required this.numero,
    required this.complemento,
    required this.bairro,
    required this.cep
  });
}