import 'package:flutter/material.dart';
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

class AdoptionHistoryScreen extends StatefulWidget {
  @override
  State<AdoptionHistoryScreen> createState() => _AdoptionHistoryScreenState();
}

class _AdoptionHistoryScreenState extends State<AdoptionHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Adoption Applications'),
          backgroundColor: Colors.teal,
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('adoption_application').snapshots(),
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
    final applications = snapshot.data!.docs.map((doc) {
    final data = doc.data() as Map<String, dynamic>;
    return AdoptionApplication(
    name: data['name'],
    contact: data['contact'],
    address: data['address'],
    date: data['date'],
    pet: data['pet'],
    breed: data['breed'],
    );
    }).toList();

    return ListView.builder(
      itemCount: applications.length,
      itemBuilder: (context, index) {
        final application = applications[index];
        return ListTile(
          title: Text(application.name),
          subtitle: Text(application.pet),
          trailing: Icon(Icons.arrow_forward),
          onTap: (){
            //
          },
        );
      },
    );
    }
    return Center(
              child: Text('No applications found.'),
            );
          },
        ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        },
        child: Text('Back to Home'),
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.teal.shade50,
          backgroundColor: Colors.teal,
          padding: EdgeInsets.symmetric(vertical: 16.0),
        ),
      ),
    );
  }
}






//             return ListView(
//               children: snapshot.data!.docs.map((DocumentSnapshot document) {
//                 Map<String, dynamic> data = document.data() as Map<String, dynamic>;
//
//                 return ListTile(
//                   title: Text(data['name']),
//                   subtitle: Text(data['pet type']),
//                   trailing: Icon(Icons.arrow_forward),
//                   onTap: () {
//                     // Handle tapping on a blood donation
//                     // For example, you can navigate to a detailed view
//                   },
//                 );
//               }).toList(),
//             );
//           }},
//         ),
//         floatingActionButton: ElevatedButton(
//             onPressed: () {
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(builder: (context) => HomeScreen()),
//               );
//             },
//             child: Text('Go Back To HomePage'),
//             style: ElevatedButton.styleFrom(
//               foregroundColor: Colors.teal.shade50,
//               backgroundColor: Colors.teal,
//               padding: EdgeInsets.symmetric(vertical: 16.0),
//             ),
//             ),
//         );
//     }
// }