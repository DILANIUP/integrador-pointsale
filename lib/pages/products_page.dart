import 'package:flutter/material.dart';

List<Map<String, dynamic>> products = [
  {
    "name": "Lapices de colores",
    "description": "12 Unidades de lapices de colores",
    "price": 3.00,
    "image": "images/lapiz.jpeg", 
  },
  {
    "name": "Termos",
    "description": "Termo para llevar liquidos disponemos en diferentes colores",
    "price": 5.00,
    "image": "images/termos.jpeg",
  },
  {
    "name": "Sombrilla",
    "description": "sombrilla para la lluvia",
    "price": 10.00,
    "image": "images/sombrilla.jpeg",
  },
  {
    "name": "Mochila",
    "description": "Mochilas en diferentes colores",
    "price": 20.00,
    "image": "images/mochila.jpeg", 
  },
];

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Productos'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/fondo_integrador.jpeg'), 
            fit: BoxFit.cover,
          ),
        ),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 0.75, 
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return Card(
              elevation: 2,
              margin: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(product['image']),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product['name'],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Precio: \$${product['price']}',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          product['description'],
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Material App',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: ProductListScreen(),
  ));
}
