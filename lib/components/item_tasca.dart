import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ItemTasca extends StatelessWidget {
  final String titolTasca;
  final bool tascaCompletada;
  Function(bool?)? canviarValor;
  Function(BuildContext) esborrarItem;

  // Constructor---------------
  // per defecte té un const davant. S'ha de treure per afegir-hi params.
  ItemTasca(
      {super.key,
      required this.titolTasca,
      required this.tascaCompletada,
      required this.canviarValor,
      required this.esborrarItem});
  // --------------------------

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: esborrarItem,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(15),
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.teal[300],
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Checkbox(
                activeColor: Colors.black,
                value: tascaCompletada,
                onChanged: canviarValor,
              ),
              Text(
                titolTasca,
                style: TextStyle(
                    decoration: tascaCompletada
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
