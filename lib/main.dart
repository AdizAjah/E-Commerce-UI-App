import 'package:e_commerce_one/pages/account_page.dart';
import 'package:e_commerce_one/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'LoginPage',
      routes: {
        'LoginPage': (context) => const LoginPage(),
        'RegisterPage': (context) => const RegisterPage(),
        'AccountPage': (context) => const AccountPage(),
      },
    );
  }
}
