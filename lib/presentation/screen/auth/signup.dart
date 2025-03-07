import 'package:fire_auth/core/constant/strings.dart';
import 'package:fire_auth/core/constant/styles.dart';
import 'package:fire_auth/core/widgets/my_button.dart';
import 'package:fire_auth/core/widgets/my_text_field.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _nameController;
  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _nameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Image.asset(AppConst.signUpImage, height: 300, width: 300),
              const Text("Register", style: AppStyles.heading),
              const SizedBox(height: 15),
              MyTextField(text: "username", controller: _nameController),
              const SizedBox(height: 15),
              MyTextField(text: "Email", controller: _emailController),
              const SizedBox(height: 15),
              MyTextField(text: "Password", controller: _passwordController),
              const SizedBox(height: 15),

              const SizedBox(height: 30),
              MyButton(
                widget: Text("Login", style: AppStyles.button),
                onPressed: () {},
              ),
              const SizedBox(height: 20),

              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?", style: AppStyles.secondary),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text("Login", style: AppStyles.secondary),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
