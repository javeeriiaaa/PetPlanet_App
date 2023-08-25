import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class Contact {
  final String name;
  final String phoneNumber;

  Contact({required this.name, required this.phoneNumber});
}

class ShelterContactList extends StatefulWidget {
  @override
  _ShelterContactListState createState() => _ShelterContactListState();
}

class _ShelterContactListState extends State<ShelterContactList> {
  _callNumber(String number) async {
    await FlutterPhoneDirectCaller.callNumber(number);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      appBar: AppBar(
        backgroundColor: Colors.teal.shade50,
        title: Text('Shelter Contacts'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('shelter_contacts').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasData) {
            final contacts = snapshot.data!.docs.map((doc) {
              final data = doc.data() as Map<String, dynamic>;
              return Contact(
                name: data['name'],
                phoneNumber: data['phoneNumber'],
              );
            }).toList();

            return ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                final contact = contacts[index];
                return ListTile(
                  onTap: () => _callNumber('0349 7405097'),
                  title: Text(contact.name),
                  subtitle: Text(contact.phoneNumber),
                );
              },
            );
          }

          return Center(
            child: Text('No contacts found.'),
          );
        },
      ),
    );
  }
}