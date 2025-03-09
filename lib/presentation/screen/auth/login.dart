import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/auth_cubit/auth_cubit.dart';
import '../home/home_screen.dart';
import 'widgets/login_body.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthStateError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          body:
              (state is AuthStateLoading)
                  ? const Center(child: CircularProgressIndicator())
                  : (state is AuthStateAuthenticated)
                  ? const HomeScreen()
                  : (state is AuthStateUnauthenticated ||
                      state is AuthInitial ||
                      state is AuthStateError)
                  ? const LoginBody()
                  : const Center(child: Text("Something went wrong!")),
        );
      },
    );
  }
}
