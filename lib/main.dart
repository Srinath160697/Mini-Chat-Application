import 'package:demo/controller/chat_controller.dart';
import 'package:demo/controller/chat_history_controller.dart';
import 'package:demo/controller/user_contoller.dart';
import 'package:demo/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserController()),
        ChangeNotifierProvider(create: (_) => ChatController()),
        ChangeNotifierProvider(create: (_) => ChatHistoryController()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mini Chat',
      theme: ThemeData(useMaterial3: true),
      home: const MainScreen(),
      // home: const HomeScreen(),
    );
  }
}
