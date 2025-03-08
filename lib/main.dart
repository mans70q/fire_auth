import 'package:fire_auth/core/routes.dart';
import 'package:fire_auth/cubits/auth_cubit/auth_cubit.dart';
import 'package:fire_auth/firebase_options.dart';
import 'package:fire_auth/presentation/screen/auth/login.dart';
import 'package:fire_auth/presentation/screen/home/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: BlocProvider(
          create: (context) => AuthCubit()..currentUser(),
          child: BlocConsumer<AuthCubit, AuthState>(
            builder: (context, state) {
              if (state is AuthInitial) {
                return Center(child: CircularProgressIndicator());
              } else if (state is AuthStateLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is AuthStateAuthenticated) {
                return const HomeScreen();
              } else if (state is AuthStateUnauthenticated) {
                return const Login();
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
            listener: (context, state) {
              if (state is AuthStateError) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
              }
            },
          ),
        ),
      ),
      routes: routes,
    );
  }
}
