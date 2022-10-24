import 'package:alperenfirebase/pages/home/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final email = ''.obs;
  final password = ''.obs;
  final confirmPassword = ''.obs;

  signUp() async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email.value, password: password.value);

      // Get.to(const HomePage());

      Get.offAll(HomePage());
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', e.toString());
      print(e);
    }
  }
}
