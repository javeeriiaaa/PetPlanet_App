import 'package:flutter/material.dart';

import 'helplines/petshop_helpline.dart';
import 'helplines/shelter_helpline.dart';
import 'helplines/vet_helpline.dart';

class Helpline extends StatelessWidget {
  const Helpline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 180,
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          VetHelpline(),
          ShelterHelpline(),
          PetShopHelpline(),
        ],
      ),
    );
  }
}
