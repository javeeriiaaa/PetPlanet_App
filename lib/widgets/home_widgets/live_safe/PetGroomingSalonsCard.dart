import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PetGroomingSalonsCard extends StatelessWidget {
  final Function? onMapFunction;
  const PetGroomingSalonsCard({Key? key, this.onMapFunction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              onMapFunction!('Pet grooming salons near me');
            },
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Container(
                height: 50,
                width: 50,
                child: Center(
                  child: Image.asset('assets/marker.png',
                    height: 50,
                  ),
                ),
              ),
            ),
          ),
          Text('Grooming Salons')
        ],
      ),
    );
  }
}
