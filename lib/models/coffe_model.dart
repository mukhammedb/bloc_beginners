import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

class Coffe extends Equatable{
  final String id;
  final String name;
  final Image image;

  const Coffe({
    required this.id,
    required this.name,
    required this.image,
  });

  @override 
  List<Object?> get props => [id, name, image];

  static List<Coffe> coffes = [
    Coffe(id: '0', name: 'Americano', 
    image: Image.asset('assets/images/amc.jpg' , 
    ),),


    Coffe(id: '1', name:'latte',
     image: Image.asset('assets/images/latte.jpg', ),),
  ];
}