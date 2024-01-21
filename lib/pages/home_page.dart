import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class HomePage extends StatelessWidget {
  HomePage({super.key});

  void signUserOut() async {
    String url = 'http://localhost:8080/api/users/logout';

    try {
      var response = await http.post(url as Uri);

      if (response.statusCode == 200) {
        // Déconnexion réussie, faire quelque chose (naviguer vers une autre page, etc.)
        print('Déconnexion réussie');
      } else {
        // Erreur lors de la déconnexion, afficher un message d'erreur
        print('Erreur lors de la déconnexion');
      }
    } catch (e) {
      // Erreur lors de la requête HTTP, afficher un message d'erreur
      print('Erreur lors de la requête HTTP : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(onPressed: signUserOut, icon: Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Text(
          'LOGGED IN AS: ' ,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}