import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:password_app/screens/password_page.dart';


class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);

  final _auth = FirebaseAuth.instance;
  TextEditingController emailText = TextEditingController();
  TextEditingController passwordText = TextEditingController();
  final formKey = GlobalKey<FormState>();
  Future signin() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
  }

  @override
  void dispose () {
    emailText.dispose();
    passwordText.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
                height: double.infinity,
                width: double.infinity,
                color: Color(0xffB20600),
                child: Lottie.asset('assets/images/welcome.json',
                    fit: BoxFit.fitWidth)),
            Container(
              height: 500,
              width: double.infinity,
              // color: Colors.purple,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                  topLeft: Radius.circular(50),
                ),
                color: Colors.white,
              ),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 70,
                    ),
                    Text(
                      'Sign In',
                      style: TextStyle(fontSize: 50),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 30, left: 30),
                      child: TextFormField(
                        controller: emailText,
                        cursorColor: Color(0xffB20600),
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffB20600),
                            ),
                          ),
                          labelText: 'Email',
                          labelStyle: TextStyle(
                            color: Color(0xffB20600),
                          ),
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (email) =>
                        email  != null && !EmailValidator.validate(email)
                            ? 'Enter a valid email'
                            : null,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 30, left: 30),
                      child: TextFormField(
                          controller: passwordText,
                          cursorColor: Color(0xffB20600),
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xffB20600),
                              ),
                            ),
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              color: Color(0xffB20600),
                            ),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) =>
                          value != null && value.length < 6
                              ? 'Enter min. 6 password'
                              : null
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    RichText(
                      text: TextSpan(
                          text: 'Don\'t have an account ? ',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PasswordPage(),
                                      ),
                                    );
                                  },
                                text: 'Login',
                                style: TextStyle(
                                    fontSize: 15, color: Color(0xffB20600))),
                          ]),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: SizedBox(
                        width: 250,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () async {
                            try {
                              await _auth.signInWithEmailAndPassword(
                                email: emailText.text.trim(),
                                password: passwordText.text.trim(),
                              );
                            } on FirebaseAuthException catch (e) {
                              print(e);
                            }
                          },
                          child: Text('Sign In'),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xffB20600),
                            textStyle: TextStyle(fontSize: 20),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
