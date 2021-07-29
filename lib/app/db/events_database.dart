import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:meu_evento/app/models/event.dart';

class EventDatabase {
  static final EventDatabase instance = EventDatabase._init();

  static Database? _database;

  EventDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('events1.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final boolType = 'BOOLEAN NOT NULL';
    final integerType = 'INTEGER NOT NULL';

    await db.execute('''
  CREATE TABLE $eventsNotes (
  ${EventFields.id} $idType,
  ${EventFields.nome} $textType,
  ${EventFields.conjuge1} $textType,
  ${EventFields.conjuge2} $textType,
  ${EventFields.convidados} $integerType,
  ${EventFields.data} $textType)
  ''');
  }

  Future<Event> create(Event event) async {
    final db = await instance.database;

    final id = await db.insert(eventsNotes, event.toJson());
    return event.copy(id: id);
  }

  Future<Event> readNote(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      eventsNotes,
      columns: EventFields.values,
      where: '${EventFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Event.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Event>> readAllNotes() async {
    final db = await instance.database;
    final orderBy = '${EventFields.data} ASC';
    final result = await db.query(eventsNotes, orderBy: orderBy);

    return result.map((json) => Event.fromJson(json)).toList();
  }

  Future<int> update(Event event) async {
    final db = await instance.database;

    return db.update(
      eventsNotes,
      event.toJson(),
      where: '${EventFields.id} = ?',
      whereArgs: [event.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;
    return await db.delete(
      eventsNotes,
      where: '${EventFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
