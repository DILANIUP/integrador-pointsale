import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:integrador/firebase_service.dart';
import 'package:integrador/pages/create_page.dart';
import 'package:integrador/pages/navbar.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List<Map<String, dynamic>>> getPeople() async {
  List<Map<String, dynamic>> people = [];
  QuerySnapshot querySnapshot = await db.collection('people').get();
  for (var doc in querySnapshot.docs) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final person = {
      'name': data['name'],
      'email': data['email'],
      'uid': doc.id,
    };

    people.add(person);
  }
  return people; 
}

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  void _deletePerson(String uid) async {
    await deletePeople(uid);
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SimpleNavbar(),
      appBar: AppBar(
        title: const Text('Mostrar Personas'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/fondo_integrador.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: FutureBuilder(
          future: getPeople(),
          builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                child: Text('No hay datos disponibles.'),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final person = snapshot.data![index];
                  return Card(
                    color: Colors.white70,
                    margin: EdgeInsets.all(8),
                    elevation: 4,
                    child: ListTile(
                      title: Text(
                        'Name: ${person['name']}',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'Email: ${person['email']}',
                        style: TextStyle(fontSize: 16),
                      ),
                      onTap: () {
                        // Acción al hacer tap en el elemento de la lista
                      },
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _deletePerson(person['uid']),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreatePage()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
