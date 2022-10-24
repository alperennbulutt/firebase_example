import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
