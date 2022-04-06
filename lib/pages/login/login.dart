import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projet_parking/theme.dart';
import 'package:projet_parking/widgets/custom_checkbox.dart';

class Login extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  bool passwordVisible = false;
  String errorMessage = '';

  void togglePassword() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  void errorConnection() {
    setState(() {
      errorMessage = 'Le mot de passe ou l\'email n\'est pas valide.';
    });
  }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  Future signIn() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        )
        .catchError((error) => {errorConnection(), print(error)});
  }

  @override
  Widget build(BuildContext context) {
    Future signIn() async {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          )
          .then((value) => {Navigator.of(context).pushNamed('/')})
          .catchError((error) => {errorConnection(), print(error)});
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
                    'Se connecter à son compte',
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
                        obscureText: !passwordVisible,
                        decoration: InputDecoration(
                          hintText: 'Mot de passe',
                          hintStyle: heading6.copyWith(color: textGrey),
                          suffixIcon: IconButton(
                            color: textGrey,
                            splashRadius: 1,
                            icon: Icon(passwordVisible
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined),
                            onPressed: togglePassword,
                          ),
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
                  CustomCheckbox(),
                  const SizedBox(
                    width: 12,
                  ),
                  Text('Se souvenir de moi', style: regular16pt),
                ],
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
                        signIn();
                      },
                      borderRadius: BorderRadius.circular(14.0),
                      child: Center(
                        child: Text(
                          'Se connecter',
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
                    borderRadius: BorderRadius.circular(14.0),
                    border: Border.all(color: primaryBlue, width: 2),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed('/register');
                      },
                      borderRadius: BorderRadius.circular(14.0),
                      child: Center(
                        child: Text(
                          'Créer un compte',
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
