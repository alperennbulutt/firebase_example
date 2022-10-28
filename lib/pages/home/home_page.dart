import 'package:alperenfirebase/controllers/home/home_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Spacer(),
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
