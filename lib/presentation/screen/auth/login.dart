import 'package:fire_auth/core/constant/colors.dart';
import 'package:fire_auth/core/constant/strings.dart';
import 'package:fire_auth/core/constant/styles.dart';
import 'package:fire_auth/core/widgets/my_button.dart';
import 'package:fire_auth/core/widgets/my_text_field.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Image.asset(AppConst.loginImage, height: 300, width: 300),
            const Text("Login", style: AppStyles.heading),
            const SizedBox(height: 15),
            MyTextField(text: "Email"),
            const SizedBox(height: 15),
            MyTextField(text: "Password"),
            const SizedBox(height: 15),
            InkWell(
              onTap: () {},
              child: Text("Forgot Password?", style: AppStyles.secondary),
            ),
            const SizedBox(height: 30),
            MyButton(
              widget: Text("Login", style: AppStyles.button),
              onPressed: () {},
            ),
            const SizedBox(height: 20),
            MyButton(
              widget: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Login with Google  "),
                  Image.asset(AppConst.google, height: 30, width: 30),
                ],
              ),
              color: AppColors.myWhite,
              onPressed: () {},
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account? "),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, AppConst.signUpRoute);
                  },
                  child: Text("Sign Up", style: AppStyles.secondary),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
