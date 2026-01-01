import 'package:demo/controller/chat_history_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatHistoryTab extends StatelessWidget {
  const ChatHistoryTab({super.key});

  String timeAgo(DateTime time) {
    final diff = DateTime.now().difference(time);

    if (diff.inMinutes < 1) {
      return 'just now';
    } else if (diff.inMinutes < 60) {
      return '${diff.inMinutes} min${diff.inMinutes > 1 ? 's' : ''}';
    } else if (diff.inHours < 24) {
      return '${diff.inHours} hour${diff.inHours > 1 ? 's' : ''}';
    } else {
      return '${diff.inDays} day${diff.inDays > 1 ? 's' : ''}';
    }
  }

  @override
  Widget build(BuildContext context) {
    final history = context.watch<ChatHistoryController>().history;

    return ListView.builder(
      itemCount: history.length,
      itemBuilder: (_, i) {
        final h = history[i];
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.green.shade500,
            foregroundColor: Colors.white,
            child: Text(h.userName[0].toUpperCase()),
          ),
          title: Text(h.userName),
          subtitle: Text(h.lastMessage),
          trailing: Text(
            timeAgo(h.time),
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
        );
      },
    );
  }
}

// import 'package:demo/controller/chat_history_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class ChatHistoryTab extends StatelessWidget {
//   const ChatHistoryTab({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final history = context.watch<ChatHistoryController>().history;

//     return ListView.builder(
//       itemCount: history.length,
//       itemBuilder: (_, i) {
//         final h = history[i];
//         return ListTile(
//           leading: CircleAvatar(
//             child: Text(h.userName[0].toUpperCase()),
//             backgroundColor: Colors.green.shade500,
//             foregroundColor: Colors.white,
//           ),
//           title: Text(h.userName),
//           subtitle: Text(h.lastMessage),
//           trailing: Text(
//             '${h.time.hour}:${h.time.minute.toString().padLeft(2, '0')}',
//           ),
//         );
//       },
//     );
//   }
// }
