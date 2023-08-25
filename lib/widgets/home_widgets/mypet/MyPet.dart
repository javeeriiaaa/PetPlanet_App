import 'package:flutter/material.dart';

class MyPet extends StatelessWidget {
  const MyPet({Key? key}) : super(key: key);

  showModelMyPet(BuildContext context){
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height/1.4,
              width: 400,
            decoration: BoxDecoration(
              color: Colors.teal.shade200,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20)
              ),
            ),
          );
        },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showModelMyPet(context),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          height: 180,
          width: MediaQuery.of(context).size.width*0.7,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF4DB6AC),
                  Color(0xFF4DB6AC),
                  Color(0xFF4DB6AC),
                ],
              )
          ),
          child: Row(
            children: [
              Expanded(child: Column(
                children: [
                  ListTile(
                    title: Text("My Pet Location"),
                    subtitle: Text("SHARE"),
                  )
                ],
              )),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                  child: Image.asset('assets/MyPetLocation.png')),

            ],
          ),
        ),
      ),
    );
  }
}
