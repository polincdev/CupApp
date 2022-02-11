import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../utils/Utils.dart';
import '../utils/constants.dart';
import '../dao/cup.dart';
import '../data/cups_view_model.dart';
import '../screen/details_screen.dart';
import 'package:provider/provider.dart';

class FeaturedCups extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final cupsViewModel=Provider.of<CupsViewModel>(context,listen:false);
   // List<Cup> cupsFeatured=cupsViewModel.cupsFeatured;
     Size size= MediaQuery.of(context).size;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child:  FutureBuilder (
        future:cupsViewModel.retrieveFeaturedSomeCups() ,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.hasData) {
            List<Cup> cups=cupsViewModel.prepareCupsList(snapshot.data as QuerySnapshot<Map<String, dynamic>> );
            return Row(children: cups.map((cup) =>   FeaturedCupCard(cup: cup, press:(){} )).toList());
            // return Row(children:  cupsRecommended.map((cup) =>  RecommendCupCard( cup:cup  )).toList()  );
          }
          else if(snapshot.hasError)
            return Container(width:size.width,child: Center(child: Text("No data") ));
          else
            return  Container(width:size.width,child: Center(child: CircularProgressIndicator() ));
        },
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
      onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen(cup:cup)));  },

      child: Container(
        margin: EdgeInsets.only(left: kDefaultPadding, top: kDefaultPadding/2, bottom: kDefaultPadding/2),
        width: size.width*0.5,
        height: 100,
       /* decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(image:AssetImage("assets/images/pngsmall/"+cup.image+".png"),fit: BoxFit.fitWidth)
        )*/
          child:Utils.loadImage(cup.image, size),
        ),
    );
  }
}
