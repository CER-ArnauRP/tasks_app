import 'package:flutter/material.dart';

class BotoPersonalitzat extends StatelessWidget {
  final String textBoto;
  VoidCallback enSerPremut;

  BotoPersonalitzat({
    super.key,
    required this.textBoto,
    required this.enSerPremut,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: enSerPremut,
      color: Colors.teal[300],
      child: Text(textBoto),
    );
  }
}
