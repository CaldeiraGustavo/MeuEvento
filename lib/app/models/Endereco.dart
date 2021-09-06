class Endereco {
  final int id;
  final int cidade;
  final String logradouro;
  final int numero;
  final String complemento;
  final String bairro;
  final String cep;

  const Endereco({
    required this.id,
      required this.cidade,
      required this.logradouro,
    required this.numero,
    required this.complemento,
    required this.bairro,
    required this.cep
  });
}