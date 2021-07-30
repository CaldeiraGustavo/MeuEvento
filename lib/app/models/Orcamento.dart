// final String eventsNotes = 'events';

class Fields {
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
  final int tipo;

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
    int? tipo,
  }) =>
      Orcamento(
        id: id ?? this.id,
        descricao: descricao ?? this.descricao,
        valor: valor ?? this.valor,
        tipo: tipo ?? this.tipo,
      );

  static Orcamento fromJson(Map<String, Object?> json) => Orcamento(
    id: json[Fields.id] as int?,
    descricao: json[Fields.descricao] as String,
    valor: json[Fields.valor] as double,
    tipo: json[Fields.tipo] as int,
  );

  Map<String, Object?> toJson() => {
    Fields.id: id,
    Fields.descricao: descricao,
    Fields.valor: valor,
    Fields.tipo: tipo,
  };
}
