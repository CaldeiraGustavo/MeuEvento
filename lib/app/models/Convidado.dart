class Convidado {
  final String nome;
  final bool isPadrinho;
  final bool importado;

  const Convidado(
      {required this.nome, required this.isPadrinho, required this.importado});

  Map<String, dynamic> toJSON() {
    return <String, dynamic>{
      'nome': nome,
      'isPadrinho': isPadrinho,
      'importado': importado
    };
  }
}
