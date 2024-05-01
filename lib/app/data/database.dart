
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:tugas_10/app/data/user.dart';

class DbHelper {
  static const _databaseName = "app.db";
  static const _databaseVersion = 1;

  
  Database? _db;

  Future<Database> get db async{

    // Get a location using getDatabasesPath
      var databasesPath = await getDatabasesPath();
      String path = join(databasesPath, 'app.db');

      // open the database
      Database database = await openDatabase(path,
        version: 1,
        onCreate: (Database db, int version){
              _onCreate(db, version);
        }
      
      );

      return database;
    }

    Future<Database> initDb() async{
      return await db;
    }

    _onCreate(Database db, int version) async{
      await db.execute(
          'CREATE TABLE ${UserTable.tableName} (${UserTable.id} INTEGER PRIMARY KEY, ${UserTable.name} TEXT, ${UserTable.username} TEXT, ${UserTable.address} TEXT, ${UserTable.phoneNumber} TEXT, ${UserTable.password} TEXT, ${UserTable.photoUri} TEXT, ${UserTable.email} TEXT)');

    }

    

}