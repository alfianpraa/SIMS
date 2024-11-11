import 'package:flutter/material.dart';
import 'package:myapp/theme.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.name,
    this.color = secondaryColor,
    this.press,
    this.width,
    this.height,
    this.borderColor = const Color.fromARGB(0, 255, 255, 255),
    this.textColor = primaryColor,
  });

  final String name;
  final double? width;
  final double? height;
  final VoidCallback? press;
  final Color color;
  final Color borderColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          color: color,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(3),
          child: Center(
            child: Text(
              name,
              style: TextStyle(
                color: textColor,
                fontSize: 13,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
