import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../pages/home_page.dart';
import '../pages/login_or_register_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key});

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _isLoading = true;
  bool _isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    // Votre code pour vérifier l'état de connexion côté serveur avec Spring

    String url = 'http://localhost:8080/api/users/checkLoginStatus';

    try {
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        setState(() {
          _isLoggedIn = true;
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoggedIn = false;
          _isLoading = false;
        });
      }
    } catch (e) {
      print('Erreur lors de la vérification de l\'état de connexion : $e');
      setState(() {
        _isLoggedIn = false;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      if (_isLoggedIn) {
        return HomePage();
      } else {
        return LoginOrRegisterPage();
      }
    }
  }
}
