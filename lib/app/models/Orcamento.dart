// final String eventsNotes = 'events';

class OrcamentoFields {
  static final List<String> values = [
    descricao, valor, tipo
  ];

  static final String descricao = 'descricao';
  static final String valor = 'valor';
  static final String tipo = 'tipo';
}

class Orcamento {
  final String descricao;
  final double valor;
  final String tipo;

  const Orcamento({
  required this.descricao,
  required this.valor,
  required this.tipo
  });

  Orcamento copy({
    String? descricao,
    double? valor,
    String? tipo,
  }) =>
      Orcamento(
        descricao: descricao ?? this.descricao,
        valor: valor ?? this.valor,
        tipo: tipo ?? this.tipo,
      );

  static Orcamento fromJson(Map<String, Object?> json) => Orcamento(
    descricao: json[OrcamentoFields.descricao] as String,
    valor: json[OrcamentoFields.valor] as double,
    tipo: json[OrcamentoFields.tipo] as String,
  );

  Map<String, Object?> toJson() {
    return {
      OrcamentoFields.descricao: descricao,
      OrcamentoFields.valor: valor,
      OrcamentoFields.tipo: tipo,
    };
  }
}
