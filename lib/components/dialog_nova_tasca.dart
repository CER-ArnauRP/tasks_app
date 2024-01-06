import 'package:flutter/material.dart';
import 'package:tasks_app/components/boto_personalitzat.dart';

class DialogNovaTasca extends StatelessWidget {
  final controladorTextField;

  VoidCallback enGuardar;
  VoidCallback enCancelar;

  DialogNovaTasca({
    super.key,
    required this.controladorTextField,
    required this.enGuardar,
    required this.enCancelar,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.teal[200],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controladorTextField,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Nova tasca...",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BotoPersonalitzat(textBoto: "Guardar", enSerPremut: enGuardar),
                const SizedBox(
                  width: 8,
                ),
                BotoPersonalitzat(textBoto: "Sortir", enSerPremut: enCancelar),
              ],
            )
          ],
        ),
      ),
    );
  }
}
