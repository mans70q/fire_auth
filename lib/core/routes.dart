import 'package:flutter/material.dart';

import '../presentation/screen/auth/login.dart';
import '../presentation/screen/auth/signup.dart';
import '../presentation/screen/home/home_screen.dart';
import 'constant/strings.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppConst.loginRoute: (context) => const Login(),
  AppConst.signUpRoute: (context) => const Signup(),
  AppConst.homeRoute: (context) => const HomeScreen(),
};
