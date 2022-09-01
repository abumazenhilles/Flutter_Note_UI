import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class sqflitedb {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initialdb();
      return _db;
    } else {
      return _db;
    }
  }

  initialdb() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'swen.db');

    Database mydb = await openDatabase(path,
        onCreate: _onCreate, version: 1, onUpgrade: _onUpgrade);

    return mydb;
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE "posts"(
      "id" INTEGET NOT NULL PRIMARY KEY AUTOINCREMENT, 
      "post" TEXT NOT NULL,)'
      ''');
    print("Create database");
  }

  _onUpgrade(Database db, int oldversion, int newversion) {
    print("");
  }

  readData(String sql) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }

  insertData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }

  updateData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

  deleteData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }
}
