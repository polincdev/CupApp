import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../dao/cup.dart';
import 'details_header.dart';

class DetailsBody extends StatelessWidget{
  final Cup cup ;
  const DetailsBody( { Key? key , required this.cup }): super(key:key);


  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        //color:Colors.amberAccent,
         child: Padding(
          padding: EdgeInsets.only(top: kDefaultPadding*3),
          child: Column(

              children: [
                DetailHeader(image:cup.image),
               DetailInfo(cup:cup),
               SizedBox(  height: size.width/20),
                Container(
                  //color:Colors.pink,
                   alignment: Alignment.bottomCenter,
                  child: Row(
                    children: [
                      SizedBox(

                        width: size.width/2,
                        height: size.width/5,

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
                ),
              ]
          ),
        )

      ),
    );
  }

}

class DetailInfo  extends StatelessWidget{

  final Cup cup ;
  const DetailInfo( { Key? key , required this.cup }): super(key:key);


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
                     text:"${cup.title}\n".toUpperCase(),
                     style:Theme.of(context).textTheme.headline4?.copyWith(color: kTextColor,fontWeight: FontWeight.bold),
                   ),
                   TextSpan(
                     text:"${cup.type}\n".toUpperCase(),
                     style:Theme.of(context).textTheme.headline6?.copyWith(color: kPrimaryColor,fontWeight: FontWeight.w200),
                   ),
                 ]
             )
         ),
         Spacer(),
         Text("${cup.price} PLN", style: Theme.of(context).textTheme.headline5?.copyWith(color: kPrimaryColor,fontWeight: FontWeight.w200),),
       ],),
   );
  }
}
