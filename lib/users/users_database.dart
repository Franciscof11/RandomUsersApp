// ignore_for_file: unnecessary_null_comparison

import 'package:hive/hive.dart';

class UsersDbList {
  UsersDbList();

  Future<List> getUsers() async {
    var box = await Hive.openBox('users');
    List users = [];
    if (box != null) {
      users.addAll(box.values.toList());
    }
    return users;
  }
}
