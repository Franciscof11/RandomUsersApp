import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:usuarios/home/widgets/user_widget.dart';
import 'package:usuarios/users/user_model.dart';
import 'package:usuarios/users/users_api.dart';
import 'package:usuarios/connectivity/connectivity_store.dart';
import 'package:usuarios/main.dart';
import 'package:usuarios/users/users_store.dart';
import 'package:usuarios/widgets/snackbar_error.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final ScrollController _scrollController;
  final connectivityStore = getIt.get<ConnectivityStore>();
  final usersStore = getIt.get<UsersStore>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    reaction((_) => connectivityStore.connectivityResult, (vaule) {
      if (vaule == ConnectivityResult.none && vaule != null) {
        ScaffoldMessenger.of(context).showSnackBar(snackBarError);
        usersStore.getUsersDb();
      }
    });
    _scrollController = ScrollController();
    _scrollController.addListener(infiniteScrolling);
  }

  infiniteScrolling() async {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      await usersStore.getUsersRepository();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  _menuItem(String select) {
    switch (select) {
      case "Mens":
        usersStore.filterMale();
        break;
      case "Womans":
        usersStore.filterFemale();
        break;
      case "All":
        usersStore.noFilter();
        break;
    }
  }

  List<String> itensMenu = ['Mens', 'Womans', 'All'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.filter_alt_outlined),
              onSelected: _menuItem,
              itemBuilder: (context) {
                return itensMenu.map((String item) {
                  return PopupMenuItem<String>(value: item, child: Text(item));
                }).toList();
              })
        ],
      ),
      body: Center(
          child: Observer(
        builder: (_) => ListView.separated(
          controller: _scrollController,
          itemBuilder: (context, index) {
            var user = usersStore.users[index];
            return ListTile(
              onTap: () {
                showDialog(context: context, builder: (context) => UserWidget(user: user));
              },
              leading: connectivityStore.connectivityResult ==
                          ConnectivityResult.wifi ||
                      connectivityStore.connectivityResult ==
                          ConnectivityResult.mobile
                  ? CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: NetworkImage(user['picture']['large']),
                    )
                  : CircleAvatar(),
              title: Text(user['name']['first']),
              subtitle: Text(user['email']),
              trailing:
                  Icon(user['gender'] == 'male' ? Icons.male : Icons.female),
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemCount: usersStore.users.length,
        ),
      )),
    );
  }


  SnackBar snackBarError = const SnackBar(
    backgroundColor: Colors.redAccent,
    content: Text('Você está sem internet!'),
  );
}
