import 'package:flutter/material.dart';

class BannerCard extends StatelessWidget {
  const BannerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Temukan promo menarik",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Image.asset("assets/image/banner/Banner 1.png"),
              SizedBox(width: 10),
              Image.asset("assets/image/banner/Banner 2.png"),
              SizedBox(width: 10),
              Image.asset("assets/image/banner/Banner 3.png"),
              SizedBox(width: 10),
              Image.asset("assets/image/banner/Banner 4.png"),
              SizedBox(width: 10),
              Image.asset("assets/image/banner/Banner 5.png"),
            ],
          ),
        )
      ],
    );
  }
}
