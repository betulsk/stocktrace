import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:stok/kisiler.dart';
import 'package:stok/models/product.dart';

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
        "CREATE TABLE Product(id INTEGER PRIMARY KEY, name TEXT, categoryId INTEGER , stockQuantity INTEGER, price INTEGER, image TEXT, status INTEGER)");
    await db.execute(
        "CREATE TABLE Contact(id INTEGER PRIMARY KEY, fullName TEXT, phoneNumber TEXT,  avatar TEXT)");
    await db.execute(
        "CREATE TABLE Category(id INTEGER PRIMARY KEY, name TEXT, status INTEGER)");
  }

  Future<List<Product>> getProducts() async {
    var dbClient = await db;
    var result = await dbClient.query("Product", orderBy: "name");
    return result.map((data) => Product.fromMap(data)).toList();
  }

  Future<int> insertProduct(Product product) async {
    var dbClient = await db;
    return await dbClient.insert("Product", product.toMap());
  }

  //
  Future<int> updateProduct(Product product) async {
    var dbClient = await db;
    return await dbClient.update("Product", product.toMap(),
        where: "id=?", whereArgs: [product.id]);
  }

/*---------------CONTACT-------------------*/

  Future<List<Contact>> getContacts() async {
    var dbClient = await db;
    var result = await dbClient.query("Contact", orderBy: "fullName");
    return result.map((data) => Contact.fromMap(data)).toList();
  }

  Future<int> insertContact(Contact contact) async {
    var dbClient = await db;
    return await dbClient.insert("Contact", contact.toMap());
  }

  //
  Future<int> updateContact(Contact contact) async {
    var dbClient = await db;
    return await dbClient.update("Contact", contact.toMap(),
        where: "id=?", whereArgs: [contact.id]);
  }

  Future<void> removeContact(int id) async {
    var dbClient = await db;
    return await dbClient.delete("Contact", where: "id=?", whereArgs: [id]);
  }
}
