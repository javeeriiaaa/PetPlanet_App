import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pet_planet/Screens/PetShop_Helpline/petshop_contacctform.dart';
import 'package:pet_planet/Screens/PetShop_Helpline/petshop_viewcontacts.dart';
import 'package:pet_planet/Screens/Vet_Helpline/vethospital_contactform.dart';
import 'package:pet_planet/Screens/Vet_Helpline/vethospital_viewcontacts.dart';

class PetShopHelplineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      appBar: AppBar(
        backgroundColor: Colors.teal.shade50,
        title: Text('PET SHOP HELPLINE'),
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
                    builder: (context) => PetShopContactForm(),
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
                    builder: (context) => PetShopContactList(),
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
