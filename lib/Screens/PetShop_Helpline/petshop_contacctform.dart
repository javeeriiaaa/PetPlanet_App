import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Contact {
  final String name;
  final String phoneNumber;

  Contact({required this.name, required this.phoneNumber});
}

class PetShopContactForm extends StatefulWidget {
  @override
  _PetShopContactFormState createState() => _PetShopContactFormState();
}

class _PetShopContactFormState extends State<PetShopContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  void _saveContact() {
    if (_formKey.currentState!.validate()) {
      Contact contact = Contact(
        name: _nameController.text.trim(),
        phoneNumber: _phoneNumberController.text.trim(),
      );
      saveContactToFirestore(contact);
    }
  }

  void saveContactToFirestore(Contact contact) async {
    CollectionReference contactsCollection = FirebaseFirestore.instance.collection('petshop_contacts');

    await contactsCollection.add({
      'name': contact.name,
      'phoneNumber': contact.phoneNumber,
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Contact saved successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      appBar: AppBar(
        backgroundColor: Colors.teal.shade50,
        title: Text('Add Contact'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _phoneNumberController,
                decoration: InputDecoration(labelText: 'Phone Number'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a phone number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _saveContact,
                child: Text('Save Contact'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}