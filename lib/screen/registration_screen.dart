import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/components/button_widget.dart';
import 'package:myapp/components/custom_toast.dart';
import 'package:myapp/components/form_widget.dart';
import 'package:myapp/config/api.dart';
import 'package:myapp/config/validator.dart';
import 'package:myapp/theme.dart';
import 'package:http/http.dart' as http;

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final cPassController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool isObscure = true;

  Future<void> _regist() async {
    if (formKey.currentState!.validate()) {
      final response = await http.post(
        Uri.parse(Api.registApi), // Ganti dengan URL API kamu
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': emailController.text,
          'first_name': firstNameController.text,
          'last_name': lastNameController.text,
          'password': passController.text,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final message = data['message'];
        customToast(message);
        setState(() {
          emailController.clear();
          firstNameController.clear();
          lastNameController.clear();
          passController.clear();
          cPassController.clear();
        });
      } else {
        customToast("email sudah terdaftar");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
            child: Form(
          key: formKey,
          child: SingleChildScrollView(
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
                  "Lengkapi data untuk \n membuat akun",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 20),

                // Form
                SizedBox(
                  width: 250,
                  child: Column(children: [
                    // Form Email
                    FormWidget(
                      hintText: "masukkan email anda",
                      controller: emailController,
                      prefix: Icon(Icons.alternate_email, color: Colors.grey),
                      validator: validateEmail,
                    ),
                    SizedBox(height: 20),

                    // Form Front Name
                    FormWidget(
                      hintText: "nama depan",
                      controller: firstNameController,
                      prefix: Icon(Icons.person, color: Colors.grey),
                      validator: validateName,
                    ),
                    SizedBox(height: 20),

                    // Form Last Name
                    FormWidget(
                      hintText: "nama belakang",
                      controller: lastNameController,
                      prefix: Icon(Icons.person, color: Colors.grey),
                      validator: validateName,
                    ),
                    SizedBox(height: 20),

                    // Form Password
                    FormWidget(
                      hintText: "buat password",
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
                    SizedBox(height: 20),

                    // Form Konfirmasi Password
                    FormWidget(
                      hintText: "konfirmasi password",
                      controller: cPassController,
                      prefix: Icon(
                        Icons.lock,
                        color: Colors.grey,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "konfirmasi password terlebih dahulu";
                        }
                        if (value != passController.text) {
                          return 'password tidak sama';
                        }
                        if (value.length < 8) {
                          return 'password minimal 8 karakter';
                        }
                        return null;
                      },
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
                  ]),
                ),

                SizedBox(height: 40),

                // Login Button
                ButtonWidget(
                  name: "Registrasi",
                  width: 250,
                  height: 40,
                  press: _regist,
                ),
                SizedBox(height: 5),

                // Registrasi
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "sudah punya akun? login",
                      style: TextStyle(
                          color: Color.fromRGBO(121, 120, 120, 1),
                          fontSize: 11),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.back();
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
          ),
        )),
      ),
    );
  }
}
