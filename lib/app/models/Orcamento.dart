// final String eventsNotes = 'events';

class OrcamentoFields {
  static final List<String> values = [
    id, descricao, valor, tipo
  ];

  static final String id = '_id';
  static final String descricao = 'descricao';
  static final String valor = 'valor';
  static final String tipo = 'tipo';
}

class Orcamento {
  final int? id;
  final String descricao;
  final double valor;
  final String tipo;

  const Orcamento({
  required this.id,
  required this.descricao,
  required this.valor,
  required this.tipo
  });

  Orcamento copy({
    int? id,
    String? descricao,
    double? valor,
    String? tipo,
  }) =>
      Orcamento(
        id: id ?? this.id,
        descricao: descricao ?? this.descricao,
        valor: valor ?? this.valor,
        tipo: tipo ?? this.tipo,
      );

  static Orcamento fromJson(Map<String, Object?> json) => Orcamento(
    id: json[OrcamentoFields.id] as int?,
    descricao: json[OrcamentoFields.descricao] as String,
    valor: json[OrcamentoFields.valor] as double,
    tipo: json[OrcamentoFields.tipo] as String,
  );

  Map<String, Object?> toJson() {
    return {
      OrcamentoFields.id: id,
      OrcamentoFields.descricao: descricao,
      OrcamentoFields.valor: valor,
      OrcamentoFields.tipo: tipo,
    };
  }
}
