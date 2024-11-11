import 'package:flutter/material.dart';

class ServiceBox extends StatelessWidget {
  const ServiceBox({
    super.key,
    required this.name,
    required this.image,
  });

  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(image),
        Text(name),
      ],
    );
  }
}

class ServiceCard extends StatelessWidget {
  const ServiceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              ServiceBox(name: "PBB", image: "assets/image/service/PBB.png"),
              ServiceBox(name: "Listrik", image: "assets/image/service/Listrik.png"),
              ServiceBox(name: "Pulsa", image: "assets/image/service/Pulsa.png"),
              ServiceBox(name: "PDAM", image: "assets/image/service/PDAM.png"),
              ServiceBox(name: "PGN", image: "assets/image/service/PGN.png"),
              ServiceBox(name: "Televisi", image: "assets/image/service/Televisi.png"),
            ]),
            SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              ServiceBox(name: "Musik", image: "assets/image/service/Musik.png"),
              ServiceBox(name: "Game", image: "assets/image/service/Game.png"),
              ServiceBox(name: "Makanan", image: "assets/image/service/Makanan.png"),
              ServiceBox(name: "Kurban", image: "assets/image/service/Kurban.png"),
              ServiceBox(name: "Zakat", image: "assets/image/service/Zakat.png"),
              ServiceBox(name: "Data", image: "assets/image/service/Data.png"),
            ]),
          ],
        ));
  }
}
