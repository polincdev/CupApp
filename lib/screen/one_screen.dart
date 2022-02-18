import 'package:cupapp/utils/constants.dart';
import 'package:flutter/material.dart';

import '../components/movable_cup.dart';
import 'dart:math' as math;

class OneScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
   return Scaffold(
     extendBodyBehindAppBar: true,
     appBar: AppBar(
       leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.black,), onPressed: () =>Navigator.pop(context)),
       backgroundColor: Colors.transparent,
       elevation: 0,
     ),
     body: Column(
         children: [
          Header(),

         ],
       ),

   );
  }




}

class Header extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
   return  Container(
     width:size.width,height:size.height,
    // color:Colors.blueAccent,
     child: Column(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
       mainAxisSize: MainAxisSize.max,
       children: [

         Container(
         width:size.width,height:size.height*0.4,
         child: Stack(
             children:[
               Positioned(top:120,left:150,child: Container(   width:150,height:150,child: CustomPaint(painter: PathPainter()))) ,
               Align(alignment:Alignment.center,child: Image.asset("assets/images/png/cup_red.png", width: size.width*0.7,)),
             ]
         ),

       ),

         Container(
          // color: Colors.yellowAccent,
           child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
               crossAxisAlignment: CrossAxisAlignment.center,
               mainAxisSize: MainAxisSize.max,
               children:[
                  Text("\$12", style: Theme.of(context).textTheme.headline4?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),),
                  Padding(padding:EdgeInsets.symmetric(vertical: kDefaultPadding/2),child: Text("Beef Pho", style: Theme.of(context).textTheme.headline5?.copyWith(color: Colors.black),)),
                  Padding(padding:EdgeInsets.all( kDefaultPadding),child: Text("A traditional Vietnamese soup made of beaf with rice noodeles., herbs including onions, ginger, sinamon.",textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.black),)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(width: 10, height: 10,decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.orange),),
                      Padding(padding:EdgeInsets.symmetric(horizontal: kDefaultPadding/2),child: Text("514 kCal", style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.black),)),
                     Container(width: 10, height: 10,decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.orange),),

                    ],),

               ]
           ),
         ),
         Container(
          // color:Colors.deepPurple,
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             mainAxisSize: MainAxisSize.max,
             children: [

               SizedBox(height:50,width:size.width*0.45,child: OutlinedButton(onPressed: (){}, child: Text("Extra topping"), style:OutlinedButton.styleFrom(shape:StadiumBorder()))),
               SizedBox(height:50,width:size.width*0.45,child: ElevatedButton(onPressed: (){}, child: Text("Add to basket"), style:OutlinedButton.styleFrom(padding:EdgeInsets.all(0),shape:StadiumBorder()))),

             ],
           ),
         ),
      ]
     ),
   );
  }
}

class PathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    final angle = -math.pi / 4;
    Color paintColor = Colors.orange.withOpacity(0.75);
    Paint circlePaint = Paint()
      ..color = paintColor
      ..style = PaintingStyle.fill
      ..strokeWidth = 5;

    canvas.save();
    // canvas.translate(100, 100);
    canvas.rotate(angle);
    canvas.drawOval(Rect.fromCenter(center: Offset.zero, width: 155, height: 170), circlePaint);
   canvas.restore();

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}