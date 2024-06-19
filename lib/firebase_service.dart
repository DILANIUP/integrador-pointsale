import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getProducts() async {
  List products = [];
  QuerySnapshot querySnapshot = await db.collection('products').get();
  for (var doc in querySnapshot.docs) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final people = {
      'name': data['name'],
      'uid': doc.id,
    };

    products.add(people);
  }
  return products; 
}


//Guardar data
Future<void> addAnimals(String name) async{
  await db.collection("animals").add({"name": name }); 
}

//Actualizar data
Future<void> updateAnimals(String uid, String newName) async{
  await db.collection("animals").doc(uid).set({"name": newName});
}

//Borrar data
Future<void> deleteAnimals(String uid) async{
  await db.collection("animals").doc(uid).delete();
}