import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:tasks_app/components/dialog_nova_tasca.dart';
import 'package:tasks_app/components/item_tasca.dart';
import 'package:tasks_app/data/database.dart';

class PaginaPrincipal extends StatefulWidget {
  const PaginaPrincipal({super.key});

  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  // Referenciar la Hive Box
  final _boxDeHive = Hive.box('box_de_tasks_app');

  // Llista d'ítems de la llista.
  /*List tasquesPerFer = [
    ["Fer tutorial", false],
    ["Fer exercici", false],
  ];*/ // ----> Al afegir la HiveDB, traiem això.
  BaseDeDadesTasksApp db = BaseDeDadesTasksApp();

  // En el mètode initState del Widget pagina_principal, preparem la DB
  @override
  void initState() {
    // Si és la primera vegada (de totes) que s'obre l'aplicació
    //  creem les dades d'exemple.
    if (_boxDeHive.get('box_de_tasks_app') == null) {
      db.crearDadesInicials();
    } else {
      // Si ja hi ha dades
      db.carregarDades();
    }

    super.initState();
  }
  // ------------------------------------------------------------------

  final _controladorTextFieldDialog = TextEditingController();

  void canviarValorCheckbox(bool? valor, int index) {
    // Segon el que es faci en aquest mètode, volem que
    //    canvii el que es mostra a la pantalla, per tant,
    //    fem servir el setState().
    setState(() {
      db.tasquesPerFer[index][1] = !db.tasquesPerFer[index][1];
    });
    db.actualitzarDades();
  }

  void guardarNovaTasca() {
    setState(() {
      // Afegim el text de la nova tasca i la posem si està completada a false.
      db.tasquesPerFer.add([_controladorTextFieldDialog.text, false]);
      _controladorTextFieldDialog.clear();
    });
    Navigator.of(context).pop();
    db.actualitzarDades();
  }

  void crearNovaTasca() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogNovaTasca(
          controladorTextField: _controladorTextFieldDialog,
          enGuardar: guardarNovaTasca,
          enCancelar: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void esborrarTasca(int index) {
    setState(() {
      db.tasquesPerFer.removeAt(index);
    });
    db.actualitzarDades();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[100],
      appBar: AppBar(
        backgroundColor: Colors.teal[400],
        title: Text("Tasks App"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: crearNovaTasca,
        backgroundColor: Colors.teal[300],
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.tasquesPerFer.length,
        itemBuilder: (context, index) {
          return ItemTasca(
            titolTasca: db.tasquesPerFer[index][0],
            tascaCompletada: db.tasquesPerFer[index][1],
            canviarValor: (valorCheckbox) =>
                canviarValorCheckbox(valorCheckbox, index),
            esborrarItem: (context) => esborrarTasca(index),
          );
        },
      ),
      /*body: ListView(
        children: [
          ItemTasca(
              titolTasca: "Fer tutorial",
              tascaCompletada: true,
              canviarValor: (param) {}),
          ItemTasca(
              titolTasca: "Fer tutorial",
              tascaCompletada: false,
              canviarValor: (param) {}),
          ItemTasca(
              titolTasca: "Fer tutorial",
              tascaCompletada: false,
              canviarValor: (param) {})
        ],
      ),*/
    );
  }
}
