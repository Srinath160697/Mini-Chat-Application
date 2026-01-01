import 'package:demo/controller/chat_controller.dart';
import 'package:demo/controller/chat_history_controller.dart';
import 'package:demo/core/utilities/common_widgets.dart';
import 'package:demo/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  final UserModel user;
  const ChatScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final chat = context.watch<ChatController>();
    final messages = chat.getMessages(user.name);
    final input = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.blue.shade500,
              foregroundColor: Colors.white,
              child: Text(user.initial),
            ),
            const SizedBox(width: 10),
            Flexible(child: Text(user.name)),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (_, i) => MessageBubble(message: messages[i]),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 6,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade800),
                    ),
                    child: TextField(
                      controller: input,
                      decoration: const InputDecoration(
                        hintText: 'Type a message…',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    final text = input.text.trim();
                    if (text.isEmpty) return;

                    // ✅ Update chat history
                    context.read<ChatHistoryController>().update(
                      user.name,
                      text,
                    );

                    // ✅ Send message for this user only
                    context.read<ChatController>().sendMessage(user.name, text);

                    input.clear();
                  },
                  // onPressed: () {
                  //   if (input.text.trim().isEmpty) return;

                  //   chat.sendMessage(user.name, input.text.trim());

                  //   input.clear();
                  // },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/////////////////////////////
// class ChatScreen extends StatelessWidget {
//   final UserModel user;
//   const ChatScreen({super.key, required this.user});

//   @override
//   Widget build(BuildContext context) {
//     final chat = context.watch<ChatController>();
//     final input = TextEditingController();

//     return Scaffold(
//       appBar: AppBar(title: Text(user.name)),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: chat.messages.length,
//               itemBuilder: (_, i) => MessageBubble(message: chat.messages[i]),
//             ),
//           ),
//           Row(
//             children: [
//               Expanded(child: TextField(controller: input)),
//               IconButton(
//                 icon: const Icon(Icons.send),
//                 onPressed: () {
//                   context.read<ChatHistoryController>().update(
//                     user.name,
//                     input.text,
//                   );
//                   chat.sendMessage(input.text);
//                   input.clear();
//                 },
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

///////////////////////////////////
// import 'package:demo/controller/chat_controller.dart';
// import 'package:demo/core/utilities/common_widgets.dart';
// import 'package:demo/model/user_model.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class ChatScreen extends StatelessWidget {
//   final UserModel user;
//   const ChatScreen({super.key, required this.user});

//   @override
//   Widget build(BuildContext context) {
//     final controller = context.watch<ChatController>();
//     final input = TextEditingController();

//     return Scaffold(
//       appBar: AppBar(title: Text(user.name)),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: controller.messages.length,
//               itemBuilder: (_, i) =>
//                   MessageBubble(message: controller.messages[i]),
//             ),
//           ),
//           Row(
//             children: [
//               Expanded(child: TextField(controller: input)),
//               IconButton(
//                 icon: const Icon(Icons.send),
//                 onPressed: () {
//                   controller.sendMessage(input.text);
//                   input.clear();
//                 },
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
