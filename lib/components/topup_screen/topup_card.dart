import 'package:flutter/material.dart';

class TopupCard extends StatelessWidget {
  const TopupCard({
    super.key,
    required this.name,
    this.press,
  });

  final String name;

  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: 100,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(3),
          child: Center(
            child: Text(
              name,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 13,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
