import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutterlearningproject/Domain/RobotPersistence.dart';


class DatabaseHelper {
  static final _databaseName = "robotDatabase.db";
  static final _databaseVersion = 1;
  static final table = 'robot_table';

  static final columnId = 'id';
  static final columnName = 'name';
  static final columnType = 'type';
  static final columnYear = 'year';

  // Singleton pour DatabaseHelper
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal(); // Constructeur privé

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  // Créer la table SQLite
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

  // Ajouter un robot dans la base de données
  Future<int> insertRobot(RobotPersistence robot) async {
    Database db = await database;
    return await db.insert(table, robot.toMap());
  }

  // Récupérer tous les robots de la base de données
  Future<List<RobotPersistence>> getAllRobots() async {
    Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query(table);

    return List.generate(maps.length, (i) {
      return RobotPersistence.fromMap(maps[i]);
    });
  }

  // Supprimer un robot de la base de données
  Future<int> deleteRobot(int id) async {
    Database db = await database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }
}
