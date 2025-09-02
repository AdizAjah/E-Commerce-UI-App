import 'package:e_commerce_one/pages/changePassword_page.dart';
import 'package:flutter/material.dart';
import 'pages/account_page.dart';
import 'pages/register_page.dart';
import 'pages/login_page.dart';
import 'pages/cart_page.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        'LoginPage': (context) => const LoginPage(),
        'RegisterPage': (context) => const RegisterPage(),
        'AccountPage': (context) => const AccountPage(),
        '/changePassword': (context) => const ChangepasswordPage(),
        'CartPage': (context) => const CartPage(),
        '/': (context) => const HomePage(),
      },
    );
  }
}
