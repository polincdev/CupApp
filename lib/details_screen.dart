import 'package:flutter/material.dart';
import 'constants.dart';
import 'details_body.dart';

class DetailsScreen extends StatelessWidget{

  final String   image, title, type;
  final int price;

  const DetailsScreen( { Key? key,
    required this.image,
    required this.title,
    required this.type,
    required this.price,

  }):super(key:key);


  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: DetailsBody(image:image, title:title, type:type, price:price),
   );
  }
  
}