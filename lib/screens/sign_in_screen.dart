import 'package:final_project/screens/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(

            controller: _emailController,
          ),
          TextField(
            controller: _passwordController,
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: ()async {
          //create user
          // try {
          //   final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          //     email: _emailController.text,
          //     password: _passwordController.text,
          //   );
          // } on FirebaseAuthException catch (e) {
          //   if (e.code == 'weak-password') {
          //     print('The password provided is too weak.');
          //   } else if (e.code == 'email-already-in-use') {
          //     print('The account already exists for that email.');
          //   }
          // } catch (e) {
          //   print(e);
          // }
// check email and password
          try {
            final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                email: _emailController.text,
                password: _passwordController.text
            );
            Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen(),));


          } on FirebaseAuthException catch (e) {
            if (e.code == 'user-not-found') {
              print('No user found for that email.');
            } else if (e.code == 'wrong-password') {
              print('Wrong password provided for that user.');
            }
          }

          print(_emailController.text);

          print(_passwordController.text);

        },
        child: Text("SignIn"),
      ),
    );
  }
}
