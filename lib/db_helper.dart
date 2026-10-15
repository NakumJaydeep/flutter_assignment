import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;
  DBHelper._internal();

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await initDb();
    return _db!;
  }

  initDb() async {
    String path = join(await getDatabasesPath(), "assignment.db");
    return await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(
          "CREATE TABLE products(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, price REAL)");
      await db.execute(
          "CREATE TABLE students(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age INTEGER)");
    });
  }

  // Student CRUD operations
  Future<int> insertStudent(Map<String, dynamic> student) async {
    var dbClient = await db;
    return await dbClient.insert("students", student);
  }

  Future<List<Map<String, dynamic>>> getStudents() async {
    var dbClient = await db;
    return await dbClient.query("students");
  }

  Future<int> updateStudent(Map<String, dynamic> student) async {
    var dbClient = await db;
    return await dbClient.update("students", student,
        where: "id = ?", whereArgs: [student['id']]);
  }

  Future<int> deleteStudent(int id) async {
    var dbClient = await db;
    return await dbClient.delete("students", where: "id = ?", whereArgs: [id]);
  }
}
