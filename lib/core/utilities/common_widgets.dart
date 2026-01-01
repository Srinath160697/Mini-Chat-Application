import 'package:demo/model/message_model.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final MessageModel message;
  const MessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final isSender = message.type == MessageType.sender;

    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: isSender
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          if (!isSender) const CircleAvatar(radius: 12, child: Text('R')),
          Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(12),
            constraints: const BoxConstraints(maxWidth: 260),
            decoration: BoxDecoration(
              color: isSender ? Colors.blue : Colors.grey.shade300,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              message.text,
              style: TextStyle(color: isSender ? Colors.white : Colors.black),
            ),
          ),
          if (isSender) const CircleAvatar(radius: 12, child: Text('Y')),
        ],
      ),
    );
  }
}

// import 'package:demo/model/message_model.dart';
// import 'package:flutter/material.dart';

// class MessageBubble extends StatelessWidget {
//   final MessageModel message;
//   const MessageBubble({super.key, required this.message});

//   @override
//   Widget build(BuildContext context) {
//     final isSender = message.type == MessageType.sender;

//     return Align(
//       alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
//       child: Container(
//         margin: const EdgeInsets.all(8),
//         padding: const EdgeInsets.all(12),
//         decoration: BoxDecoration(
//           color: isSender ? Colors.blue : Colors.grey[300],
//           borderRadius: BorderRadius.circular(16),
//         ),
//         child: Text(
//           message.text,
//           style: TextStyle(color: isSender ? Colors.white : Colors.black),
//         ),
//       ),
//     );
//   }
// }
