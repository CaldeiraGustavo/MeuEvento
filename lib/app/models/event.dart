final String eventsNotes = 'events';

class EventFields {
  static final List<String> values = [
    /// Add all fields
    id, nome, conjuge1, conjuge2, convidados, data
  ];

  static final String id = '_id';
  static final String nome = 'nome';
  static final String conjuge1 = 'conjuge1';
  static final String conjuge2 = 'conjuge2';
  static final String convidados = 'convidados';
  static final String data = 'data';
}

class Event {
  final int? id;
  final String nome;
  final String conjuge1;
  final String conjuge2;
  final int qtdConvidados;
  final DateTime dataEvento;

  const Event({
    this.id,
    required this.nome,
    required this.conjuge1,
    required this.conjuge2,
    required this.qtdConvidados,
    required this.dataEvento,
  });

  Event copy({
    int? id,
    String? nome,
    String? conjuge1,
    String? conjuge2,
    int? qtdConvidados,
    DateTime? dataEvento,
  }) =>
      Event(
        id: id ?? this.id,
        nome: nome ?? this.nome,
        conjuge1: conjuge1 ?? this.conjuge1,
        conjuge2: conjuge2 ?? this.conjuge2,
        qtdConvidados: qtdConvidados ?? this.qtdConvidados,
        dataEvento: dataEvento ?? this.dataEvento,
      );

  static Event fromJson(Map<String, Object?> json) => Event(
        id: json[EventFields.id] as int?,
        nome: json[EventFields.nome] as String,
        conjuge1: json[EventFields.conjuge1] as String,
        conjuge2: json[EventFields.conjuge2] as String,
        qtdConvidados: json[EventFields.convidados] as int,
        dataEvento: DateTime.parse(json[EventFields.data] as String),
      );

  Map<String, Object?> toJson() => {
        EventFields.id: id,
        EventFields.nome: nome,
        EventFields.conjuge1: conjuge1,
        EventFields.conjuge2: conjuge2,
        EventFields.convidados: qtdConvidados,
        EventFields.data: dataEvento.toIso8601String(),
      };
}
