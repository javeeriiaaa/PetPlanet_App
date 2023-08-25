import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pet_planet/Screens/Shelter_Helpline/shelter_contactform.dart';
import 'package:pet_planet/Screens/Shelter_Helpline/shelter_viewcontacts.dart';
import 'package:pet_planet/Screens/Vet_Helpline/vethospital_contactform.dart';
import 'package:pet_planet/Screens/Vet_Helpline/vethospital_viewcontacts.dart';

class ShelterHelplineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      appBar: AppBar(
        backgroundColor: Colors.teal.shade50,
        title: Text('SHELTER HELPLINE'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShelterContactForm(),
                  ),
                );
              },
              child: Text('Register Contacts'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShelterContactList(),
                  ),
                );
              },
              child: Text('View Contacts'),
            ),
          ],
        ),
      ),
    );
  }
}
