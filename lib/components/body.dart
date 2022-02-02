import 'package:cupapp/utils/constants.dart';
import 'package:cupapp/components/recommended_cups.dart';
import 'package:cupapp/components/title_with_more_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import '../utils/constants.dart';
import 'featured_cups.dart';
import 'header_with_searchbox.dart';

class Body extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
       crossAxisAlignment:CrossAxisAlignment.start ,
  children: [
          HeaderSearchbar(),
          TitleWithMoreBtn(text: "Recommended", press:(){}),
          RecommendedCups(),
          TitleWithMoreBtn(text: "Featured cups", press:(){}),
           FeaturedCups(),
           SizedBox(height: kDefaultPadding,),


  ],

      ),
    );
  }


  
}
