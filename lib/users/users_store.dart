// ignore_for_file: library_private_types_in_public_api

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';
import 'package:usuarios/users/user_repository.dart';
import 'package:usuarios/users/users_database.dart';

import '../connectivity/connectivity_store.dart';
import '../main.dart';

part 'users_store.g.dart';

class UsersStore = _UsersStore with _$UsersStore;

abstract class _UsersStore with Store {
  Box? usersBox;
  final connectivityStore = getIt.get<ConnectivityStore>();

  ObservableList users = ObservableList();
  List usersAll = [];
  UsersRepository usersRepository;

  _UsersStore(this.usersRepository) {
    getUsersRepository();
  }

  @action
  getUsersRepository() async {
    List usersList = await usersRepository.getUsers();
    usersAll.addAll(usersList);
    users.addAll(usersList);
  }

  @action
  getUsersApi() async {
    if (connectivityStore.connectivityResult != ConnectivityResult.none) {
      usersAll = await usersRepository.getUsers();
      users.addAll(usersAll);
    }
  }

  @action
  getUsersDb() async {
    users.clear();
    List usersList = await UsersDbList().getUsers();
    users.addAll(usersList);
  }

  @action
  noFilter() async {
    users.clear();
    users.addAll(usersAll);
  }

  @action
  filterMale() async {
    List usersMale = usersAll;
    usersMale =
        usersMale.where((element) => element['gender'] == 'male').toList();
    users.clear();
    users.addAll(usersMale);
  }

  @action
  filterFemale() async {
    List usersFemale = usersAll;
    usersFemale =
        usersFemale.where((element) => element['gender'] == 'female').toList();
    users.clear();
    users.addAll(usersFemale);
  }

  @computed
  int get totalUser => users.length;
}
