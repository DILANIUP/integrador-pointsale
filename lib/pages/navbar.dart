import 'package:flutter/material.dart';

class SimpleNavbar extends StatelessWidget {
  const SimpleNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/fondo_integrador.jprg'), // Reemplaza con la ruta de tu imagen de fondo
                fit: BoxFit.cover,
              ),
            ),
            child: Text(
              'POINTSALE',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
          ),
          ListTile(
            leading: Icon(Icons.create),
            title: Text('Crear Usuario'),
            onTap: () {
              Navigator.pushNamed(context, '/createPage');
            },
          ),
          ListTile(
            leading: Icon(Icons.contact_page),
            title: Text('Listar Usuarios'),
            onTap: () {
              Navigator.pushNamed(context, '/listPage');
            },
          ),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Productos'),
            onTap: () {
              Navigator.pushNamed(context, '/productPage');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
