import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List<Map<String, dynamic>>> getPeople() async {
  List<Map<String, dynamic>> people = [];
  QuerySnapshot querySnapshot = await db.collection('people').get();
  for (var doc in querySnapshot.docs) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final user = {
      'name': data['name'],
      'email': data['email'],
      'uid': doc.id,
    };

    people.add(user);
  }
  return people; 
}



//Guardar data
Future<void> addPeople(String name, String email, String password) async {
    await db.collection("people").add({
      "name": name,
      "email": email,
      "password": password,
    });
  }

//Actualizar data
Future<void> updatePeople(String uid, String newName, String newEmail, String newPassword, String newPhone) async {
  await db.collection('people').doc(uid).update({
    'name': newName,
    'email': newEmail,
    'password': newPassword,
    'phone': newPhone,
  });
}

//Borrar data
Future<void> deletePeople(String uid) async {
  await db.collection('people').doc(uid).delete();
}