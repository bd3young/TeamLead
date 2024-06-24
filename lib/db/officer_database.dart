import 'dart:async';
import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

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
  // String in front of filepath
  Future<Database> _initDB(filePath) async {
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

    // final json = officer.toJson();
    // final columns = '${OfficerFields.breakNumber}, ${OfficerFields.firstName}, ${OfficerFields.lastName}, ${OfficerFields.rdoOne},${OfficerFields.rdoTwo}, ${OfficerFields.rdoThree}, ${OfficerFields.sex}, ${OfficerFields.rank}, ${OfficerFields.shift}, ${OfficerFields.notes}, ${OfficerFields.shiftBegin}, ${OfficerFields.shiftEnd}, ${OfficerFields.fullTime}, ${OfficerFields.breakOne}, ${OfficerFields.breakTwo}, ${OfficerFields.lunch}, ${OfficerFields.admin}, ${OfficerFields.lv}, ${OfficerFields.ehs}, ';
    // final values = '${json[OfficerFields.breakNumber]}, ${json[OfficerFields.firstName]}, ${json[OfficerFields.lastName]}, ${json[OfficerFields.rdoOne]},${json[OfficerFields.rdoTwo]}, ${json[OfficerFields.rdoThree]}, ${json[OfficerFields.sex]}, ${json[OfficerFields.rank]}, ${json[OfficerFields.shift]}, ${json[OfficerFields.notes]}, ${json[OfficerFields.shiftBegin]}, ${json[OfficerFields.shiftEnd]}, ${json[OfficerFields.fullTime]}, ${json[OfficerFields.breakOne]}, ${json[OfficerFields.breakTwo]}, ${json[OfficerFields.lunch]}, ${json[OfficerFields.admin]}, ${json[OfficerFields.lv]}, ${json[OfficerFields.ehs]}, ';

    // final id = await db.rawInsert('INSERT INTO table_name ($columns) VALUES ($values)');

    final id = await db.insert(tableOfficers, officer.toJson());
    return officer.copy(id: id);
  }

  Future<Officer> readOfficer(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableOfficers, 
      columns: OfficerFields.values,
      where: '${OfficerFields.id} = ?',
      whereArgs: [id],
      );

    if (maps.isNotEmpty) {
      return Officer.fromJson(maps.first);
    }
    else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Officer>> readAllOfficers() async {
    final db = await instance.database;

    final orderBy = '${OfficerFields.rank} DESC';

    final result = await db.query(tableOfficers, orderBy: orderBy);

    return result.map((json) => Officer.fromJson(json)).toList();
  }

  Future<int> update(Officer officer) async {
    final db = await instance.database;

    return db.update(tableOfficers, officer.toJson(), where: '${OfficerFields.id} = ?', whereArgs: [officer.id],);
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(tableOfficers, where: '${OfficerFields.id} = ?', whereArgs: [id],);
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
  

}