import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pet_planet/Bottom_Screens/home_screen.dart';
import 'package:pet_planet/bottom_home_screen.dart';
import 'package:pet_planet/login_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if(snapshot.hasData){
                return BottomHomeScreen();
              }
              else{
                return const LoginScreen();
              }
            },
            ),
        );
    }
}