import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:bmi_calculator/user.dart';

class DatabaseHandler {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'example1.db'),
      onCreate: (database, version) async {
        await database.execute(
          //"delete from example.db"
          "CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT NOT NULL,value DOUBLE NOT NULL)",
        );
      },
      version: 1,
    );
    
  }

//     Future<int> deletetable()  {  
//     //DROP TABLE IF EXISTS my_table
//       final Database db =  initializeDB();
//     //db.query("")
//       db.query("delete from "+ 'example.db');
//     db.execute("delete from "+ 'example.db');
//     return 0;
//     }
  //Saving Data in SQLite
    Future<int> insertUser(List<User> users) async {
    int result = 0;
    final Database db = await initializeDB();
    for(var user in users){
      result = await db.insert('users', user.toMap());
    }
    return result;
  }

  //Retrieve Data From Db
    Future<List<User>> retrieveUsers() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('users');
    return queryResult.map((e) => User.fromMap(e)).toList();
  }
  //delete
    Future<void> deleteUser(int id) async {
    final db = await initializeDB();
    await db.delete(
      'users',
      where: "id = ?",
      whereArgs: [id],
    );
  }

}
