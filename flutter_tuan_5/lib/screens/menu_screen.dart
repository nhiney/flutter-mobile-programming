import 'package:flutter/material.dart';

import 'package:flutter_tuan_5/screens/topic_selection_screen.dart';
import 'package:flutter_tuan_5/screens/momo_screen.dart';
import 'package:flutter_tuan_5/screens/momo_gift_screen.dart';
import 'package:flutter_tuan_5/screens/intro_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final menuItems = [
      MenuItem(
        title: 'Bài 1: ListView Demo',
        icon: Icons.list,
        screen: const TopicSelectionScreen(),
      ),
      MenuItem(
        title: 'Bài 2: MoMo UI',
        icon: Icons.account_balance_wallet,
        screen: const MomoScreen(), 
      ),
      MenuItem(
        title: 'Bài 3: Quà của tôi',
        icon: Icons.card_giftcard,
        screen: const MomoGiftScreen(),
      ),
      MenuItem(
        title: 'Bài 4: Shop Điện Thoại',
        icon: Icons.store,
        screen: const IntroScreen(),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Bài Tập'),
        backgroundColor: Colors.orange,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          final item = menuItems[index];
          return _MenuCard(item: item);
        },
      ),
    );
  }
}


// ===== MODEL =====
class MenuItem {
  final String title;
  final IconData icon;
  final Widget screen;

  MenuItem({required this.title, required this.icon, required this.screen});
}

// ===== UI ITEM =====
class _MenuCard extends StatelessWidget {
  final MenuItem item;

  const _MenuCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black26),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(2, 2)),
        ],
      ),
      child: ListTile(
        leading: Icon(item.icon, color: Colors.blue),

        title: Text(
          item.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),

        trailing: const Icon(Icons.arrow_forward_ios),

        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => item.screen),
          );
        },
      ),
    );
  }
}
