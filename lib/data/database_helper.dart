import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:watchlist_plus/enums/access_enum.dart';
import 'package:watchlist_plus/enums/streaming_enum.dart';
import 'package:watchlist_plus/models/production.dart';
import 'package:watchlist_plus/models/streaming.dart';

class DatabaseHelper {
  static const String _dbName = 'watchlist.db';
  static const int _dbVersion = 1;

  static const String tableProductions = 'productions';
  static const String tableProductionStreamings = 'production_streamings';

  static const String colId = 'id';
  static const String colTitle = 'title';
  static const String colCategory = 'category';
  static const String colWatched = 'watched';
  static const String colCreatedAt = 'created_at';
  static const String colUpdatedAt = 'updated_at';

  static const String colStreamingId = 'id';
  static const String colProductionId = 'production_id';
  static const String colService = 'service';
  static const String colAccess = 'access';

  static final DatabaseHelper instance = DatabaseHelper._();
  static Database? _database;

  DatabaseHelper._();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), _dbName);
    return openDatabase(
      path,
      version: _dbVersion,
      onCreate: _onCreate,

      onOpen: (db) => db.execute('PRAGMA foreign_keys = ON'),
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('PRAGMA foreign_keys = ON');

    await db.execute('''
      CREATE TABLE $tableProductions (
        $colId         INTEGER PRIMARY KEY AUTOINCREMENT,
        $colTitle      TEXT    NOT NULL,
        $colCategory   TEXT    NOT NULL,
        $colWatched    INTEGER NOT NULL DEFAULT 0,
        $colCreatedAt  TEXT    NOT NULL,
        $colUpdatedAt  TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE $tableProductionStreamings (
        $colStreamingId  INTEGER PRIMARY KEY AUTOINCREMENT,
        $colProductionId INTEGER NOT NULL,
        $colService      TEXT    NOT NULL,
        $colAccess       TEXT    NOT NULL,
        FOREIGN KEY ($colProductionId)
          REFERENCES $tableProductions ($colId)
          ON DELETE CASCADE
      )
    ''');
  }

  Future<Production> insertProduction(Production production) async {
    final db = await database;

    return db.transaction((txn) async {
      final id = await txn.insert(
        tableProductions,
        _productionToRow(production),
      );
      await _insertStreamingRows(txn, id, production.streaming);
      return production.copyWith(id: id);
    });
  }

  Future<List<Production>> findAllProductions() async {
    final db = await database;

    final rows = await db.query(
      tableProductions,
      orderBy: '$colUpdatedAt DESC, $colCreatedAt DESC',
    );

    return Future.wait(rows.map((r) => _hydrate(db, r)));
  }

  Future<void> updateProduction(Production production) async {
    final db = await database;

    await db.transaction((txn) async {
      await txn.update(
        tableProductions,
        _productionToRow(production),
        where: '$colId = ?',
        whereArgs: [production.id],
      );

      await txn.delete(
        tableProductionStreamings,
        where: '$colProductionId = ?',
        whereArgs: [production.id],
      );

      await _insertStreamingRows(txn, production.id!, production.streaming);
    });
  }

  Future<void> deleteProduction(int id) async {
    final db = await database;
    await db.delete(tableProductions, where: '$colId = ?', whereArgs: [id]);
  }

  Future<void> deleteAllProductions() async {
    final db = await database;
    await db.delete(tableProductions);
  }

  Future<void> close() async {
    final db = await database;
    _database = null;
    await db.close();
  }

  Map<String, dynamic> _productionToRow(Production p) => {
    if (p.id != null) colId: p.id,
    colTitle: p.title,
    colCategory: p.category.name,
    colWatched: p.watched ? 1 : 0,
    colCreatedAt: p.createdAt.toIso8601String(),
    colUpdatedAt: p.updatedAt?.toIso8601String(),
  };

  Future<void> _insertStreamingRows(
    DatabaseExecutor txn,
    int productionId,
    List<Streaming> streamings,
  ) async {
    for (final s in streamings) {
      await txn.insert(tableProductionStreamings, {
        colProductionId: productionId,
        colService: s.service.name,
        colAccess: s.access.name,
      });
    }
  }

  Future<Production> _hydrate(Database db, Map<String, dynamic> row) async {
    final productionId = row[colId] as int;

    final streamingRows = await db.query(
      tableProductionStreamings,
      where: '$colProductionId = ?',
      whereArgs: [productionId],
    );

    final streamings = streamingRows
        .map(
          (r) => Streaming(
            service: StreamingEnum.values.firstWhere(
              (e) => e.name == r[colService],
            ),
            access: AccessEnum.values.firstWhere((e) => e.name == r[colAccess]),
          ),
        )
        .toList();

    return Production.fromRow(row, streamings);
  }
}
