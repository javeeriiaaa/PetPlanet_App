import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PetTrainingCentersCard extends StatelessWidget {
  final Function? onMapFunction;
  const PetTrainingCentersCard({Key? key, this.onMapFunction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              onMapFunction!('Pet training centers near me');
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
          Text('Training Centers')
        ],
      ),
    );
  }
}
