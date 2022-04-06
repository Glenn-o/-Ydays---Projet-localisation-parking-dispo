import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projet_parking/theme.dart';
import 'package:projet_parking/widgets/custom_checkbox.dart';

class Register extends StatefulWidget {
  @override
  RegisterState createState() => RegisterState();
}

class RegisterState extends State<Register> {
  String errorMessage = '';

  void errorRegister(String value) {
    setState(() {
      errorMessage = value;
    });
  }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future register() async {
      if (passwordController.text.trim() ==
          confirmPasswordController.text.trim()) {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim(),
            )
            .then((value) => {Navigator.of(context).pushNamed('/')})
            .catchError((error) => {
                  errorRegister(
                      'Une erreur s\'est produite, veuillez reessayer.'),
                });
      } else {
        errorRegister('Les mots de passe ne correspondent pas.');
      }
    }

    return Scaffold(
      appBar: null,
      drawer: null,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 40.0, 24.0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Créer un compte',
                    style: heading2.copyWith(color: textBlack),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    'assets/accent.png',
                    width: 99,
                    height: 4,
                  ),
                ],
              ),
              const SizedBox(
                height: 48,
              ),
              Form(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: textWhiteGrey,
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: heading6.copyWith(color: textGrey),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: textWhiteGrey,
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Mot de passe',
                          hintStyle: heading6.copyWith(color: textGrey),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: textWhiteGrey,
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      child: TextFormField(
                        controller: confirmPasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Confirmer le mot de passe',
                          hintStyle: heading6.copyWith(color: textGrey),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Text(errorMessage, style: errorStyle),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              Material(
                borderRadius: BorderRadius.circular(14.0),
                elevation: 0,
                child: Container(
                  height: 56,
                  decoration: BoxDecoration(
                    color: primaryBlue,
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        register();
                      },
                      borderRadius: BorderRadius.circular(14.0),
                      child: Center(
                        child: Text(
                          'Créer un compte',
                          style: heading5.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Material(
                borderRadius: BorderRadius.circular(14.0),
                elevation: 0,
                child: Container(
                  height: 56,
                  decoration: BoxDecoration(
                    border: Border.all(color: primaryBlue, width: 2),
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed('/login');
                      },
                      borderRadius: BorderRadius.circular(14.0),
                      child: Center(
                        child: Text(
                          'Se connecter',
                          style: heading5.copyWith(color: primaryBlue),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
