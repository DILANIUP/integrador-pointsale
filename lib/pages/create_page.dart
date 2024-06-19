import 'package:flutter/material.dart';
import 'package:integrador/firebase_service.dart';
import 'package:integrador/pages/home.dart';

class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  void _addUser() async {
    String name = _nameController.text;
    String password = _passwordController.text;
    String email = _emailController.text;
    String phone = _phoneController.text;

    await addPeople(name, password, email, phone);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('User added successfully!')),
    );
    _nameController.clear();
    _passwordController.clear();
    _emailController.clear();
    _phoneController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add User'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/fondo_integrador.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Card(
            color: Colors.white.withOpacity(0.8), // Opacidad del color blanco
            margin: EdgeInsets.all(20),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(labelText: 'Name'),
                  ),
                  TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                  ),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                  TextField(
                    controller: _phoneController,
                    decoration: InputDecoration(labelText: 'Phone'),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      _addUser();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                HomePage()), 
                      );
                    },
                    child: Text('Add User'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Recuerda definir este método fuera de cualquier clase.
Future<void> addPeople(
    String name, String password, String email, String phone) async {
  await db.collection("people").add({
    "name": name,
    "password": password,
    "email": email,
    "phone": phone,
  });
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User App',
      initialRoute: "/addUser",
      routes: {
        "/addUser": (context) => CreatePage(),
      },
    );
  }
}
