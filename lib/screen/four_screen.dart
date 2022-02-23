
import 'package:flutter/material.dart';
import 'package:cupapp/utils/constants.dart';
import 'dart:math' as math;


class FourScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(

      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HeadTitle(),
            Expanded(flex:4,child:   SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                TopBubbleOff(),
                                TopBubbleOn(),
                                TopBubbleOff(),
                                TopBubbleOff(),
                                ])

                        )),
            Expanded(child: Container(width:double.infinity, child: CommentTitle())),
            Expanded(child: Container(width:double.infinity, color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                        Image.asset("assets/images/pngsmall/cup_red.png" ),
                        Text("Felicia Cheung",style:TextStyle(color:Colors.black, fontSize: 15  ))
                    ],),
            )),
            Logos(),
            Expanded(flex:4, child: Padding(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Container(
                width: size.width*0.9,
                   decoration: BoxDecoration(
                    color: Colors.orange.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20),
                  ),
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                   Padding(
                     padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                       Text("Price", style:TextStyle(fontSize: 20)),
                       Text("\$200", style:TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
                     ],),
                   ),
                    ElevatedButton(onPressed: (){}, child: Text("Buy"),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange,
                      shape:StadiumBorder(),
                      padding:EdgeInsets.all(0),
                      fixedSize: Size(size.width*0.80, 50),
                    ),),
                  ],
                )
              ),
            )
            ),
            Spacer(flex: 1,)
          ],
        ),
      )


    );
  }

}

class Logos  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
  return Expanded(flex:2,child: Container(width:double.infinity, color: Colors.white,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[
            Padding(
              padding: EdgeInsets.all(kDefaultPadding/2),
              child: Container(
                width:size.width/4,  height:size.width/4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  image:DecorationImage(fit: BoxFit.fitWidth,image: AssetImage("assets/images/polinc.png"))  ,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(kDefaultPadding/2),
              child: Container(
                width:size.width/4,  height:size.width/4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  image:DecorationImage(fit: BoxFit.fitWidth,image: AssetImage("assets/images/polinc.png"))  ,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(kDefaultPadding/2),
              child: Container(
                width:size.width/4,  height:size.width/4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  image:DecorationImage(fit: BoxFit.fitWidth,image: AssetImage("assets/images/polinc.png"))  ,
                ),
              ),
            ),

          ]
      )
  ));
  }
}

class TopBubbleOff  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
        padding: EdgeInsets.all( kDefaultPadding/2 ),
        child: Container(
          width:size.width*0.33,
          decoration: BoxDecoration(
              color: Colors.orange.withOpacity(0.2),
              borderRadius: BorderRadius.all(Radius.circular(50))),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top:5),
                child: Container(  width:size.width*0.26,  height:size.width*0.26,
                  decoration: BoxDecoration(   color: Colors.white.withOpacity(0.5),  shape: BoxShape.circle ),
                  child: Image.asset("assets/images/pngsmall/cup_red.png" ),
                ),),
              Padding(
                padding: EdgeInsets.only(bottom:5),
                child: Container(  width:size.width*0.12,  height:size.width*0.12,
                  decoration: BoxDecoration( color: Colors.white.withOpacity(0.5),  shape: BoxShape.circle ),
                  child: IconButton(icon: Icon(Icons.add), onPressed: () {  },),
                ),
              ),
            ],
          ),
        )
    );
  }
}


class TopBubbleOn  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
        padding: EdgeInsets.all( kDefaultPadding/2 ),
        child: Container(
          width:size.width*0.33,
          decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.2),
              borderRadius: BorderRadius.only(
                  bottomLeft : Radius.circular(50),
                  bottomRight : Radius.circular(50),
                  topLeft : Radius.circular(50),
                  topRight : Radius.circular(10),
              )),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Padding(
                padding: EdgeInsets.only(top:5),
                child: Container(  width:size.width*0.26,  height:size.width*0.26,
                  decoration: BoxDecoration(   color: Colors.white.withOpacity(0.5),  shape: BoxShape.circle ),
                  child: Image.asset("assets/images/pngsmall/cup_red.png" ),
                ),),
              Padding(
                padding: EdgeInsets.only(bottom:5),
                child: Container(  width:size.width*0.12,  height:size.width*0.12,
                  decoration: BoxDecoration( color: Colors.white.withOpacity(0.5),  shape: BoxShape.circle ),
                  child: IconButton(icon: Icon(Icons.delete), onPressed: () {  },),
                ),
              ),
            ],
          ),
        )
    );
  }
}

class HeadTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return Expanded(child: Container(width:double.infinity,
       child: Padding(
         padding: EdgeInsets.only(left:kDefaultPadding, top:kDefaultPadding/4, ),
         child: Text("Topping", style:TextStyle(color:Colors.orange, fontSize: 35, fontWeight: FontWeight.bold
         )),
       )
   ));
  }
}


class CommentTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(width:double.infinity,
        child: Padding(
          padding: EdgeInsets.only(left:kDefaultPadding, top:kDefaultPadding/4, ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Text("Topping", style:TextStyle(color:Colors.orange, fontSize: 35, fontWeight: FontWeight.bold  )),
              FlatButton(onPressed: (){}, child: Text("More",style:TextStyle(color:Colors.black, fontSize: 15, fontWeight: FontWeight.bold  )))
              ]
          ),
          ),
        )
    );
  }
}