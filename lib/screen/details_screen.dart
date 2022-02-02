import 'package:flutter/material.dart';
import '../dao/cup.dart';
import '../utils/constants.dart';
import '../components/details_body.dart';

class DetailsScreen extends StatelessWidget{
  final Cup cup ;

  const DetailsScreen( { Key? key,
    required this.cup,

  }):super(key:key);


  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: DetailsBody(cup:cup),
   );
  }
  
}