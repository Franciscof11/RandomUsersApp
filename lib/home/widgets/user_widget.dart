// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class UserWidget extends StatelessWidget {
  var user;

  UserWidget({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: CircleAvatar(
        radius: 140,
        backgroundColor: Colors.transparent,
        backgroundImage: NetworkImage(user['picture']['large']),
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                text: "Full name: ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
                children: <TextSpan>[
                  TextSpan(
                      text:
                          '${user['name']['title']} ${user['name']['first']} ${user['name']['last']}',
                      style: TextStyle(
                          color: Colors.purple,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                text: "Email: ",
                style: TextStyle(color: Colors.black, fontSize: 15),
                children: <TextSpan>[
                  TextSpan(
                      text: '${user['email']}',
                      style: TextStyle(
                          color: Colors.purple,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                text: 'Gender: ',
                style: TextStyle(color: Colors.black, fontSize: 15),
                children: <TextSpan>[
                  TextSpan(
                      text: user['gender'] == 'male' ? 'Man' : 'Woman',
                      style: TextStyle(
                          color: Colors.purple,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
