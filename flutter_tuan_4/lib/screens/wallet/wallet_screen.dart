import 'package:flutter/material.dart';
import '../../widgets/wallet/wallet_card.dart';
import '../../widgets/wallet/action_button.dart';
import '../../widgets/wallet/menu_item.dart';
class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("My Cards", style: TextStyle(color: Colors.black)),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              child: Icon(Icons.add, color: Colors.white),
            ),
          ),
        ],
      ),

      body: Column(
        children: [
          const WalletCard(),

          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              ActionButton(icon: Icons.send, label: "Send"),
              ActionButton(icon: Icons.credit_card, label: "Pay"),
              ActionButton(icon: Icons.receipt_long, label: "Bills"),
            ],
          ),

          const SizedBox(height: 30),

          const MenuItem(
            icon: Icons.bar_chart,
            title: "Statistics",
            subtitle: "Payment and Income",
          ),

          const MenuItem(
            icon: Icons.swap_horiz,
            title: "Transactions",
            subtitle: "Transaction History",
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {},
        child: const Icon(Icons.attach_money),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
