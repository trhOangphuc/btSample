import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'user_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT NOT NULL,
        password TEXT NOT NULL
      )
    ''');
  }

  Future<int> insertUser(String username, String password) async {
    Database db = await instance.database;
    return await db.insert('users', {'username': username, 'password': password});
  }

  Future<Map<String, dynamic>?> getUserByUsername(String username) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> users = await db.query(
      'users',
      where: 'username = ?',
      whereArgs: [username],
    );
    return users.isNotEmpty ? users.first : null;
  }
}