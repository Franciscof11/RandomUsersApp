// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:usuarios/connectivity/connectivity_store.dart';
import 'package:usuarios/home/widgets/user_widget.dart';
import 'package:usuarios/main.dart';
import 'package:usuarios/users/users_store.dart';

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
    super.dispose();
    _scrollController.dispose();
  }

  _menuItem(String select) {
    switch (select) {
      case "All":
        usersStore.noFilter();
        break;
      case "Men":
        usersStore.filterMale();
        break;
      case "Women":
        usersStore.filterFemale();
        break;
    }
  }

  List<String> itensMenu = [
    'All',
    'Men',
    'Women',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(89, 53, 140, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(89, 53, 140, 1),
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              '| Random Users App |',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
        ),
        actions: [
          /*Genre Filter Button*/
          PopupMenuButton(
              icon: Icon(
                Icons.filter_alt_outlined,
                color: Colors.white,
              ),
              onSelected: _menuItem,
              itemBuilder: (context) {
                return itensMenu.map((String item) {
                  return PopupMenuItem<String>(value: item, child: Text(item));
                }).toList();
              }),
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
                showDialog(
                    context: context,
                    builder: (context) => UserWidget(user: user));
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
              textColor: Colors.black,
              subtitle: Text(user['email']),
              trailing:
                  Icon(user['gender'] == 'male' ? Icons.male : Icons.female),
              iconColor: Colors.black,
              tileColor: Colors.white,
              contentPadding: EdgeInsets.only(left: 20, right: 20),
              focusColor: Colors.deepPurple[400],
              horizontalTitleGap: 15,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              height: 20,
              color: Color.fromRGBO(89, 53, 140, 1),
            );
          },
          itemCount: usersStore.users.length,
          padding: EdgeInsets.only(top: 10, right: 20, left: 20),
        ),
      )),
    );
  }

  SnackBar snackBarError = const SnackBar(
    backgroundColor: Colors.redAccent,
    content: Text('Lost internet connection!'),
  );
}
