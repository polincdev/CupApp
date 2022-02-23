import 'package:cupapp/utils/constants.dart';
import 'package:flutter/material.dart';

import '../components/movable_cup.dart';
import 'dart:math' as math;

import '../components/path_painter.dart';
import '../dao/cup.dart';

class TwoScreen extends StatelessWidget{

  List<Cup> _cups=[];

  TwoScreen(){
    Cup cup= Cup(id:"1",image:"mug_red.png", title:"Mug",  type:"Red",  price:210, featured: true, recommended: true);
    _cups.add(cup);
    cup= Cup(id:"2",image:"mug_green.png", title:"Mug",  type:"Green",  price:10, featured: false, recommended: true);
    _cups.add(cup);
    cup= Cup(id:"3",image:"mug_blue.png", title:"Mug",  type:"Blue",  price:90, featured: true, recommended: false);
    _cups.add(cup);
    cup= Cup(id:"4",image:"cup_red.png", title:"Cup",  type:"Red",  price:120, featured: true, recommended: true);
    _cups.add(cup);
    cup= Cup(id:"5",image:"cup_green.png", title:"Cup",  type:"Green",  price:130, featured: false, recommended: true);
    _cups.add(cup);
    cup= Cup(id:"6",image:"cup_blue.png", title:"Cup",  type:"Blue",  price:140, featured: true, recommended: true);
    _cups.add(cup);
    cup= Cup(id:"7",image:"glass_red.png", title:"Glass",  type:"Red",  price:120, featured: false, recommended: false);
    _cups.add(cup);
    cup= Cup(id:"8",image:"glass_green.png", title:"Glass",  type:"Green",  price:145, featured: true, recommended: true);
    _cups.add(cup);
    cup= Cup(id:"9",image:"glass_blue.png", title:"Glass",  type:"Blue",  price:190, featured: false, recommended: true);
    _cups.add(cup);
    cup= Cup(id:"10",image:"glass_blue.png", title:"Glass",  type:"Blue",  price:190, featured: false, recommended: true);
    _cups.add(cup);
  }
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
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[
                      Container(padding:EdgeInsets.only(top: kDefaultPadding*2),width:double.infinity,height: size.height/5,
                      child:Align(alignment:Alignment.center,child: Text("More toppings,\n more delicious!",textAlign: TextAlign.center, style:Theme.of(context).textTheme.headline5)),
                      ),
                      Container(/*color:Colors.grey,*/width:double.infinity,height: size.height/2,
                      child:
                      Stack(
                          children:[

                          ListView.builder(
                              padding:EdgeInsets.only(top:0),
                              itemCount:_cups.length,
                              itemBuilder: (context, index){
                                return ListTile(
                                    leading: Image.asset("assets/images/pngsmall/"+_cups[index].image),
                                    title:  Align(alignment:Alignment.centerLeft,child: Column(children:[ Text(_cups[index].type),Text(_cups[index].title)])),
                                   //  trailing: Text(_cups[index].price.toString(), style: TextStyle( color: Colors.black,fontSize: 15),),

                                );
                              }),
                            Positioned(top:120,right:-size.width/2,child: Container(   width:150,height:150,child: CustomPaint(painter: PathPainter()))) ,
                            Positioned(top:20,right:-size.width/3,child: Image.asset("assets/images/png/cup_red.png", width: size.width*0.7,)),

                          ]
                      ),

                      ),

                 Container(
                     height:size.height/5,width:size.width*0.90,
                     child: Align(alignment:Alignment.center,
                         child: ElevatedButton(
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                             Padding(padding:EdgeInsets.symmetric(horizontal: kDefaultPadding),child: Text("View the basket")),
                            Padding(padding:EdgeInsets.only(right: kDefaultPadding),child: Text("\12"))
                           ]),
                           style:ElevatedButton.styleFrom(

                               fixedSize: Size(size.width*0.80, 50),
                               padding:EdgeInsets.all(0),
                               shape: StadiumBorder())
                           , onPressed: () {  }
                           ,))),


            ]
          ),
        ),
      ),
    );
  }



}