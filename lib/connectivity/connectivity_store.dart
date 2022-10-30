// ignore_for_file: library_private_types_in_public_api

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:mobx/mobx.dart';

part 'connectivity_store.g.dart';

class ConnectivityStore = _ConnectivityStore with _$ConnectivityStore;

abstract class _ConnectivityStore with Store {
  @observable
  ConnectivityResult? connectivityResult;

  _ConnectivityStore() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      connectivityResult = result;
    });
  }
}
