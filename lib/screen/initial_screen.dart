import 'package:flutter/material.dart';
import 'package:myapp/screen/home_screen.dart';
import 'package:myapp/screen/profile_screen.dart';
import 'package:myapp/screen/topup_screen.dart';
import 'package:myapp/screen/transaction_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  int currentSelectedScreen = 0;

  void updateCurrentScreen(int index) {
    setState(() {
      currentSelectedScreen = index;
    });
  }

  final screen = [
    const HomeScreen(),
    const TopupScreen(),
    const TransactionScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[currentSelectedScreen],
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 12,
        unselectedFontSize: 12,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: updateCurrentScreen,
        currentIndex: currentSelectedScreen,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: "Top Up",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card),
            label: "Transaction",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
