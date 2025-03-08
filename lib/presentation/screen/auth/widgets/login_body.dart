import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/constant/strings.dart';
import '../../../../core/constant/styles.dart';
import '../../../../core/widgets/my_button.dart';
import '../../../../core/widgets/my_text_field.dart';
import '../../../../cubits/auth_cubit/auth_cubit.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> login() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter email and password")),
      );
    } else {
      await context.read<AuthCubit>().login(email: email, password: password);
      if (!mounted) return;
      Navigator.pushNamed(context, AppConst.homeRoute);
    }
  }

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
            MyTextField(text: "Email", controller: _emailController),
            const SizedBox(height: 15),
            MyTextField(
              text: "Password",
              controller: _passwordController,
              obscureText: true,
            ),
            const SizedBox(height: 15),
            InkWell(
              onTap: () {},
              child: Text("Forgot Password?", style: AppStyles.secondary),
            ),
            const SizedBox(height: 30),
            MyButton(
              widget: Text("Login", style: AppStyles.button),
              onPressed: login,
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
