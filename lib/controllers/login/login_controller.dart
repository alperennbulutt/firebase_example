import 'package:alperenfirebase/pages/home/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final email = ''.obs;
  final password = ''.obs;

  final isLogin = false.obs;

  Future signIn() async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email.value, password: password.value);

      isLogin.value = true;

      Get.to(HomePage());
    } catch (e) {
      print(e);
      Get.snackbar('Error', e.toString());
    }
  }
}
