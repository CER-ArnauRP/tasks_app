import 'package:hive/hive.dart';

class BaseDeDadesTasksApp {
  List tasquesPerFer = [];

  // Referenciem la Box (com en la pagina_principal.dart).
  final _boxDeHiveDatabase = Hive.box('box_de_tasks_app');

  // S'executa si és la primera vegada (de totes) que s'obre l'app.
  void crearDadesInicials() {
    tasquesPerFer = [
      ["Tasca d'exemple", false],
      ["Tasca d'exemple 2", false],
    ];
  }

  // Carreguem les dades de la DB
  void carregarDades() {
    tasquesPerFer = _boxDeHiveDatabase.get('box_de_tasks_app');
  }

  // Actualitzar la DB
  void actualitzarDades() {
    _boxDeHiveDatabase.put('box_de_tasks_app', tasquesPerFer);
  }
}
