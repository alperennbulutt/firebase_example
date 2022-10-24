import 'package:alperenfirebase/firebase_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  FirebaseFirestoreService firebaseFirestoreService =
      FirebaseFirestoreService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('collection').snapshots(),
        builder: (context, snapshot) {
          return !snapshot.hasData
              ? CircularProgressIndicator()
              : Column(
                  children: [
                    // verileri kaydeden buton
                    TextButton(
                        onPressed: () =>
                            firebaseFirestoreService.saveValuesToFirebase(),
                        child: Text('verileri kaydet')),

                    // update buton

                    MaterialButton(
                      child: Text('update button'),
                      onPressed: () => firebaseFirestoreService
                          .updateValuesFromFirestore('isim', 'ahmet'),
                    ),

                    // remove button

                    MaterialButton(
                      child: Text('remove button'),
                      onPressed: () =>
                          firebaseFirestoreService.removeFromFirestoreValue(),
                    ),
                    Container(
                      height: 250,
                      child: ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot values = snapshot.data!.docs[index];

                          return Column(
                            children: [
                              Text(values['isim']),
                              // Text(values['soyisim']),
                            ],
                          );
                        },
                      ),
                    )
                  ],
                );
        },
      ),
    );
  }
}
