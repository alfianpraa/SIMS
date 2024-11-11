import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/components/button_widget.dart';
import 'package:myapp/screen/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/image/Logo.png"),
            const SizedBox(height: 40),
            Text("SIMS PPOB"),
            const SizedBox(height: 20),
            Text("Alfian Pratama"),
            const SizedBox(height: 20),
            ButtonWidget(
              name: "Next",
              width: 70,
              height: 30,
              press: () {
                Get.to(() => const LoginScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
