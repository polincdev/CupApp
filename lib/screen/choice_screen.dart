import 'package:cupapp/utils/constants.dart';
import 'package:flutter/material.dart';

import '../components/movable_cup.dart';


class ChoiceScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ChoiceScreenState();
  }
  
}

class ChoiceScreenState  extends State<StatefulWidget> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<Color?> _colorTween;
  int selected=0;
  refresh(int selected){
    setState(() { this.selected=selected;  });
  }

  @override
  void initState() {
     super.initState();
     _controller=AnimationController(vsync: this, duration: Duration(seconds: 3));
     _controller.repeat(reverse: true);
      _colorTween= ColorTween(begin: Colors.deepOrange.withOpacity(0.2), end:Colors.deepPurple.withOpacity(0.2)).animate(_controller);
  }

  @override
  void dispose() {
   _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    var iconWidth=size.width/3.5;
   return Scaffold(
   appBar: AppBar(
     backgroundColor: Colors.white,
     leading: IconButton(icon:Icon(Icons.arrow_back, color: Colors.black), onPressed: () { Navigator.pop(context); },),
   ),
     body:Padding(
       padding: EdgeInsets.all(kDefaultPadding),
       child:
       Stack(
         children: [


           Align(
             alignment: Alignment.center,
             child: AnimatedBuilder(
                 animation:_controller,
                 child: Container(width:200, height:200,decoration: BoxDecoration(   color:_colorTween.value, shape: BoxShape.circle),),
                 builder:(context, child){  return Transform.scale(scale:1+_controller.value/10, child:child); },

       ),
           ),

           Align(
             alignment: Alignment.center,
             child: AnimatedBuilder(
               animation:_controller,
               builder:(context, child){
                 return   Container(width:300, height:300,decoration: BoxDecoration(   color:_colorTween.value, shape: BoxShape.circle),);
               },

             ),
           ),

          // AnimatedPositioned(duration: Duration(seconds: 1), left:0, top:0,  bottom: null, child:    Image.asset("assets/images/pngsmall/cup_red.png", width:iconWidth  )),
           MovableCup(refresh,size, iconWidth,"cup_red.png", selected==0?"center":"topLeft").positioned,
         //  AnimatedPositioned(duration: Duration(seconds: 1), left:(size.width/2-iconWidth/2-kDefaultPadding), top:0,  bottom: null,child:Image.asset("assets/images/pngsmall/cup_blue.png", width:iconWidth )),
           MovableCup(refresh,size, iconWidth,"cup_blue.png", selected==1?"center":"topCenter").positioned,
          // AnimatedPositioned(duration: Duration(seconds: 1), right:0, top:0,  bottom: null,child:Image.asset("assets/images/pngsmall/cup_green.png", width:iconWidth )),
           MovableCup(refresh,size, iconWidth,"cup_green.png", selected==2?"center":"topRight").positioned,
           //
           //Positioned(top: 0, bottom: 0,left:(size.width/2-(iconWidth*4)/2-kDefaultPadding) ,child:Image.asset("assets/images/pngsmall/mug_green.png", width:iconWidth*4 )),
          // MovableCup(size, iconWidth,"cup_green.png", "center").positioned,

           //
          // AnimatedPositioned(duration: Duration(seconds: 1), left:0, bottom:0,top:null, child:   Image.asset("assets/images/pngsmall/mug_red.png", width:iconWidth  )),
           MovableCup(refresh,size, iconWidth,"mug_red.png", selected==3?"center":"bottomLeft").positioned,
         //  AnimatedPositioned(duration: Duration(seconds: 1), left:(size.width/2-iconWidth/2-kDefaultPadding), bottom:0,top:null,child:Image.asset("assets/images/pngsmall/mug_blue.png", width:iconWidth )),
           MovableCup(refresh,size, iconWidth,"mug_blue.png", selected==4?"center":"bottomCenter").positioned,
          // AnimatedPositioned(duration: Duration(seconds: 1), right:0, bottom:0,top:null,child:Image.asset("assets/images/pngsmall/mug_green.png", width:iconWidth )),
           MovableCup(refresh,size, iconWidth,"mug_green.png", selected==5?"center":"bottomRight").positioned,


         ]



       ),
     ),
   );
  }
}