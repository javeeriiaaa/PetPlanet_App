// import 'package:flutter/material.dart';
//
// class AdpAplScreen extends StatelessWidget {
//   const AdpAplScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.teal.shade50,
//       body: Column(
//         children: [
//           Text('Adoption Application Page'),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pet_planet/Bottom_Screens/home_screen.dart';

class AdoptionApplication {
  final String name;
  final String contact;
  final String address;
  final double date;
  final String pet;
  final String breed;

  AdoptionApplication({
    required this.name,
    required this.contact,
    required this.address,
    required this.date,
    required this.pet,
    required this.breed,
  });
}

class AdpAplScreen extends StatefulWidget {
  @override
  _AdpAplScreenState createState() => _AdpAplScreenState();
}

class _AdpAplScreenState extends State<AdpAplScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _contactController = TextEditingController();
  final _addressController = TextEditingController();
  final _dateController = TextEditingController();
  final _petController = TextEditingController();
  final _breedController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _contactController.dispose();
    _addressController.dispose();
    _dateController.dispose();
    _petController.dispose();
    _breedController.dispose();
    super.dispose();
  }

  void _saveAdoptionApplication() {
    if (_formKey.currentState!.validate()) {
      AdoptionApplication adoptionApplication = AdoptionApplication(
        name: _nameController.text.trim(),
        contact: _contactController.text.trim(),
        address: _addressController.text.trim(),
        date: double.parse(_dateController.text),
        pet: _petController.text.trim(),
        breed: _breedController.text.trim(),
      );
      saveAdoptionApplicationToFirestore(adoptionApplication);
    }
  }

  void saveAdoptionApplicationToFirestore(AdoptionApplication adoptionApplication) async {
    CollectionReference adoptionApplicationsCollection =
    FirebaseFirestore.instance.collection('adoption_application');

    await adoptionApplicationsCollection.add({
      'name': adoptionApplication.name,
      'contact': adoptionApplication.contact,
      'address': adoptionApplication.address,
      'date': adoptionApplication.date,
      'pet': adoptionApplication.pet,
      'breed': adoptionApplication.breed,
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Adoption Application submitted successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade50,
        body: SafeArea(
          child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        fillColor: Colors.teal.shade50,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(color: Colors.teal),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      controller: _contactController,
                      decoration: InputDecoration(
                        labelText: 'Contact',
                        fillColor: Colors.teal.shade50,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(color: Colors.teal),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a contact';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      controller: _addressController,
                      decoration: InputDecoration(
                        labelText: 'Address',
                        fillColor: Colors.teal.shade50,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(color: Colors.teal),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an address';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      controller: _dateController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Date',
                        fillColor: Colors.teal.shade50,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(color: Colors.teal),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter date';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      controller: _petController,
                      decoration: InputDecoration(
                        labelText: 'Pet Type',
                        fillColor: Colors.teal.shade50,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(color: Colors.teal),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a pet type';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      controller: _breedController,
                      decoration: InputDecoration(
                        labelText: 'Breed',
                        fillColor: Colors.teal.shade50,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(color: Colors.teal),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter breed';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: _saveAdoptionApplication,
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                      child: Text('Save Adoption Application',
                      style: TextStyle(
                        color: Colors.teal.shade50
                      )),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      },
                      child: Text('Go Back To HomePage'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.teal.shade50,
                        backgroundColor: Colors.teal,
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                      ),
                    ),
                  ],
                ),
              ),
              ),
        ),
        );
    }
}