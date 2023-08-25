import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/cats_model.dart';
import '../utils/constants.dart';
import 'Petinfo_detail.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cached_network_image/cached_network_image.dart';


class PetDetailsScreen extends StatefulWidget {
  const PetDetailsScreen({Key? key}) : super(key: key);

  @override
  State<PetDetailsScreen> createState() => _PetDetailsScreenState();
}

Future<DocumentSnapshot<Map<String, dynamic>>> _getPetData() async {
  final petsCollection = FirebaseFirestore.instance.collection('pets');
  final petDocument = await petsCollection.doc('your_pet_document_id').get();
  return petDocument;
}

class _PetDetailsScreenState extends State<PetDetailsScreen> {
  List<String> categories = ['Cats', 'Dogs', 'Birds', 'Fish'];
  String category = 'Cats';
  int selectedPage = 0;
  List<IconData> icons = [
    Icons.home_outlined,
    Icons.favorite_outline_rounded,
    Icons.chat_outlined,
    Icons.person_outline_rounded
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Location',
                              style: poppins.copyWith(
                                  fontSize: 14, color: black.withOpacity(0.6)),
                            ),
                            const SizedBox(width: 5),
                            const Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: blue,
                              size: 18,
                            )
                          ],
                        ),
                        Text.rich(TextSpan(children: [
                          TextSpan(
                              text: 'Islamabad, ',
                              style: poppins.copyWith(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: black)),
                          TextSpan(
                              text: 'Pakistan',
                              style:
                              poppins.copyWith(fontSize: 24, color: black)),
                        ])),
                      ],
                    ),
                  ),
                  const Icon(Icons.search),
                  const SizedBox(width: 10),
                  Stack(
                    children: [
                      const Icon(Icons.notifications_outlined),
                      Positioned(
                        right: 5,
                        top: 5,
                        child: Container(
                          height: 7,
                          width: 7,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: red),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  color: blue.withOpacity(0.6),
                  child: Stack(children: [
                    Positioned(
                      bottom: -35,
                      right: -30,
                      width: 150,
                      height: 150,
                      child: Transform.rotate(
                        angle: 12,
                        child: SvgPicture.asset(
                          'assets/Paw_Print.svg',
                          color: blue,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -35,
                      left: -35,
                      width: 150,
                      height: 150,
                      child: Transform.rotate(
                        angle: -12,
                        child: SvgPicture.asset(
                          'assets/Paw_Print.svg',
                          color: blue,
                        ),
                      ),
                    ),
                    Positioned(
                      top: -40,
                      left: 120,
                      width: 150,
                      height: 150,
                      child: Transform.rotate(
                        angle: -16,
                        child: SvgPicture.asset(
                          'assets/Paw_Print.svg',
                          color: blue,
                        ),
                      ),
                    ),
                    // Positioned(
                    //     bottom: 0,
                    //     right: 20,
                    //     height: 135,
                    //     child: Image.asset('assets/cats/cat1.png')),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Join Our Animal\nLovers Community',
                            style: poppins.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: white),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: orange),
                            child: Text(
                              'Join Us',
                              style: poppins.copyWith(color: white, fontSize: 14),
                            ),
                          )
                        ],
                      ),
                    )
                  ]),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    'Categories',
                    style: poppins.copyWith(
                        fontSize: 16, fontWeight: FontWeight.bold, color: black),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        'View All',
                        style: poppins.copyWith(fontSize: 12, color: orange),
                      ),
                      const SizedBox(width: 10),
                      Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: orange),
                          child: const Icon(
                            Icons.keyboard_arrow_right_rounded,
                            size: 14,
                            color: white,
                          ))
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 10),
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                const SizedBox(width: 20),
                Container(
                    padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    decoration: const BoxDecoration(color: white),
                    child: const Icon(
                      Icons.tune_rounded,
                    )),
                ...List.generate(
                  categories.length,
                      (index) => Padding(
                    padding: index == 0
                        ? const EdgeInsets.only(left: 20, right: 20)
                        : const EdgeInsets.only(right: 20),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          category = categories[index];
                        });
                      },
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: categories[index] == category ? blue : white,
                              boxShadow: [
                                categories[index] == category
                                    ? const BoxShadow(
                                    offset: Offset(0, 5),
                                    color: blue,
                                    spreadRadius: 0,
                                    blurRadius: 5)
                                    : const BoxShadow(color: white),
                              ]),
                          child: Text(
                            categories[index],
                            style: poppins.copyWith(
                                color:
                                categories[index] == category ? white : black,
                                fontSize: 14),
                          )),
                    ),
                  ),
                )
              ]),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    'Adopt Pet',
                    style: poppins.copyWith(
                        fontSize: 16, fontWeight: FontWeight.bold, color: black),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        'View All',
                        style: poppins.copyWith(fontSize: 12, color: orange),
                      ),
                      const SizedBox(width: 10),
                      Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: orange),
                          child: const Icon(
                            Icons.keyboard_arrow_right_rounded,
                            size: 14,
                            color: white,
                          ))
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  cats.length,
                      (index) => Padding(
                    padding: index == 0
                        ? const EdgeInsets.only(left: 20, right: 20)
                        : const EdgeInsets.only(right: 20),
                    child: GestureDetector(
                        onTap: () {

                          Navigator.push(
                              context,
                               MaterialPageRoute(
                                   builder: (context) =>
                                       PetInfoDetailPage(cat: cats[index])));
                        },
                        child: CatItem(cat: cats[index])),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        color: white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
              icons.length,
                  (index) => GestureDetector(
                onTap: () {
                  setState(() {
                    selectedPage = index;
                  });
                },
                child: Container(
                  height: 60,
                  width: 50,
                  padding: const EdgeInsets.all(5),
                  child: Stack(
                    children: [
                      SizedBox(
                        height: 60,
                        width: 50,
                        child: Column(
                          children: [
                            Icon(
                              icons[index],
                              color: selectedPage == index
                                  ? blue
                                  : black.withOpacity(0.6),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            selectedPage == index
                                ? Container(
                              height: 5,
                              width: 5,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: blue),
                            )
                                : Container()
                          ],
                        ),
                      ),
                      index == 2
                          ? Positioned(
                        right: 0,
                        top: -5,
                        child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: blue),
                            child: Text(
                              '6',
                              style: poppins.copyWith(color: white),
                            )),
                      )
                          : Container()
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}

class CatItem extends StatelessWidget {
  final Cat cat;
  const CatItem({
    Key? key,
    required this.cat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.35,
        width: MediaQuery.of(context).size.width * 0.6,
        color: cat.color.withOpacity(0.6),
        child: Stack(
          children: [
            Positioned(
              bottom: -10,
              right: -10,
              height: 100,
              width: 100,
              child: Transform.rotate(
                  angle: 12,
                  child: SvgPicture.asset(
                    'assets/Paw_Print.svg',
                    color: cat.color,
                    fit: BoxFit.cover,
                  )),
            ),
            Positioned(
              top: 100,
              left: -25,
              height: 100,
              width: 100,
              child: Transform.rotate(
                  angle: -11.5,
                  child: SvgPicture.asset(
                    'assets/Paw_Print.svg',
                    color: cat.color,
                    fit: BoxFit.cover,
                  )),
            ),
            Positioned(
              bottom: -10,
              right: -80,
              left: 20,
              child: Image.asset(
                cat.image,
                height: MediaQuery.of(context).size.height * 0.25,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cat.name,
                          style: poppins.copyWith(
                              fontSize: 16,
                              color: black,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              color: blue,
                              size: 16,
                            ),
                            Text(
                              'Distance (${cat.distance} Km)',
                              style: poppins.copyWith(
                                fontSize: 12,
                                color: black.withOpacity(0.6),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: white),
                    child: Icon(
                      cat.fav
                          ? Icons.favorite_rounded
                          : Icons.favorite_outline_rounded,
                      color: cat.fav ? red : black.withOpacity(0.6),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
