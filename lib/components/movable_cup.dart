import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class MovableCup  {

  late AnimatedPositioned positioned;
  double left=-1, right=-1, top=-1, bottom=-1;
  int index=-1;
  double scale=1;
  MovableCup(Function refresh, Size size, double iconWidth, String image, String pos){

    if(pos=="topLeft"){
      left=0;
      top=0;
      index=0;
    }
   else  if(pos=="topCenter"){
      left=(size.width/2-iconWidth/2-kDefaultPadding);
      top=0;
      index=1;
    }
    else  if(pos=="topRight"){
      left=(size.width-iconWidth-kDefaultPadding*2);
      top=0;
      index=2;
    }
    if(pos=="bottomLeft"){
      left=0;
      top=(size.height-iconWidth*2-kDefaultPadding);
      index=3;
    }
    else  if(pos=="bottomCenter"){
      left=(size.width/2-iconWidth/2-kDefaultPadding);
      top=(size.height-iconWidth*2-kDefaultPadding);
      index=4;
    }
    else  if(pos=="bottomRight"){
      left=(size.width-iconWidth-kDefaultPadding*2);
      top=(size.height-iconWidth*2-kDefaultPadding);
      index=5;
    }
    else  if(pos=="center"){
      scale=scale*2;
      top=(size.height/2-iconWidth/2-kDefaultPadding*2);
      left=(size.width/2-iconWidth/2-kDefaultPadding);

      index=6;
    }
    positioned=AnimatedPositioned(duration: Duration(seconds: 1),
        left:left>-1?left:null,
        top:top>-1?top:null,
        right:right>-1?right:null,
        bottom:bottom>-1?bottom:null,
        child:    GestureDetector(onTap: (){refresh(index);}, child: AnimatedScale(duration: Duration(seconds: 1), scale:scale,child: Image.asset("assets/images/pngsmall/"+image, width:iconWidth  ))));




  }

}
