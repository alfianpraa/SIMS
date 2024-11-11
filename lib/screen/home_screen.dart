import 'package:flutter/material.dart';
import 'package:myapp/components/balance_card.dart';
import 'package:myapp/components/home_screen/banner_card.dart';
import 'package:myapp/components/home_screen/service_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset("assets/image/Logo.png", scale: 9),
                      const SizedBox(width: 10),
                      const Text(
                        "SIMS PPOB",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Image.asset("assets/image/Profile Photo.png"),
                ],
              ),
              SizedBox(height: 20),
              Text(
                "Selamat datang,",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "(Nama User)",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              BalanceCard(),
              SizedBox(height: 20),
              ServiceCard(),
              SizedBox(height: 20),
              BannerCard()
            ],
          ),
        ),
      ),
    );
  }
}
