import 'package:flutter/material.dart';
import 'package:myapp/theme.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/image/Background Saldo.png"),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Saldo anda",
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 18,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
