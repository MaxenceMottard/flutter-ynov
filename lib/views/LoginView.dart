import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app/shared/SizeConfig.dart';
import 'package:toast/toast.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((User user) {
      if (user == null) {
        _passwordController.text = "";
        Toast.show("Erreur, vérifiez votre adresse mail ou votre mot de passe.", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
      } else {
        Toast.show("Vous êtes désormais connecté", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
        Navigator.pop(context);
      }
    });

    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: Container(
            width: SizeConfig.screenWidth * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _mailController,
                  decoration: InputDecoration(
                    labelText: "Adresse mail",
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Veuillez renseigner votre adresse mail.';
                    }

                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Mot de passe",
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Veuillez renseigner votre mot de passe.';
                      }

                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                  child: RaisedButton(
                    color: Colors.blue,
                    child: Text("Connexion",
                        style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: _mailController.text,
                          password: _passwordController.text,
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
