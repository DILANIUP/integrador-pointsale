import 'package:flutter/material.dart';
import 'package:integrador/pages/navbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SimpleNavbar(),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        title: const Text("Descripcion"),
      ),
      body: Center(
        child: Container(
          width: 600,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/fondo_integrador.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            controller: _controller,
            child: Column(
              children: [
                _buildCard(
                  'images/persona.jpeg', 
                  'Objetivo',
                  'Crear un sistema de tienda virtual para facilitar y garantizar la gestión segura, confiable y conveniente de los usuarios. Utilizando tecnologías como NestJS, Angular, Flutter y Postgress, optimizando el manejo de su inventariado y mejorando la experiencia de operación de un punto de venta, proporcionando un entorno accesible, sencillo y funcional. ',
                  'Texto a la derecha',
                ),
                SizedBox(height: 20),
                _buildCard(
                  'images/objetivo.jpeg', 
                  'Beneficios',
                  '',
                  'Ofrece una serie de beneficios significativos para sus usuarios y el negocio en general. Entre estos beneficios se encuentran una interfaz intuitiva y accesible que facilita la navegación y operación tanto en web como en dispositivos móviles, garantizando una experiencia eficiente y conveniente.',
                  reversed: true,
                ),
                SizedBox(height: 20),
                _buildCard(
                  'images/diseño.jpeg', 
                  'Interacción del Usuario',
                  'La interacción del usuario estará centrada en proporcionar una experiencia cómoda, segura y efectiva al utilizar las funcionalidades ofrecidas',
                  'Texto a la derecha',
                ),
                SizedBox(height: 20),
                _buildCard(
                  'images/beneficio.jpeg', 
                  'Diseño',
                  'Texto a la derecha',
                  'El diseño de tema oscuro pero formal para el proyecto de "Punto de Venta" puede ofrecer una experiencia visual atractiva y profesional. Al utilizar colores oscuros como fondo, se crea un ambiente elegante y moderno que resalta la información de manera clara y legible.',
                  reversed: true,
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCard(
    String imagePath,
    String title,
    String textLeft,
    String textRight, {
    bool reversed = false,
  }) {
    return Card(
      elevation: 5, 
      child: Container(
        width: 600, 
        padding: const EdgeInsets.all(20.0),
        color: Colors.lightBlue[50], 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                if (reversed)
                  _buildText(textRight) 
                else
                  _buildImage(imagePath),
                if (reversed)
                  _buildImage(imagePath) 
                else
                  _buildText(textLeft), 
              ],
            ),
            SizedBox(height: 10),
            Text(
              '',
              style: TextStyle(
                fontSize: 16.0,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(String imagePath) {
    return Image.asset(
      imagePath,
      width: 100,
      height: 100, 
      fit: BoxFit.cover,
    );
  }

  Widget _buildText(String text) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Text(
          text,
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}

