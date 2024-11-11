import 'package:flutter/material.dart';
import 'package:myapp/components/balance_card.dart';
import 'package:myapp/components/topup_screen/topup_menu.dart';

class TopupScreen extends StatefulWidget {
  const TopupScreen({super.key});

  @override
  State<TopupScreen> createState() => _TopupScreenState();
}

class _TopupScreenState extends State<TopupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Top Up"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BalanceCard(),
              SizedBox(height: 20),
              Text("Silahkan masukkan"),
              Text("nominal Top Up", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              SizedBox(height: 20),
              TopupMenu()
            ],
          ),
        ),
      ),
    );
  }
}
