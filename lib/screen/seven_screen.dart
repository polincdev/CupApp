
import 'package:flutter/material.dart';
import 'package:cupapp/utils/constants.dart';
import 'dart:math' as math;

class SevenScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
   return SafeArea(
     child: Scaffold(
       body: Column(
         children:[
           Expanded(
                child: Center(
                 child: TweenAnimationBuilder(
                   tween:Tween(begin:0.0, end: 1.0),
                   duration: Duration(seconds: 10),
                   builder: (context,double val, child)=>  SizedBox(
                     width: size.width/3,  height:  size.width/3,
                     child: Stack(
                          children: [
                            Align(alignment: Alignment.center,child: Text((val*100).toInt().toString())),
                             SizedBox(
                             width: size.width/3,  height:  size.width/3,
                                 child: CircularProgressIndicator(
                                   strokeWidth: 8,
                                   value: val,
                                   backgroundColor: Colors.grey,
                                 ),),

                       ]

                     ),
                   ),


                 ),
               ),

           ),
           Spacer(),

         ]
       ),
     ),
   );
  }

}
