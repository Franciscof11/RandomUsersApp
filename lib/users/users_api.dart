// ignore_for_file: no_leading_underscores_for_local_identifiers, unnecessary_brace_in_string_interps

import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:http/http.dart';

class UsersAPIList {
  UsersAPIList(this.client);

  Client client;

  Future<List> getUsers() async {
    var usersBox = await Hive.openBox('users');
    List users = [];
    int _page = 3; /*Page Number*/
    int _results = 20; /*Number of searched users*/
    var url = Uri.parse(
        'https://randomuser.me/api/?format=json&page=${_page}&results=${_results}&inc=gender,name,email,picture&nat=br');
    var response = await client.get(url);
    if (response.statusCode == 200) {
      List results = json.decode(response.body)['results'];
      for (var i = 0; i < results.length; i++) {
        _results = 20;
        users.add(results[i]);
        usersBox.add(results[i]);
      }
    } else {
      throw Exception('Internet error');
    }
    _page++;
    return users;
  }
}
