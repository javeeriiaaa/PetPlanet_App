import 'package:flutter/material.dart';
import '../utils/constants.dart';
import 'owners_model.dart';

class Shelter {
  final Color color;
  final String name, location, sex, description;
  final double age, weight;
  final int distance;
  final bool fav;
  final Owner owner;

  Shelter({
    required this.fav,
    required this.color,
    required this.description,
    required this.name,
    required this.location,
    required this.sex,
    required this.age,
    required this.weight,
    required this.distance,
    required this.owner,
  });
}

List<Shelter> shelter = [
  Shelter(
      fav: true,
      color: orange,
      name: 'Goofy Doggo Family',
      description: desc,
      location: 'D13, Islamabad',
      sex: 'Male',
      age: 2.1,
      weight: 4.5,
      distance: 7,
      owner: owners[0]),
  Shelter(
      fav: false,
      color: green,
      name: 'Pets Plus',
      description: desc,
      location: 'Islamabad',
      sex: 'Female',
      age: 1.2,
      weight: 2.6,
      distance: 5,
      owner: owners[1]),
  Shelter(
      fav: true,
      color: blue,
      name: 'The Pets Love TPL',
      description: desc,
      location: 'Pekanbaru, Riau',
      sex: 'Male',
      age: 1.4,
      weight: 3.4,
      distance: 7,
      owner: owners[2]),
  Shelter(
      fav: true,
      color: red,
      name: 'Pet Rescue',
      description: desc,
      location: 'Kampar, Riau',
      sex: 'Female',
      age: 1.1,
      weight: 3.2,
      distance: 11,
      owner: owners[0]),
];
String desc =
    'This cat is a domestic species of small carnivorous mammal. It is the only domesticated species in the family Felidae and is often reffered to as the domestic cat to distinguish it from the wild members of the family. A cat can either be a house cat, a farm cat or a feral cat, the latter rangers freely and avoids human contacts. Domestic cats are valued by humans for companionship and their ability to kill redonts. About 60 cat breeds are recognized by various cat registries.';
// 'Leo is a cat that i have found on the side of the road 1 year ago he is now a cheerful and active cat';
