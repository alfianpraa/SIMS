import 'package:flutter/material.dart';
import 'package:myapp/components/button_widget.dart';
import 'package:myapp/components/form_widget.dart';
import 'package:myapp/components/topup_screen/topup_card.dart';
import 'package:myapp/theme.dart';

class TopupMenu extends StatefulWidget {
  @override
  _TopupMenuState createState() => _TopupMenuState();
}

class _TopupMenuState extends State<TopupMenu> {
  final _controller = TextEditingController();
  bool _isButtonEnabled = false;

  void _updateButtonState() {
    final amount = int.tryParse(_controller.text) ?? 0;
    setState(() {
      _isButtonEnabled = amount >= 10000 && amount <= 1000000;
    });
  }

  void _addToTopUp(int amount) {
    setState(() {
      _controller.text = amount.toString();
      _updateButtonState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormWidget(
            hintText: "masukkan nominal top up",
            controller: _controller,
            prefix: Icon(Icons.attach_money, color: Colors.grey),
            onChanged: (value) => _updateButtonState(),
            keyboardType: TextInputType.number),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TopupCard(name: "Rp 10.000", press: () => _addToTopUp(10000)),
            TopupCard(name: "Rp 20.000", press: () => _addToTopUp(20000)),
            TopupCard(name: "Rp 50.000", press: () => _addToTopUp(50000)),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TopupCard(name: "Rp 100.000", press: () => _addToTopUp(100000)),
            TopupCard(name: "Rp 250.000", press: () => _addToTopUp(250000)),
            TopupCard(name: "Rp 500.000", press: () => _addToTopUp(500000)),
          ],
        ),
        SizedBox(height: 20),
        ButtonWidget(
          name: "Top Up",
          height: 40,
          press: _isButtonEnabled ? () {} : null,
          color: _isButtonEnabled ? secondaryColor : Colors.grey,
        )
      ],
    );
  }
}
