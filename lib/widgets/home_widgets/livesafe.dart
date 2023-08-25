import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

import 'live_safe/PetFriendlyRestaurantsCard.dart';
import 'live_safe/PetGroomingSalonsCard.dart';
import 'live_safe/PetFriendlyParksCard.dart';
import 'live_safe/PetSheltersCard.dart';
import 'live_safe/PetShopsCard.dart';
import 'live_safe/PetTrainingCentersCard.dart';
import 'live_safe/VeterinaryHospitalsCard.dart';

class LiveSafe extends StatelessWidget {
  const LiveSafe({Key? key}) : super(key: key);

  static Future<void> openMap(String location) async {
    String googleUrl =
        'https://www.google.com/maps/search/$location';
    final Uri _url = Uri.parse(googleUrl);
    try {
      await launchUrl(_url);
    } catch (e) {
      Fluttertoast.showToast(
          msg: 'something went wrong! call on helpline');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          VeterinaryHospitalsCard(onMapFunction: openMap),
          PetSheltersCard(onMapFunction: openMap),
          PetShopsCard(onMapFunction: openMap),
          PetGroomingSalonsCard(onMapFunction: openMap),
          PetFriendlyParksCard(onMapFunction: openMap),
          PetTrainingCentersCard(onMapFunction: openMap),
          PetFriendlyRestaurantsCard(onMapFunction: openMap),
        ],
      ),
    );
  }
}
