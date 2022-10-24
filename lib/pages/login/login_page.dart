import 'package:alperenfirebase/controllers/login/login_controller.dart';
import 'package:alperenfirebase/pages/home/home_page.dart';
import 'package:alperenfirebase/pages/register/register_page.dart';
import 'package:alperenfirebase/widgets/custom_elevated_button.dart';
import 'package:alperenfirebase/widgets/custom_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 161, 208, 246),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.2,
            ),

            // avatar
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: Get.width * 0.3,
                    height: Get.height * 0.15,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(60)),
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 80,
                    )),
              ],
            ),
            SizedBox(
              height: Get.height * 0.1,
            ),
            // email
            CustomTextField(
                hintText: 'Email',
                emailTextEditingController: emailTextEditingController),

            SizedBox(
              height: Get.height * 0.025,
            ),

            // password
            CustomTextField(
                hintText: 'Password',
                emailTextEditingController: passwordTextEditingController),

            SizedBox(
              height: Get.height * 0.025,
            ),

            ElevatedButtonWidget(
                textStyle: TextStyle(color: Colors.blue),
                text: 'Giriş Yap',
                onPressed: () {
                  controller.email.value = emailTextEditingController.text;
                  controller.password.value =
                      passwordTextEditingController.text;

                  if (emailTextEditingController.text.length > 0 &&
                      passwordTextEditingController.text.length > 0) {
                    controller.signIn();
                  } else {
                    Get.defaultDialog(
                        onConfirm: () => print("Tamam"),
                        middleText: "Kullanıcı adı veya şifre yanlış");
                    emailTextEditingController.clear();
                    passwordTextEditingController.clear();
                  }
                }

                //  Get.to(RegisterPage()),
                ),
          ],
        ),
      ),
    );
  }
}
