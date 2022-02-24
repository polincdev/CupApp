
import 'package:flutter/material.dart';
import 'package:cupapp/utils/constants.dart';
import 'dart:math' as math;

class FiveScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
            leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.black,), onPressed: () { Navigator.pop(context) ;},),
          title:  Row(
            children: [
              SizedBox(   width:size.width/6 ,
                child:ClipRRect(
                    borderRadius:BorderRadius.circular(60),
                    child: Image.asset("assets/images/polinc.png")
                ),
            ),
              Padding(padding:EdgeInsets.only(left: 5, right: 5) , child: Container(   width: 15,height: 15,   decoration: BoxDecoration(shape: BoxShape.circle, color:Colors.green))),

              Text("Antony ", style: TextStyle(fontSize: 20, color: Colors.red, overflow:TextOverflow.ellipsis))

            ]
          ),
          actions: [
            Padding(
              padding: EdgeInsets.all(kDefaultPadding/4),
              child: Container(
                width:50 ,
                height:20 ,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius:BorderRadius.circular(10),
                  boxShadow: [BoxShadow(color: Colors.deepOrangeAccent,offset: Offset(1,1),blurRadius: 10,)]
                ),
                child: Icon(Icons.chat_bubble),
              ),
            )
          ],
        ),

        body: Expanded(child: Container(color:Colors.grey, width: size.width,
        child: Column(
            children:[
              Spacer(),
              Container( width: size.width, height:  size.height/2,
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              decoration: BoxDecoration(
                color:Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
              ),
              child:Stack(
               clipBehavior: Clip.none,
                children: [

                  Positioned(right: 0,  left:0, top:-50,
                      child:  Container(
                        child: Align(child:Container(   width: size.width/2,  height: size.width/2,
                            decoration: BoxDecoration(shape: BoxShape.circle,
                                color: Colors.orange
                            )
                        ),
                            ),
                      )
                  ),
                  Positioned(right: 0,  left:0, top:-50,
                      child:  Container(  width: size.width*0.45,  height: size.width*0.45,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                          child: Image.asset("assets/images/png/cup_red.png"))
                  ),

                  Positioned(right: 0,  left:0, bottom:50,
                      child:  Container(  width: size.width*0.45,  height: size.width*0.45,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                          child: Image.asset("assets/images/png/cup_red.png"))
                  ),
                ],
              )
              )
        ])
        ))

      ),
    );
  }
}