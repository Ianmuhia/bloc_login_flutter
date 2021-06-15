import 'package:hive/hive.dart';

import 'dart:async';

import 'package:login_test/model/ian_model.dart';

class UserDatabase {
  String _boxName = "USER";
  // open a box
  Future<Box> userBox() async {
    var box = await Hive.openBox<Token>(_boxName);
    return box;
  }

  // to add data in box
  Future<Token?> addToBox(Token token) async {
    final box = await userBox();

    await box.add(token);
  }

  // delete data from box
  Future<void> deleteFromBox(int index) async {
    final box = await userBox();
    await box.deleteAt(index);
  }

  // delete all data from box
  Future<void> deleteAll() async {
    final box = await userBox();
    await box.clear();
  }

  // // update data
  // Future<void> updateNote(int index, Note note) async {
  //   final box = await userBox();
  //   await box.putAt(index, note);
  // }
}
