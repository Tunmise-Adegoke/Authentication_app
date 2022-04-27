
import 'package:flutter/material.dart';
import 'package:password_app/screens/password_page.dart';
import 'package:password_app/screens/sign_in_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  bool isLogin = true;
  @override
  Widget build(BuildContext context) {
    return isLogin
        ? PasswordPage()
        : SignInPage();
  }
}
