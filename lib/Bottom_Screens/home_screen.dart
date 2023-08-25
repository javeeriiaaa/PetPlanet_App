import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pet_planet/widgets/home_widgets/CustomCarouel.dart';
import 'package:pet_planet/widgets/home_widgets/custom_appBar.dart';

import '../drawer_screens/AdoptionHistory_Screen.dart';
import '../widgets/home_widgets/helpline.dart';
import '../widgets/home_widgets/livesafe.dart';
import '../widgets/home_widgets/mypet/MyPet.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

void logoutuser(){
  FirebaseAuth.instance.signOut();
}

class _HomeScreenState extends State<HomeScreen> {
  //const HomeScreen({Key? key}) : super(key: key);
  int qIndex = 0;

  getRandomQuote() {
    Random random = Random();

    setState(() {
      qIndex = random.nextInt(9);
    });
  }
  @override
  void initState() {
    getRandomQuote();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      appBar: AppBar(
        foregroundColor: Colors.teal.shade50,
        backgroundColor: Colors.teal,
        title: Text('♡ NICE TO MEOW YOU ♡',
        style: TextStyle(letterSpacing: 3),),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.teal,
              ),
              child: Text(
                'M E O W',
                style: TextStyle(
                  color: Colors.teal.shade50,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.pets),
              title: Text('Pet Store'),
              onTap: () {
                // Handle drawer item 1 tap
              },
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: Text('Adoption History'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AdoptionHistoryScreen()));
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Log Out'),
              onTap: () {
                logoutuser();
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CustomAppBar(
                quoteIndex: qIndex,
                onTap: (){
                  getRandomQuote();
                }),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    CustomCarouel(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Helpline:",
                        style: TextStyle(fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Helpline(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Explore the LiveSafe:",
                        style: TextStyle(fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    LiveSafe(),
                    MyPet(),
                  ],
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}
