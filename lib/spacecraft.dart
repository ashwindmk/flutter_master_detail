import 'package:flutter/cupertino.dart';

class Spacecraft {
  final String id;
  final String name, imageUrl, propellant;

  Spacecraft({this.id, this.name, this.imageUrl, this.propellant});

  factory Spacecraft.fromJson(Map<String, dynamic> jsonData) {
    return Spacecraft(id: jsonData['id'], name: jsonData['name'], imageUrl: jsonData['imageurl'], propellant: jsonData['propellant']);
  }

  Widget getImage() {
    return Image.network(this.imageUrl, fit: BoxFit.cover);
  }

  @override
  String toString() {
    return "Spacecraft {id: " + this.id + ", name: " + this.name + ", propellant: " + this.propellant + '}';
  }
}
