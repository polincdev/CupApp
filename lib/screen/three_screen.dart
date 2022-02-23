
import 'package:flutter/material.dart';
import 'package:cupapp/utils/constants.dart';
import 'dart:math' as math;


class ThreeScreen extends StatelessWidget{

  int stars=3;
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(icon: Icon(Icons.grid_4x4), onPressed: () {  },),
          actions: [
            IconButton(icon: Icon(Icons.close), onPressed: () { Navigator.pop(context); },),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children:[ Stack(
            children: [
             ClippedHeaderBG(),
              Positioned(top:20,right:-size.width/3,child: Image.asset("assets/images/png/cup_red.png", width: size.width*0.7,)),
              Positioned(top:size.width*0.15,left:size.width/10,child: DetailIcon(icon:Icons.access_alarm_sharp, press: (){})),
              Positioned(top:size.width*0.35,left:size.width/10,child: DetailIcon(icon:Icons.analytics_outlined, press: (){})),

            ]
          ),
            Padding(padding:EdgeInsets.symmetric(horizontal: kDefaultPadding),child: Text("Ocean Delight", style:TextStyle(fontSize: 40, color: Colors.deepOrangeAccent, fontWeight: FontWeight.bold))),
            Padding(padding:EdgeInsets.only( left: kDefaultPadding, right:kDefaultPadding, top:kDefaultPadding/2, bottom: kDefaultPadding/2),
              child: Container(  width:size.width, height:size.width*0.1,
                  child: ListView.builder(scrollDirection: Axis.horizontal, itemCount:5,itemBuilder: (context, index){return Image.asset("assets/images/pngsmall/cup_red.png", width: size.width*0.1,height: size.width*0.1,color:index>=stars?Colors.grey:null,);})),
            ),
            Padding(padding:EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Container(  width:size.width, height:size.width*0.1,
                  child: Text("Shrimps, Mashrooms, RedOnions,Mayo, Garlic, Cherry Tomato")
            )),
          Clicker(),
            Padding(padding:EdgeInsets.symmetric(horizontal: kDefaultPadding),child: Text("Size", style:TextStyle(fontSize: 30, color: Colors.deepOrangeAccent, fontWeight: FontWeight.bold))),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(padding:EdgeInsets.symmetric(horizontal: kDefaultPadding/3),
                  child: Container(  width:size.width/5, height:size.width/5,
                       child:Align(alignment: Alignment.center,child:Text("S", style:TextStyle(fontSize: 20, color: Colors.white, ))),
                       decoration: BoxDecoration(   color:Colors.orange,    shape: BoxShape.circle,   ),  )),

                Padding(padding:EdgeInsets.symmetric(horizontal: kDefaultPadding/3),
                    child: Container(  width:size.width/5, height:size.width/5,
                      child:Align(alignment: Alignment.center,child:Text("M", style:TextStyle(fontSize: 20, color: Colors.white, ))),
                      decoration: BoxDecoration(   color:Colors.orange,    shape: BoxShape.circle,   ),  )),

                Padding(padding:EdgeInsets.symmetric(horizontal: kDefaultPadding/3),
                    child: Container(  width:size.width/5, height:size.width/5,
                      child:Align(alignment: Alignment.center,
                        child: Container(  width:size.width/7, height:size.width/7,
                            decoration: BoxDecoration(   color:Colors.white.withOpacity(0.4),    shape: BoxShape.circle,   ),
                            child: Align(alignment: Alignment.center,child:Text("X", style:TextStyle(fontSize: 20, color: Colors.white, )))),
                      ),
                      decoration: BoxDecoration(   color:Colors.orange,    shape: BoxShape.circle,   ),  )),

                Padding(padding:EdgeInsets.symmetric(horizontal: kDefaultPadding/3),
                    child: Container(  width:size.width/5, height:size.width/5,
                      child:Align(alignment: Alignment.center,child:Text("S", style:TextStyle(fontSize: 20, color: Colors.white, ))),
                      decoration: BoxDecoration(   color:Colors.orange,    shape: BoxShape.circle,   ),  )),

              ]
            ),
          ]

        )
      ),
    );
  }

}

class Clicker extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return   Align(
      alignment: Alignment.centerRight,
      child: Padding(padding:EdgeInsets.symmetric(horizontal:   kDefaultPadding),
          child: Container(  width:size.width*0.45, height:size.width*0.15,
            decoration: BoxDecoration(
                color:Colors.orange,
                borderRadius: BorderRadius.circular(25)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left:5),
                  child: Container(  width:size.width*0.12, height:size.width*0.12,  decoration: BoxDecoration(
                      color:Colors.deepOrange,
                      shape: BoxShape.circle
                  ),
                    child: IconButton(icon: Icon(Icons.add), onPressed: () {  },),
                  ),
                ),
                Text("1", style: TextStyle(fontSize: 20, color: Colors.white),),
                Padding(
                  padding: EdgeInsets.only(right:5),
                  child: Container(  width:size.width*0.12, height:size.width*0.12,  decoration: BoxDecoration(
                      color:Colors.deepOrange,
                      shape: BoxShape.circle
                  ),
                    child: IconButton(icon: Icon(Icons.remove), onPressed: () {  },),
                  ),
                ),

              ],),
          )),
    );
  }
}

class DetailIcon extends StatelessWidget{
  final icon;
  final VoidCallback press;
  const DetailIcon( { Key? key , required this.icon, required this.press});
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return   GestureDetector(
      onTap: press,
      child: Container(
          decoration:BoxDecoration(
            color:Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow:[BoxShadow(offset: Offset(2,5),blurRadius: 20,color: kPrimaryColor)],

          ),
          child:  Icon(icon,size:size.width*0.10),
          margin:EdgeInsets.only(top: kDefaultPadding, bottom: kDefaultPadding ), height: size.width*0.12, width: size.width*0.12
      ),
    );

  }



}

class ClippedHeaderBG  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
   return  ClipPath(
     clipper: BackgroundWaveClipper(),

     child: Container(
       width: size.width,
       height: size.height*0.35,
       decoration: BoxDecoration(
         gradient: LinearGradient(
             colors: [
               Colors.orange,
               Colors.deepOrangeAccent
             ]),
       ),
     ),
   );
  }
}

class BackgroundWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);
   // path.lineTo(size.width, size.height - 80);
    final controlPoint = Offset(size.width * 0.4, size.height);
    final endPoint = Offset(size.width, size.height / 3);
    path.quadraticBezierTo(controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);


    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return oldClipper != this;
  }
}