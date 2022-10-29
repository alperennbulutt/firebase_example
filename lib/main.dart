import 'package:alperenfirebase/controllers/login/login_controller.dart';
import 'package:alperenfirebase/firebase_config.dart';
import 'package:alperenfirebase/pages/home/home_page.dart';
import 'package:alperenfirebase/pages/register/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_notifications_handler/firebase_notifications_handler.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

_firebaseMessagingBackroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.platformOptions);
  print('background message:' + message.messageId.toString());
}

// bu site aracılığı ile de notification testleri yapabiliriz
// https://testfcm.com
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      name: "qnbfinansbankfirebase",
      options: DefaultFirebaseOptions.platformOptions);

  final fcmToken = await FirebaseMessaging.instance.getToken();
  print('Denemeeeee : $fcmToken');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FirebaseNotificationsHandler(
        child: GetMaterialApp(
            debugShowCheckedModeBanner: false, home: PageControl()));
  }
}

class PageControl extends StatelessWidget {
  PageControl({super.key});

  final loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomePage();
        } else {
          return RegisterPage();
        }
      },
    );
  }
}
