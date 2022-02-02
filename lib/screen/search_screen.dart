import 'package:cupapp/components/search_body.dart';
import 'package:flutter/material.dart';
import '../dao/cup.dart';
import '../utils/constants.dart';
import '../components/details_body.dart';
import 'package:provider/provider.dart';


class SearchScreen extends StatelessWidget{
  String searchWord;

  SearchScreen({required this.searchWord});

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
   return SafeArea(
     child: Scaffold(
       body: SearchBody(searchWord:searchWord),
     ),
   );
  }

}
