import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pet_planet/Screens/Vet_Helpline/vethospital_contactform.dart';
import 'package:pet_planet/Screens/Vet_Helpline/vethospital_viewcontacts.dart';

class VetHelplineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      appBar: AppBar(
        backgroundColor: Colors.teal.shade50,
        title: Text('VET HELPLINE'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VetHospitalContactForm(),
                  ),
                );
              },
              child: Text('Register Contacts'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VetHospitalContactList(),
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
