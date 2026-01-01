import 'package:demo/core/network/api_services.dart';
import 'package:demo/model/message_model.dart';
import 'package:flutter/material.dart';

// class ChatController extends ChangeNotifier {
//   final List<MessageModel> messages = [];

//   void sendMessage(String text) async {
//     messages.add(MessageModel(text: text, type: MessageType.sender));
//     notifyListeners();

//     final reply = await ApiService.fetchReceiverMessage();
//     messages.add(MessageModel(text: reply, type: MessageType.receiver));
//     notifyListeners();
//   }
// }

//////////////////////

class ChatController extends ChangeNotifier {
  /// userName -> messages
  final Map<String, List<MessageModel>> _userMessages = {};

  List<MessageModel> getMessages(String userName) {
    return _userMessages[userName] ?? [];
  }

  Future<void> sendMessage(String userName, String text) async {
    // create chat list if not exists
    _userMessages.putIfAbsent(userName, () => []);

    _userMessages[userName]!.add(
      MessageModel(text: text, type: MessageType.sender),
    );
    notifyListeners();

    final reply = await ApiService.fetchReceiverMessage();

    _userMessages[userName]!.add(
      MessageModel(text: reply, type: MessageType.receiver),
    );
    notifyListeners();
  }
}
