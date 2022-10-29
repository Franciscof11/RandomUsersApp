import 'package:flutter/material.dart';

class UserWidget extends StatelessWidget {
  var user;

  UserWidget({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: CircleAvatar(
        radius: 120,
        backgroundColor: Colors.transparent,
        backgroundImage: NetworkImage(user['picture']['large']),
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${user['name']['title']} ${user['name']['first']} ${user['name']['last']}',
              textAlign: TextAlign.center,
            ),
            Text(
              '${user['email']}',
              textAlign: TextAlign.center,
            ),
            Text(
              user['gender'] == 'male' ? 'Man' : 'Woman',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
