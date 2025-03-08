import 'package:fire_auth/core/constant/strings.dart';
import 'package:fire_auth/presentation/screen/auth/login.dart';
import 'package:fire_auth/presentation/screen/auth/signup.dart';
import 'package:flutter/material.dart';

import '../presentation/screen/home/home_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppConst.loginRoute: (context) => const Login(),
  AppConst.signUpRoute: (context) => const Signup(),
  AppConst.homeRoute: (context) => const HomeScreen(),
};
