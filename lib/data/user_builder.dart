import 'package:flutter_9/data/user.dart';

class User_Builder {
  List<User> userdata = [
    User(
      userid: 'danu',
      password: 'hallo',
      name: 'danu wardana',
    ),
    User(
      userid: 'asep',
      password: 'punten',
      name: 'kang asep',
    )
  ];
  bool cekLogin(String? user, String? pass) {
    return this
        .userdata
        .where((element) => element.userid == user && element.password == pass)
        .isNotEmpty;
  }

  String getName(List<User> userlist, String? userselect) {
    final userSelected =
        userlist.firstWhere((user) => user.userid == userselect);
    return userSelected.name;
  }
}
