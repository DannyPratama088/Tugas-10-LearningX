
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:tugas_10/app/data/database.dart';

class UserTable{
      static String tableName = "user";
      static String id = "id";
      static String username = "username";
      static String password = "password";
      static String name = "name";
      static String phoneNumber = "phoneNumber";
      static String address = "address";
      static String photoUri = "photo_uri";
      static String email = "email";
}

class User{
  int? id;
  String username;
  String password;
  String name;
  String phoneNumber;
  String address;
  String? photoUri;
  String email;
  

  User({
    this.id,
    required this.username,
    required this.password,
    required this.name,
    required this.phoneNumber,
    required this.address,
    required this.email,
    this.photoUri
  });


  
  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      "id": id,
      "username": username,
      "password": password,
      "name": name,
      "phoneNumber": phoneNumber,
      "address": address,
      "photo_uri": photoUri,
      "email": email,

    };

    if (id != null) {
      map[UserTable.id] = id;
      map[UserTable.username] = username;
      map[UserTable.password] = password;
      map[UserTable.name] = name;
      map[UserTable.phoneNumber] = phoneNumber;
      map[UserTable.address] = address;
      map[UserTable.photoUri] = photoUri;
      map[UserTable.email] = email;
    }

    return map;
  }

  factory User.fromMap(Map<String, dynamic> map){
        return User(
            id : map[UserTable.id],
        username : map[UserTable.username],
        password : map[UserTable.password],
        name : map[UserTable.name],
        phoneNumber : map[UserTable.phoneNumber],
        address : map[UserTable.address],
        photoUri : map[UserTable.photoUri],
        email : map[UserTable.email],
        ); 
  }
}

class UserProvider{


  Future<Database> get db_app async{
    return await DbHelper().db;
  }



  Future<User> insert(User user) async {
    Database db = await db_app;
    user.id = await db.insert(UserTable.tableName, user.toMap());
    return user;
  }

  Future<User?> getUserByUsername(String username) async {
    Database db = await db_app;

    List<Map<String, dynamic>> users = await db.query(     
        UserTable.tableName, 
        where: '${UserTable.username} = ?',
        whereArgs: [username]       
    );

     if (users.isNotEmpty) {
      return User.fromMap(users.first);
    }


    return null;
  }

  void savePhoto(int id, String photoUri)async{
     Database db = await db_app;
     await db.update(
      UserTable.tableName, 
      {UserTable.photoUri: photoUri},
      where: "id = ?",
      whereArgs: [id]
      );
  }

}