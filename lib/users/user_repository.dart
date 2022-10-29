import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:usuarios/users/user_model.dart';
import 'package:usuarios/users/users_api.dart';
import 'package:usuarios/users/users_database.dart';

import '../connectivity/connectivity_store.dart';
import '../main.dart';

class UsersRepository {
  UsersRepository(this.usersAPIList);

  final connectivityStore = getIt.get<ConnectivityStore>();

  final UsersAPIList usersAPIList;
  final UsersDbList usersDbList = UsersDbList();

  Future<List> getUsers() async {
    List users = [];
    print('User Repository ${connectivityStore.connectivityResult}');
    users = await usersAPIList.getUsers();
    return users;
  }
}
