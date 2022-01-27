import 'package:cupapp/constants.dart';
import 'package:cupapp/recommended_cups.dart';
import 'package:cupapp/title_with_more_btn.dart';
import 'package:flutter/material.dart';

class FeaturedCups extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        FeaturedCupCard(image:"assets/images/pngsmall/mug_red.png", press:(){}),
        FeaturedCupCard(image:"assets/images/pngsmall/mug_green.png", press:(){}),
        FeaturedCupCard(image:"assets/images/pngsmall/mug_blue.png", press:(){}),
      ]
      ),
    );
  }
}

class FeaturedCupCard  extends StatelessWidget{
  final String image;
  final VoidCallback press;


  const FeaturedCupCard( { Key? key , required this.image, required this.press}): super(key:key);

  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    return   GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.only(left: kDefaultPadding, top: kDefaultPadding/2, bottom: kDefaultPadding/2),
        width: size.width*0.5,
        height: 185,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(image:AssetImage(image),fit: BoxFit.cover)
        )
        ,),
    );
  }
}
