enum MessageType { sender, receiver }

class MessageModel {
  final String text;
  final MessageType type;

  MessageModel({required this.text, required this.type});
}

// enum MessageType { sender, receiver }

// class MessageModel {
//   final String text;
//   final MessageType type;
//   final DateTime time;

//   MessageModel({required this.text, required this.type, required this.time});
// }
