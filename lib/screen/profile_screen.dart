import 'package:flutter/material.dart';
import 'package:myapp/components/button_widget.dart';
import 'package:myapp/components/form_widget.dart';
import 'package:myapp/theme.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Akun"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: primaryColor,
                  foregroundImage:
                      AssetImage("assets/image/Profile Picture.png"),
                ),
                SizedBox(height: 10),
                Text(
                  "(Nama user)",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text("Email"),
                ),
                SizedBox(height: 10),
                FormWidget(
                    hintText: ("user email"),
                    controller: TextEditingController(),
                    prefix: Icon(
                      Icons.alternate_email,
                      color: Colors.grey,
                    )),
                SizedBox(height: 20),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text("Nama Depan"),
                ),
                SizedBox(height: 10),
                FormWidget(
                    hintText: ("nama depan"),
                    controller: TextEditingController(),
                    prefix: Icon(
                      Icons.person,
                      color: Colors.grey,
                    )),
                SizedBox(height: 20),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text("Nama Belakang"),
                ),
                SizedBox(height: 10),
                FormWidget(
                    hintText: ("nama belakang"),
                    controller: TextEditingController(),
                    prefix: Icon(
                      Icons.person,
                      color: Colors.grey,
                    )),
                SizedBox(height: 20),
                ButtonWidget(name: "Edit Profil", height: 50),
                SizedBox(height: 20),
                ButtonWidget(
                  name: "Logout",
                  height: 50,
                  borderColor: secondaryColor,
                  color: const Color.fromARGB(0, 255, 255, 255),
                  textColor: secondaryColor,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
