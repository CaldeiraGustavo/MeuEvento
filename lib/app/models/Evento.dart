class Evento {
  final String id;
  final String nome;
  final String conjuge1;
  final String conjuge2;
  final int convidados;
  final DateTime data;

  const Evento({
    required this.id,
    required this.nome,
    required this.conjuge1,
    required this.conjuge2,
    required this.convidados,
    required this.data,
  });
}
