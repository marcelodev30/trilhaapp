import 'package:imc/data/models/imc_models.dart';
import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;

class ImcRepository {
  ///static const String _tabelName = 'imc';

  static Future<Database> getDatabase() async {
    Database db = await openDatabase(
      path.join(await getDatabasesPath(), 'database.db'),
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
            'CREATE TABLE imc (id INTEGER PRIMARY KEY, altura REAL,peso REAL, imc REAL, resultado TEXT)');
      },
    );
    return db;
  }

  static Future save(ImcModels models) async {
    try {
      Database db = await getDatabase();
      db.insert('imc', models.toJson());
    } catch (erro) {
      return;
    }
  }

  Future<void> delete(int id) async {
    Database db = await getDatabase();
    await db.delete(
      'imc',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<List<ImcModels>> getData() async {
    try {
      Database db = await getDatabase();
      List<Map<String, dynamic>> dadosDB = await db.query('imc');
      return List.generate(dadosDB.length, (index) {
        return ImcModels.fromJson(dadosDB[index]);
      });
    } catch (e) {
      return List<ImcModels>.empty();
    }
  }
}
