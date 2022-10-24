import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseFirestoreService {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  getValuesFromFirebase() {
    print(firebaseFirestore.collection('collection').snapshots());
  }

  saveValuesToFirebase() {
    var myData = {'isim': 'burak'};

    firebaseFirestore
        .collection('collection')
        .add(myData)
        .then((value) => print('Added'))
        .catchError((error) => print('Bir hata oluştu $error'));
  }

  updateValuesFromFirestore(String key, String value) {
    firebaseFirestore
        .collection('collection')
        .doc('document')
        .update({key: value});
  }

  removeFromFirestoreValue() {
    firebaseFirestore.collection('collection').doc('document').delete();
  }
}
