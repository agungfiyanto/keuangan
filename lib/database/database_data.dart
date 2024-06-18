import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:keuangan/database/data_model.dart';

class DatabaseData {
  final String _databaseName = "data_keuangan";
  final int _databaseVersion = 1;

  final namaTabel = "data";
  final String id = "id";
  final String nominal = "nominal";
  final String tanggal = "tanggal";
  final String keterangan = "keterangan";
  final String kategori = "kategori";

  Database? _database;
  Future<Database> cekDatabase() async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    String path = join(databasePath, _databaseName);
    return openDatabase(path,
        version: _databaseVersion, onCreate: _onCreateDatabase);
  }

  Future _onCreateDatabase(Database path, int version) async {
    await path.execute(
        'CREATE TABLE $namaTabel ($id INTEGER PRIMARY KEY, $nominal TEXT NULL, $tanggal DATETIME NULL, $keterangan TEXT NULL)');
  }

  Future<List<DataModel>> all() async {
    final data = await _database!.query(namaTabel);
    List<DataModel> hasil = data.map((e) => DataModel.fromJson(e)).toList();
    return hasil;
  }

  Future<int> insert(Map<String, dynamic> row) async {
    final query = await _database!.insert(namaTabel, row);
    return query;
  }

  Future<int> update(int id, Map<String, dynamic> row) async {
    final query = await _database!
        .update(namaTabel, row, where: '${this.id} = ?', whereArgs: [id]);
    return query;
  }

  Future<int> delete(int id) async {
    final query = await _database!
        .delete(namaTabel, where: '${this.id} = ?', whereArgs: [id]);
    return query;
  }
}
