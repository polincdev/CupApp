import 'package:flutter/material.dart';
import 'constants.dart';
import 'details_header.dart';

class DetailsBody extends StatelessWidget{

  final String  image,  title, type;
  final int price;

  const DetailsBody( { Key? key,
    required this.image,
    required this.title,
    required this.type,
    required this.price,

  }):super(key:key);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Container(
      //color:Colors.amberAccent,
      child: Padding(
        padding: EdgeInsets.only(top: kDefaultPadding*3),
        child: Column(
            children: [
              DetailHeader(image:image),
             DetailInfo(title:title, type:type, price:price),
              SizedBox(height:20),
              Row(
                children: [
                  SizedBox(
                    width: size.width/2,height: 80,
                     child:FlatButton(
                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(20))),
                      color: kPrimaryColor,
                      onPressed: () {  },
                      child: Text("BUY", style: Theme.of(context).textTheme.headline5,),
                     ),
                    ),
                  Expanded(
                      child: FlatButton(
                        color: Colors.white,
                        onPressed: () {Navigator.pop(context) ; },
                        child: Text("Back", style: Theme.of(context).textTheme.headline5,),
                      ),)

                ],),
            ]
        ),
      )

    );
  }

}

class DetailInfo  extends StatelessWidget{

  final String   title, type;
  final int price;

  const DetailInfo( { Key? key,
     required this.title,
    required this.type,
    required this.price,

  }):super(key:key);



  @override
  Widget build(BuildContext context) {
   return   Padding(
     padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
     child: Row(
       children: [
         RichText(
             text: TextSpan(
                 children: [
                   TextSpan(
                     text:"$title\n".toUpperCase(),
                     style:Theme.of(context).textTheme.headline4?.copyWith(color: kTextColor,fontWeight: FontWeight.bold),
                   ),
                   TextSpan(
                     text:"$type\n".toUpperCase(),
                     style:Theme.of(context).textTheme.headline6?.copyWith(color: kPrimaryColor,fontWeight: FontWeight.w200),
                   ),
                 ]
             )
         ),
         Spacer(),
         Text("$price PLN", style: Theme.of(context).textTheme.headline5?.copyWith(color: kPrimaryColor,fontWeight: FontWeight.w200),),
       ],),
   );
  }
}
