import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'constants.dart';
import 'details_screen.dart';

class RecommendedCups  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children:[
          RecommendCupCard(
              image:"cup_red.png",
              title:"Cup",
              type:"Red",
              price:110,
               ),
          RecommendCupCard(
              image:"cup_blue.png",
              title:"Cup",
              type:"Blue",
              price:90,
               ),
          RecommendCupCard(
              image:"cup_green.png",
              title:"Cup",
              type:"Green",
              price:100,
              ),

        ],
      ),
    );
  }
}
//
class RecommendCupCard extends StatelessWidget {
  final String image, title, type;
  final int price;


  const RecommendCupCard( { Key? key,
    required this.image,
    required this.title,
    required this.type,
    required this.price,

  }):super(key:key);
  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    return Container(
        margin: EdgeInsets.only(left:kDefaultPadding,top:kDefaultPadding/2, bottom: kDefaultPadding*2.5),
        width: size.width*0.4,
        child:Column(
          children: [
          GestureDetector(
          onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen(image:image,title:title, type:type, price:price)));  },
          child:   Image.asset("assets/images/pngsmall/"+image),
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
                              text: "$title\n".toUpperCase(),
                              style:Theme.of(context).textTheme.button),
                          TextSpan(
                              text: "$type".toUpperCase(),
                              style:TextStyle(color:kPrimaryColor.withOpacity(0.5))),
                        ])
                    ),
                    Spacer(),
                    Text("$price", style: Theme.of(context).textTheme.button?.copyWith(color: kPrimaryColor)),
                  ],
                ),
              ),

          ],
        ));
  }
}


