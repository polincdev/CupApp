import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
 
import 'constants.dart';

class RecommendedCups  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children:[
          RecommendCupCard(
              image:"assets/images/pngsmall/cup_red.png",
              title:"Cup",
              type:"Red",
              price:110,
              press:(){}),
          RecommendCupCard(
              image:"assets/images/pngsmall/cup_blue.png",
              title:"Cup",
              type:"Blue",
              price:90,
              press:(){}),
          RecommendCupCard(
              image:"assets/images/pngsmall/cup_green.png",
              title:"Cup",
              type:"Green",
              price:100,
              press:(){}),

        ],
      ),
    );
  }
}
//
class RecommendCupCard extends StatelessWidget {
  final String image, title, type;
  final int price;
  final VoidCallback press;

  const RecommendCupCard( { Key? key,
    required this.image,
    required this.title,
    required this.type,
    required this.price,
    required this.press,
  }):super(key:key);
  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    return Container(
        margin: EdgeInsets.only(left:kDefaultPadding,top:kDefaultPadding/2, bottom: kDefaultPadding*2.5),
        width: size.width*0.4,
        child:Column(
          children: [
            Image.asset(image),
            GestureDetector(
              onTap: press,
              child: Container(
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
            )
          ],
        ));
  }
}


