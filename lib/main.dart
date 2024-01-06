import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tasks_app/pagines/pagina_principal.dart';

/*
Hive fent debug en web: no es guarda l'estat de la DB.

Solució:
https://github.com/isar/hive/issues/587

Per fer-ho:

In Visual Studio Code (VS Code), you can specify the port for Flutter 
by modifying the launch.json file. Here’s how you can do it:

Go to your project root directory.
Create a .vscode directory if it doesn’t exist.
Inside the .vscode directory, create or modify the launch.json file.
Add the following configuration to the launch.json file:

{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Flutter",
      "request": "launch",
      "type": "dart",
      "args": ["-d", "chrome", "--web-port", "5555"]
    }
  ]
}

Save the launch.json file.
Now, when you run your Flutter app in VS Code, it will use port 55551. 
Remember to replace “5555” with your desired port number. 
If you want to run the app in a web server instead of Chrome, 
replace “chrome” with “web-server” in the args array1.

Please note that this configuration will be used when you start 
the debugging session with F5 or CTRL+F51. 
If you’re running the app from the terminal, you can specify the port directly 
in the command line as follows: flutter run -d chrome --web-port 5555.

El més fàcil: 

    - Fer el "run" des de la terminal del VS Code.
      - Obrir la Terminal des de VS Code.
      - Escriure: flutter run -d chrome --web-port 5555

*/

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
