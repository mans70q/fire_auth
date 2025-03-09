import 'core/routes.dart';
import 'cubits/auth_cubit/auth_cubit.dart';
import 'cubits/profile_cubit/profile_cubit.dart';
import 'firebase_options.dart';
import 'presentation/screen/auth/login.dart';
import 'presentation/screen/home/home_screen.dart';
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

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()..currentUser()),
        BlocProvider(create: (context) => ProfileCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocConsumer<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state is AuthStateLoading || state is AuthInitial) {
              return const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            } else if (state is AuthStateAuthenticated) {
              return const HomeScreen();
            } else if (state is AuthStateUnauthenticated) {
              return const Login();
            } else {
              return const Scaffold(
                body: Center(child: Text("Something went wrong!")),
              );
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
        routes: routes,
      ),
    );
  }
}
