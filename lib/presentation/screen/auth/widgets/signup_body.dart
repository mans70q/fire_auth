import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constant/strings.dart';
import '../../../../core/constant/styles.dart';
import '../../../../core/widgets/my_button.dart';
import '../../../../core/widgets/my_text_field.dart';
import '../../../../cubits/auth_cubit/auth_cubit.dart';

class SignupBody extends StatefulWidget {
  const SignupBody({super.key});

  @override
  State<SignupBody> createState() => _SignupBodyState();
}

class _SignupBodyState extends State<SignupBody> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _nameController;

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

  Future<void> _register() async {
    final authCubit = context.read<AuthCubit>();

    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final name = _nameController.text.trim();
    if (email.isEmpty || password.isEmpty || name.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Please enter valid input")));
    } else {
      await authCubit.register(email: email, password: password, name: name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
              widget: Text("Register", style: AppStyles.button),
              onPressed: _register,
            ),
            const SizedBox(height: 20),

            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account? "),
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
    );
  }
}
