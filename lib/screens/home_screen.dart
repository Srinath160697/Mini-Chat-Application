import 'package:demo/screens/chat_history.dart';
import 'package:demo/screens/user_tab.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AppBarSwitcher(
          selectedIndex: index,
          onChanged: (i) => setState(() => index = i),
        ),
      ),
      body: IndexedStack(
        index: index,
        children: const [UsersTab(), ChatHistoryTab()],
      ),
    );
  }
}

class AppBarSwitcher extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  const AppBarSwitcher({
    super.key,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [_tab('Users', 0), _tab('Chat History', 1)],
      ),
    );
  }

  Widget _tab(String text, int i) {
    return GestureDetector(
      onTap: () => onChanged(i),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: selectedIndex == i ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(text),
      ),
    );
  }
}
