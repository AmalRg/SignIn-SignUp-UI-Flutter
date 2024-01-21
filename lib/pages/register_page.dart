import 'package:flutter/material.dart';
import '../components/my_button.dart';
import '../components/my_textfield.dart';
import '../components/square_tile.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controllers
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final ageController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // sign user up method
  void signUpUser() async {
    // show loading circle
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
    );

    // Vérifier si le mot de passe est confirmé
    if (passwordController.text == confirmPasswordController.text) {
      String url = 'http://localhost:8080/api/users/signup';
      Map<String, String> headers = {"Content-Type": "application/json"};
      String json = '{"email": "${emailController.text}", "password": "${passwordController.text}"}';

      try {
        var response = await http.post(url as Uri, headers: headers, body: json);

        if (response.statusCode == 200) {
          // Utilisateur créé avec succès, faire quelque chose (naviguer vers une autre page, etc.)
          print('Utilisateur créé avec succès');
        } else {
          // Erreur lors de la création de l'utilisateur, afficher un message d'erreur
          print('Erreur lors de la création de l\'utilisateur');
        }
      } catch (e) {
        // Erreur lors de la requête HTTP, afficher un message d'erreur
        print('Erreur lors de la requête HTTP : $e');
      }
    } else {
      // Afficher un message d'erreur, les mots de passe ne correspondent pas
      print("Les mots de passe ne correspondent pas !");
    }

    // pop the loading circle
    Navigator.pop(context);
  }


  // error message popup
  void showErrorMessage (String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 25),

                    /*
                // logo
                const Icon(
                  Icons.android,
                  size: 100,
                ),
                */

                    const SizedBox(height: 10),

                    // Hello There !
                    Text(
                      'Hello There !',
                      style: TextStyle(
                        fontSize: 35,
                      ),
                    ),

                    const SizedBox(height: 10),

                    // Register below with your details !
                    Text(
                      'Register below with your details !',
                      style: TextStyle(color: Colors.grey[700],
                        fontSize: 20,
                      ),
                    ),

                    const SizedBox(height: 25),

                    // First Name textfield
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: MyTextField(
                        controller: firstNameController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(12),
                          ),

                          fillColor: Colors.grey[200],
                          filled: true,
                        ),
                        hintText: 'First Name',
                        obscureText: false,
                      ),
                    ),

                    const SizedBox(height: 10),


                    // Last Name textfield
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: MyTextField(
                        controller: lastNameController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(12),
                          ),

                          fillColor: Colors.grey[200],
                          filled: true,
                        ),
                        hintText: 'Last Name',
                        obscureText: false,
                      ),
                    ),

                    const SizedBox(height: 10),


                    // age textfield
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: MyTextField(
                        controller: ageController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(12),
                          ),

                          fillColor: Colors.grey[200],
                          filled: true,
                        ),
                        hintText: 'Age',
                        obscureText: false,
                      ),
                    ),

                    const SizedBox(height: 10),

                    // email textfield
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: MyTextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(12),
                          ),

                          fillColor: Colors.grey[200],
                          filled: true,
                        ),
                        hintText: 'Email',
                        obscureText: false,
                      ),
                    ),

                    const SizedBox(height: 10),

                    // password textfield
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: MyTextField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(12),
                          ),

                          fillColor: Colors.grey[200],
                          filled: true,
                        ),
                        hintText: 'Password',
                        obscureText: true,
                      ),
                    ),

                    const SizedBox(height: 10),

                    // confirm password textfield
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: MyTextField(
                        controller: confirmPasswordController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(12),
                          ),

                          fillColor: Colors.grey[200],
                          filled: true,
                        ),
                        hintText: 'Confirm Password',
                        obscureText: true,
                      ),
                    ),

                    const SizedBox(height: 15),

                    // sign in button
                    MyButton(
                      text: "Sign Up",
                      onTap: signUpUser,
                    ),

                    const SizedBox(height: 20),

                    /*
                    // or continue with
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.grey[400],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              'Or continue with',
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.grey[400],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),


                    // google + apple sign in button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // google button
                        SquareTile(imagePath: 'lib/images/google.png'),

                        const SizedBox(width: 25),

                        // apple button
                        SquareTile(imagePath: 'lib/images/apple.png')
                      ],
                    ),

                    const SizedBox(height: 20),


                     */

                    // bot a member ? register now
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account ?',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                        const SizedBox(width: 15),
                        GestureDetector(
                          onTap: widget.onTap,
                          child: Text(
                            'Login now',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            )
        )
    );
  }
}