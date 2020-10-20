import "package:path_provider/path_provider.dart";
import "package:flutter/material.dart";
import 'package:flutter/foundation.dart';
import 'package:sms/contact.dart';
import "dart:async";
import "dart:io" as io;
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';
import '../models/contactModel.dart';


class Storage{

  static Database _db;
  static const String NUMBER = 'number';
  static const String TABLE = 'contacts';
  static const String DB_NAME = 'contactsdb.db';

  Future<Database> get db async {
    if(_db!=null){
      return _db;
    }

    _db = await initDb();
    return _db;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_NAME);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE $TABLE ($NUMBER TEXT PRIMARY KEY)");
  }

  Future<ContactModel> save (ContactModel newContact) async {
    var dbClient = await db;
    // var res = await db.rawInsert('''
    // INSERT INTO contacts (number) VALUES (?)
    // ''', [newContact.number]);

    // return res;
    var res = await dbClient.insert(TABLE, newContact.toMap());
    return newContact;
  }
  
  Future<List<ContactModel>> getContacts() async {
    var dbClient = await db;
    List<Map> maps= await dbClient.query(TABLE, columns: [NUMBER]);
    List<ContactModel> contacts = [];
    if(maps.length > 0){
      for(int i=0; i<maps.length; i++){
        contacts.add(ContactModel.fromMap(maps[i]));
      }
    }
    return contacts;
  }

  Future<int> delete (String number) async {
    var dbClient = await db;
    return await dbClient.delete(TABLE, where: '$NUMBER = ?', whereArgs: [number] );

  }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }


  // Storage._();
  // static final Storage db = Storage._();
  // static Database _database;

  // Future<Database> get database async {
  //   print("inside database!!!!!!!!!!");
  //   if(_database!=null){
      
  //     return _database;
  //   }
  //   print("database nul!!!!");
  //   _database = await initDB();
  //   return _database;
  // }

  // initDB() async {
    
  //   String path = await getDatabasesPath();
    
  //   return await openDatabase(
  //     join(path, 'contactDB.db'),
  //     onCreate: (db, version) async {
        
  //       await db.execute(
  //         '''
  //         CREATE TABLE contacts(
  //           number TEXT PRIMARY KEY
  //         )
  //         '''
  //       );
  //       print("database created!!!!!!!!!");
        
  //     },
  //     version: 1,
  //   );
  // }

  // newContact(ContactModel contact) async {
  //   final db = await database;
    // var res = await db.rawInsert('''
    // INSERT INTO contacts (number) VALUES (?)
    // ''', [contact.number]);

    // return res;
  // }

  // Future<dynamic> getContact() async {
  //   final db = await database;
  //   // List<Map<String, dynamic>> res2 = await db.query("select count(*) from employee");
  //   // print(res2.length);
  //   List<Map<String, dynamic>> temp = [{'number': '123'}];
  //   List<Map<String, String>> res = await db.query('''
  //   SELECT number FROM contacts
  //   ''');
  //   print(res.length);
  //   if(res.length == 0){
  //     print('heloosredljufbsaodubgskolbgolwsrg');
  //     return temp;
  //   }
  //   else{
  //     List<Map<String, String>> resMap = res;
  //     return resMap.isNotEmpty ? resMap : Null;
  //   }
  // }

  
  // Future<String> get localPath async {
  //   final dir =  await getApplicationDocumentsDirectory();
  //   return dir.path;
  // }

  // Future<File> get localFile async {
  //   final path = await localPath;
  //   return File('$path/db.txt');
  // }

  // Future<String> readData() async {
  //   try {
  //     final file = await localFile;
  //     String body = await file.readAsString();
  //     return body;
  //   } catch (e) {
  //     return e.toString();
  //   }
  // }

  // Future<File> writeData(String data) async {
  //   final file = await localFile;
  //   return file.writeAsString("$data");
  // }
  
}