import 'package:flutter/material.dart';
import 'package:myapp/components/balance_card.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transaksi"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BalanceCard(),
              SizedBox(height: 40),
              Text(
                "Transaksi",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 100),
              Center(
                  child: Text(
                "Maaf tidak ada histori transaksi saat ini",
                style: TextStyle(color: Colors.grey),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
