import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:password_app/screens/home_page.dart';
import 'package:password_app/screens/password_page.dart';
import 'package:password_app/services/auth_services.dart';


class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(),);
          }
          else if (snapshot.hasError) {
            return Center(child: Text('something went wrong'),);
          }
          else if (snapshot.hasData) {
            return HomePage();
          } else {
            return AuthPage();
          }
        }
      ),
    );
  }
}
