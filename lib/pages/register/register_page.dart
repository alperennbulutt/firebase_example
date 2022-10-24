import 'package:alperenfirebase/controllers/register/register_controller.dart';
import 'package:alperenfirebase/pages/login/login_page.dart';
import 'package:alperenfirebase/widgets/custom_elevated_button.dart';
import 'package:alperenfirebase/widgets/custom_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home/home_page.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  TextEditingController mailTextEditingController = TextEditingController();

  TextEditingController passwordTextEditingController = TextEditingController();

  TextEditingController confirmPasswordTextEditingController =
      TextEditingController();

  final controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () => Get.offAll(LoginPage()),
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      backgroundColor: Color.fromARGB(255, 139, 195, 241),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.2,
            ),

            SizedBox(
              height: Get.height * 0.1,
            ),
            // email
            CustomTextField(
                hintText: 'Email',
                emailTextEditingController: mailTextEditingController),

            // password
            CustomTextField(
                hintText: 'Password',
                emailTextEditingController: passwordTextEditingController),

            // confirm password
            CustomTextField(
                hintText: 'Confirm Password',
                emailTextEditingController:
                    confirmPasswordTextEditingController),

            SizedBox(
              height: Get.height * 0.025,
            ),

            ElevatedButtonWidget(
                buttonColor: Colors.amber,
                textStyle: const TextStyle(color: Colors.blue),
                text: 'Kayıt Ol',
                onPressed: () {
                  controller.email.value = mailTextEditingController.text;
                  controller.password.value =
                      passwordTextEditingController.text;
                  controller.confirmPassword.value =
                      confirmPasswordTextEditingController.text;

                  if (controller.password.value ==
                      controller.confirmPassword.value) {
                    controller.signUp();
                  } else {
                    print('bir hata oluştu');
                  }
                }

                // Get.to(const HomePage()),
                ),
          ],
        ),
      ),
    );
  }
}
