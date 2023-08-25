import 'package:flutter/material.dart';
import 'package:pet_planet/Bottom_Screens/adoption_application_screen.dart';
import 'package:pet_planet/Bottom_Screens/home_screen.dart';
import 'package:pet_planet/Bottom_Screens/pet_details_screen.dart';
import 'package:pet_planet/Bottom_Screens/petshelters_screen.dart';
import 'package:pet_planet/Bottom_Screens/staffinfo_screen.dart';

class BottomHomeScreen extends StatefulWidget {
  const BottomHomeScreen({Key? key}) : super(key: key);

  @override
  State<BottomHomeScreen> createState() => _BottomHomeScreenState();
}

class _BottomHomeScreenState extends State<BottomHomeScreen> {
  int currentIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    PetDetailsScreen(),
    AdpAplScreen(),
    PetSheltersScreen(),
    ReviewScreen(),
  ];
  onTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: onTapped,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
              icon: Icon(
                  Icons.home,
              )),
          BottomNavigationBarItem(
              label: 'Pets Info',
              icon: Icon(
                Icons.pets,
              )),
          BottomNavigationBarItem(
              label: 'AdopApl',
              icon: Icon(
                Icons.add,
              )),
          BottomNavigationBarItem(
              label: 'Shelters',
              icon: Icon(
                Icons.warehouse,
              )),
          BottomNavigationBarItem(
              label: 'Staff',
              icon: Icon(
                Icons.person,
              ))
        ],
      ),
    );
  }
}
