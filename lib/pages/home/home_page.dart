import 'package:alperenfirebase/controllers/home/home_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Home Page'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('collection').snapshots(),
            builder: (context, snapshot) {
              return !snapshot.hasData
                  ? const CircularProgressIndicator()
                  : Column(
                      children: [
                        Container(
                          height: 250,
                          child: ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              DocumentSnapshot values =
                                  snapshot.data!.docs[index];

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
          const Spacer(),
          ElevatedButton(
              onPressed: () {
                controller.signOut();
              },
              child: Text('Çıkış yap butonu')),
          Center(child: Text('HomePage')),
        ],
      ),
    );
  }
}
