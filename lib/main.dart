import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tasks_app/pagines/pagina_principal.dart';

void main() async {
  // Inicialització HiveDB ---------------------------------
  // Per incloure la HiveDB, hem de posar el "async".
  // Inicialitzar la HiveDB (amb el await).
  await Hive.initFlutter();

  // Obrim una Box de Hive
  var box = await Hive.openBox('box_de_tasks_app');
  // --------------------------------------------------------

  runApp(const TasksApp());
}

class TasksApp extends StatelessWidget {
  const TasksApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const PaginaPrincipal(),
      theme: ThemeData(primarySwatch: Colors.teal),
    );
  }
}
