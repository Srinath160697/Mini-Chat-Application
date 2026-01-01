import 'package:demo/model/chat_history_model.dart';
import 'package:flutter/material.dart';

class ChatHistoryController extends ChangeNotifier {
  final List<ChatHistoryModel> history = [];

  void update(String user, String msg) {
    history.removeWhere((e) => e.userName == user);
    history.insert(
      0,
      ChatHistoryModel(userName: user, lastMessage: msg, time: DateTime.now()),
    );
    notifyListeners();
  }
}

// import 'package:demo/model/chat_history_model.dart';
// import 'package:flutter/material.dart';

// class ChatHistoryController extends ChangeNotifier {
//   final List<ChatHistoryModel> history = [];

//   void updateHistory(String user, String message) {
//     history.removeWhere((e) => e.userName == user);
//     history.insert(
//       0,
//       ChatHistoryModel(
//         userName: user,
//         lastMessage: message,
//         time: DateTime.now(),
//       ),
//     );
//     notifyListeners();
//   }
// }
