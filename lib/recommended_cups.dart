import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'constants.dart';
import 'cup.dart';
import 'cups_view_model.dart';
import 'details_screen.dart';
import 'package:provider/provider.dart';

class RecommendedCups  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final cupsViewModel=Provider.of<CupsViewModel>(context,listen:false);
    List<Cup> cupsRecommended=cupsViewModel.cupsRecommended;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children:
      cupsRecommended.map((cup) =>  RecommendCupCard( cup:cup  )).toList()

      ),
    );
  }
}
//
class RecommendCupCard extends StatelessWidget {

  final Cup cup ;

  const RecommendCupCard( { Key? key , required this.cup }): super(key:key);

  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    return Container(
        margin: EdgeInsets.only(left:kDefaultPadding,top:kDefaultPadding/2, bottom: kDefaultPadding*2.5),
        width: size.width*0.4,
        child:Column(
          children: [
          GestureDetector(
          onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen(image:cup.image,title:cup.title, type:cup.type, price:cup.price)));  },
          child:   Image.asset("assets/images/pngsmall/"+cup.image),
          ),
            Container(
                padding: EdgeInsets.all(kDefaultPadding),
                decoration: BoxDecoration(
                    color:Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    boxShadow:[BoxShadow(
                      offset:Offset(0,10),
                      blurRadius: 50,
                      color:kPrimaryColor.withOpacity(0.2),
                    )
                    ]
                ),
                child:Row(
                  children: [
                    RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "${cup.title}\n".toUpperCase(),
                              style:Theme.of(context).textTheme.button),
                          TextSpan(
                              text: "${cup.type}".toUpperCase(),
                              style:TextStyle(color:kPrimaryColor.withOpacity(0.5))),
                        ])
                    ),
                    Spacer(),
                    Text("${cup.price}", style: Theme.of(context).textTheme.button?.copyWith(color: kPrimaryColor)),
                  ],
                ),
              ),

          ],
        ));
  }
}


