import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:stok/models/product.dart';
import 'package:stok/urun_ozellik.dart';

class DbHelper {
  static Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  initDb() async {
    var dbFolder = await getDatabasesPath();
    String path = join(dbFolder, "Stock.db");
    return await openDatabase(path, onCreate: _onCreate, version: 1);
  }

  FutureOr<void> _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE Product(id INTEGER PRIMARY KEY, name TEXT, categoryId INTEGER,stockQuantity INTEGER, avatar TEXT, status INTEGER)");
    await db.execute(
        "CREATE TABLE Category(id INTEGER PRIMARY KEY, name TEXT, status INTEGER)");
  }

  Future<List<Product>> getProducts() async {
    var dbClient = await db;
    var result = await dbClient.query("Product", orderBy: "name");
    return result.map((data) => Product.fromMap(data)).toList();
  }

  Future<int> insertContact(UrunOzellikleri contact) async {
    var dbClient = await db;
    return await dbClient.insert("Contact", contact.toMap());
  }

  //
  Future<int> updateContact(UrunOzellikleri contact) async {
    var dbClient = await db;
    return await dbClient.update("Contact", contact.toMap(),
        where: "id=?", whereArgs: [contact.id]);
  }
  //
  // Future<void> removeContact(int id) async {
  //   var dbClient = await db;
  //   return await dbClient.delete("Contact", where: "id=?", whereArgs: [id]);
  // }
}
