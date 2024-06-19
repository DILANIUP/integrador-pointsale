import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:integrador/pages/create_page.dart';
import 'package:integrador/pages/home.dart';
import 'package:integrador/pages/list_page.dart';
import 'package:integrador/pages/products_page.dart';
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
        '/': (context) => HomePage(),
        '/listPage': (context) => ListPage(),
        '/createPage': (context) => CreatePage(),
        '/productPage': (context) => ProductListScreen(),
      },
    );
  }
}


