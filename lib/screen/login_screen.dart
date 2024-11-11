import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/components/button_widget.dart';
import 'package:myapp/components/custom_toast.dart';
import 'package:myapp/components/form_widget.dart';
import 'package:myapp/config/api.dart';
import 'package:myapp/config/validator.dart';
import 'package:myapp/screen/initial_screen.dart';
import 'package:myapp/screen/registration_screen.dart';
import 'package:myapp/theme.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool isObscure = true;
  final formKey = GlobalKey<FormState>();

  Future<void> _login() async {
    if (formKey.currentState!.validate()) {
      final response = await http.post(
        Uri.parse(Api.loginApi), // Ganti dengan URL API kamu
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': emailController.text,
          'password': passController.text,
        }),
      );
      print(response.body);
      print(jsonEncode({
        'email': emailController.text,
        'password': passController.text,
      }));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final token = data['data']['token'];
        print('Login successful, token: $token');
        customToast("login berhasil");
        Future.delayed(const Duration(seconds: 2), () {
          Get.to(() => const InitialScreen());
        });
      } else {
        print('Login failed with status code: ${response.statusCode}');
        customToast("username atau password salah");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
            child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Title
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/image/Logo.png", scale: 9),
                  SizedBox(width: 10),
                  Text("SIMS PPOB")
                ],
              ),
              SizedBox(height: 20),

              // Sub title
              Text(
                "Masuk atau buat akun \nuntuk memulai",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 20),

              // Form
              SizedBox(
                width: 250,
                child: Column(
                  children: [
                    // Form Email
                    FormWidget(
                      hintText: "masukkan email anda",
                      controller: emailController,
                      prefix: Icon(Icons.alternate_email, color: Colors.grey),
                      validator: validateEmail,
                    ),
                    SizedBox(height: 20),

                    // Form Password
                    FormWidget(
                      hintText: "masukkan password anda",
                      controller: passController,
                      prefix: Icon(
                        Icons.lock,
                        color: Colors.grey,
                      ),
                      validator: validatePassword,
                      isObscure: isObscure,
                      suffix: IconButton(
                        onPressed: () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                        icon: Icon(
                          isObscure ? Icons.visibility_off : Icons.visibility,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 40),

              // Login Button
              ButtonWidget(
                name: "Masuk",
                width: 250,
                height: 40,
                press: _login,
              ),
              SizedBox(height: 5),

              // Registrasi
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "belum punya akun? registrasi",
                    style: TextStyle(
                        color: Color.fromRGBO(121, 120, 120, 1), fontSize: 11),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const RegistrationScreen());
                    },
                    child: Text(
                      " di sini",
                      style: TextStyle(
                          color: secondaryColor,
                          fontSize: 11,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
