import 'package:application1/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';

class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({super.key});

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
  // initially show login page
  bool shoLoginPage = true;

  // toggle between login and register page
  void togglePages() {
    setState(() {
      shoLoginPage = !shoLoginPage;
    });
  }


  @override
  Widget build(BuildContext context) {
    if (shoLoginPage) {
      return LoginPage(
        onTap: togglePages,
      );
    }
    else {
      return RegisterPage(
        onTap: togglePages,
      );
    }
  }
}