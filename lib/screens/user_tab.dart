import 'package:demo/controller/user_contoller.dart';
import 'package:demo/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UsersTab extends StatelessWidget {
  const UsersTab({super.key});

  @override
  Widget build(BuildContext context) {
    final users = context.watch<UserController>().users;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () => _showAddUserDialog(context),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (_, i) {
          final u = users[i];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue.shade500,
              foregroundColor: Colors.white,
              child: Text(u.initial),
            ),
            title: Text(u.name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ChatScreen(user: u)),
              );
            },
          );
        },
      ),
    );
  }

  void _showAddUserDialog(BuildContext context) {
    final TextEditingController nameController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add User'),
          content: TextField(
            controller: nameController,
            decoration: const InputDecoration(
              hintText: 'Enter user name',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                final name = nameController.text.trim();

                if (name.isNotEmpty) {
                  context.read<UserController>().addUser(name);

                  Navigator.pop(context);

                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('$name added')));
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
