import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:teamlead/models/officer.dart';

class OfficersDatabase {
  static final OfficersDatabase instance = OfficersDatabase._init();

  static Database? _database;

  OfficersDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!; {

      _database = await _initDB('officers.db');
      return _database!;

    }
  }

  Future<Database> _initDB(String filePath) async {
      final dbPath = await getDatabasesPath();
      final path = join(dbPath, filePath);

      return await openDatabase(path, version: 1, onCreate: _createDB);

  }

  Future _createDB(Database db, int version) async {
    final idType =  'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final boolType = 'BOOLEAN NOT NULL';
    final integerType = 'INTEGER NOT NULL';


    await db.execute('''
    CREATE TABLE $tableOfficers (
      ${OfficerFields.id} $idType,
      ${OfficerFields.breakNumber} $integerType,
      ${OfficerFields.firstName} $textType,
      ${OfficerFields.lastName} $textType,
      ${OfficerFields.rdoOne} $textType,
      ${OfficerFields.rdoTwo} $textType,
      ${OfficerFields.rdoThree} $textType,
      ${OfficerFields.sex} $textType,
      ${OfficerFields.rank} $textType,
      ${OfficerFields.shift} $textType,
      ${OfficerFields.notes} $textType,
      ${OfficerFields.shiftBegin} $textType,
      ${OfficerFields.shiftEnd} $textType,
      ${OfficerFields.fullTime} $boolType,
      ${OfficerFields.breakOne} $boolType,
      ${OfficerFields.breakTwo} $boolType,
      ${OfficerFields.lunch} $boolType,
      ${OfficerFields.admin} $boolType,
      ${OfficerFields.lv} $boolType,
      ${OfficerFields.ehs} $boolType,
    )
    
    ''');

  }

  Future<Officer> create(Officer officer) async {
    final db = await instance.database;

    // left off 

    final id = await db.rawInsert('INSERT INTO table_name ($columns) VALUES ($values)');

    final id = await db.insert(tableOfficers, officer.toJson());
    return officer.copy(id: id);
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
  

}