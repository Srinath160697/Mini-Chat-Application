enum MessageType { sender, receiver }

class MessageModel {
  final String text;
  final MessageType type;

  MessageModel({required this.text, required this.type});
}
