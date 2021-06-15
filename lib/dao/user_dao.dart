import 'dart:async';

import 'package:hive/hive.dart';
import 'package:login_test/database/user_database.dart';
import 'package:login_test/model/ian_model.dart';
import 'package:login_test/model/user_model.dart';

class UserDao {
  final dbProvider = DatabaseProvider.dbProvider;

  Future<int> createUser(User user) async {
    final db = await (dbProvider.database);

    var result = db!.insert(userTable, user.toDatabaseJson());
    return result;
  }

  Future<int> deleteUser(int id) async {
    final db = await (dbProvider.database);
    var result = await db!.delete(userTable, where: "id = ?", whereArgs: [id]);
    return result;
  }

  Future<bool> checkUser(int id) async {
    final db = await (dbProvider.database);
    try {
      List<Map> users =
          await db!.query(userTable, where: 'id = ?', whereArgs: [id]);
      if (users.length > 0) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      return false;
    }
  }

  // addUser(Token token) {
  //   // I need a HiveUser user here.
  //   final userBox = Hive.box('user');
  //   userBox.add(Token.fromUser(token));
  // }
}
