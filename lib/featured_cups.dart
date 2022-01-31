import 'package:cupapp/constants.dart';
import 'package:cupapp/recommended_cups.dart';
import 'package:cupapp/title_with_more_btn.dart';
import 'package:flutter/material.dart';

import 'details_screen.dart';

class FeaturedCups extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        FeaturedCupCard(image:"mug_red.png", press:(){},   title:"Mug",
          type:"Red",
          price:110,),
        FeaturedCupCard(image:"mug_green.png", press:(){} ,  title:"Mug",
          type:"Green",
          price:110,),
        FeaturedCupCard(image:"mug_blue.png", press:(){},   title:"Mug",
          type:"Blue",
          price:110,),
      ]
      ),
    );
  }
}

class FeaturedCupCard  extends StatelessWidget{
   final VoidCallback press;
  final String image, title, type;
  final int price;

  const FeaturedCupCard( { Key? key , required this.image,
    required this.title,
    required this.type,
    required this.price,
    required this.press}): super(key:key);


  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    return   GestureDetector(
      onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen(image:image,title:title, type:type, price:price)));  },

      child: Container(
        margin: EdgeInsets.only(left: kDefaultPadding, top: kDefaultPadding/2, bottom: kDefaultPadding/2),
        width: size.width*0.5,
        height: 185,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(image:AssetImage("assets/images/pngsmall/"+image),fit: BoxFit.cover)
        )
        ,),
    );
  }
}
