import 'package:cupapp/constants.dart';
import 'package:cupapp/recommended_cups.dart';
import 'package:cupapp/title_with_more_btn.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cup.dart';
import 'cups_view_model.dart';
import 'details_screen.dart';

class FeaturedCups extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final cupsViewModel=Provider.of<CupsViewModel>(context,listen:false);
    List<Cup> cupsFeatured=cupsViewModel.cupsFeatured;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children:
        cupsFeatured.map((cup) =>  FeaturedCupCard( cup:cup, press:(){} )).toList()

      ),
    );
  }
}

class FeaturedCupCard  extends StatelessWidget{
   final VoidCallback press;
  final Cup cup ;

  const FeaturedCupCard( { Key? key , required this.cup,
    required this.press}): super(key:key);


  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    return   GestureDetector(
      onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen(image:cup.image,title:cup.title, type:cup.type, price:cup.price)));  },

      child: Container(
        margin: EdgeInsets.only(left: kDefaultPadding, top: kDefaultPadding/2, bottom: kDefaultPadding/2),
        width: size.width*0.5,
        height: 185,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(image:AssetImage("assets/images/pngsmall/"+cup.image),fit: BoxFit.cover)
        )
        ,),
    );
  }
}
