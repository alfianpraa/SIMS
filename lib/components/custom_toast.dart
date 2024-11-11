import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myapp/theme.dart';

void customToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    backgroundColor: const Color.fromARGB(255, 255, 243, 243), // Ganti dengan warna yang diinginkan
    textColor: secondaryColor, // Ganti dengan warna teks yang diinginkan
  );
}
