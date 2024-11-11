import 'package:flutter/material.dart';
import 'package:myapp/theme.dart';

class FormWidget extends StatelessWidget {
  const FormWidget({
    super.key,
    required this.hintText,
    required this.controller,
    this.validator,
    this.keyboardType,
    this.prefix,
    this.suffix,
    this.onChanged,
    this.isObscure,
  });

  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final Widget? suffix;
  final Widget? prefix;
  final Function(String)? onChanged;
  final bool? isObscure;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        cursorColor: secondaryColor,
        onChanged: onChanged,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          prefixIcon: prefix,
          suffixIcon: suffix,
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
          hintText: hintText,
          contentPadding: const EdgeInsets.all(5),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromRGBO(121, 120, 120, 1)),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(color: Color.fromRGBO(121, 120, 120, 1)),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(color: secondaryColor),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(color: Color.fromRGBO(121, 120, 120, 1)),
          ),
        ),
        obscureText: isObscure ?? false,
        controller: controller,
        validator: validator);
  }
}
