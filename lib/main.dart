import 'package:alperenfirebase/controllers/login/login_controller.dart';
import 'package:alperenfirebase/firebase_config.dart';
import 'package:alperenfirebase/pages/home/home_page.dart';
import 'package:alperenfirebase/pages/register/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      name: "qnbfinansbankfirebase",
      options: DefaultFirebaseOptions.platformOptions);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false, home: PageControl());
  }
}

class PageControl extends StatelessWidget {
  PageControl({super.key});

  final loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomePage();
          } else {
            return RegisterPage();
          }
        },
      ),
    );
  }
}
