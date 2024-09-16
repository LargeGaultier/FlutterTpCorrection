import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelperInjection {
  static final _databaseName = "robotDatabase.db";
  static final _databaseVersion = 1;

  static final table = 'robot_table';
  static final columnId = 'id';
  static final columnName = 'name';
  static final columnType = 'type';
  static final columnYear = 'year';

  // Singleton instance
  static final DatabaseHelperInjection _instance = DatabaseHelperInjection._internal();
  static Database? _database;

  factory DatabaseHelperInjection() {
    return _instance;
  }

  DatabaseHelperInjection._internal(); // Private constructor

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table (
        $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnName TEXT NOT NULL,
        $columnType TEXT NOT NULL,
        $columnYear TEXT NOT NULL
      )
    ''');
  }

  Future<int> insertRobot(Map<String, dynamic> row) async {
    Database db = await database;
    return await db.insert(table, row);
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await database;
    return await db.query(table);
  }

  Future<int> delete(int id) async {
    Database db = await database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }
}
