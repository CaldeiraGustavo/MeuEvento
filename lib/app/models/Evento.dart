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
  final int convidados;
  final String data;

  const Event({
    this.id,
    required this.nome,
    required this.conjuge1,
    required this.conjuge2,
    required this.convidados,
    required this.data,
  });

  Event copy({
    int? id,
    String? nome,
    String? conjuge1,
    String? conjuge2,
    int? convidados,
    String? data,
  }) =>
      Event(
        id: id ?? this.id,
        nome: nome ?? this.nome,
        conjuge1: conjuge1 ?? this.conjuge1,
        conjuge2: conjuge2 ?? this.conjuge2,
        convidados: convidados ?? this.convidados,
        data: data ?? this.data,
      );

  static Event fromJson(Map<String, Object?> json) => Event(
        id: json[EventFields.id] as int?,
        nome: json[EventFields.nome] as String,
        conjuge1: json[EventFields.conjuge1] as String,
        conjuge2: json[EventFields.conjuge2] as String,
        convidados: json[EventFields.convidados] as int,
        data: json[EventFields.data] as String,
      );

  Map<String, Object?> toJson() => {
        EventFields.id: id,
        EventFields.nome: nome,
        EventFields.conjuge1: conjuge1,
        EventFields.conjuge2: conjuge2,
        EventFields.convidados: convidados,
    EventFields.data: data,
      };
}
