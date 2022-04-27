import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Home',
        style: TextStyle(
          fontSize: 30,
        ),),),
        backgroundColor: Color(0xffB20600),
        elevation: 0,
        toolbarHeight: 70,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('Signed in as',
            style: TextStyle(
              fontSize: 50,
            ),),
          ),
          SizedBox(height: 10,),
          Text(user.email!,
            style: TextStyle(
                fontSize: 30,
            ),
          ),
          SizedBox(height: 20,),
          SizedBox(
            height: 45,
            width: 250,
            child: ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                child: Text('Sign out'),
              style: ElevatedButton.styleFrom(
                textStyle: TextStyle(
                  fontSize: 30,
                ),
                primary: Color(0xffB20600),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
