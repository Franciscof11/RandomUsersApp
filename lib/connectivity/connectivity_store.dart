import 'package:mobx/mobx.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

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
