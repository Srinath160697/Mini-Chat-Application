import 'package:demo/model/user_model.dart';
import 'package:flutter/material.dart';

class UserController extends ChangeNotifier {
  final List<UserModel> users = [];

  void addUser(String name) {
    users.add(UserModel(name: name));
    notifyListeners();
  }
}
