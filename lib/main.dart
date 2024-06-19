import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:integrador/pages/home_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: '/', // Establece la ruta raíz como '/'
      routes: {
        '/home': (context) => Home(), // Asocia la ruta raíz con Home()
      },
    );
  }
}

class Casa extends StatelessWidget {
  const Casa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          },
          child: Text('Ir a Segunda Pantalla'),
        ),
      ),
      
    );
  }
}

