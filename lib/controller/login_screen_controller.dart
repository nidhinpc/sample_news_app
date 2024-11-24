// import 'package:flutter/material.dart';

// import 'package:sqflite/sqflite.dart';

// class LogAndRegScreenController with ChangeNotifier {
//   static late Database myDatabase;
//   static List<Map> userDataList = [];

//   /// Initialize the database
//   static Future initDb() async {
//     myDatabase = await openDatabase("userData.db", version: 1,
//         onCreate: (Database db, int version) async {
//       await db.execute(
//           'CREATE TABLE user (id INTEGER PRIMARY KEY, email TEXT, password TEXT)');
//       print(userDataList);
//     });
//   }

//   /// Add a new user to the database
//   static Future addUser(
//       {required String email, required String password}) async {
//     await myDatabase.rawInsert(
//         'INSERT INTO user(email, password) VALUES(?, ?)', [email, password]);
//     await getAllUsers();
//   }

//   /// Retrieve all users from the database
//   static Future getAllUsers() async {
//     userDataList = await myDatabase.rawQuery('SELECT * FROM user');
//     print(userDataList);
//   }

//   /// Remove a user from the database by ID
//   static Future removeUser(int id) async {
//     await myDatabase.rawDelete('DELETE FROM user WHERE id = ?', [id]);
//     await getAllUsers();
//   }

//   /// Update a user's email and password by ID
//   static Future updateUser(String newEmail, String newPassword, int id) async {
//     await myDatabase.rawUpdate(
//         'UPDATE user SET email = ?, password = ? WHERE id = ?',
//         [newEmail, newPassword, id]);
//     await getAllUsers();
//   }
// }
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreencontroller {
  static late final SharedPreferences prefs;
  static String? storedEmail;
  static String? storedPassword;
  static bool? storedToken;

  static initsharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future addData(String username, String password, bool token) async {
    await prefs.setString("name", username);
    await prefs.setString("pass", password);
    await prefs.setBool("token", token);
  }

  static getdata() async {
    storedEmail = prefs.getString('name');
    storedPassword = prefs.getString('pass');
  }
}
