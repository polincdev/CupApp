import 'package:flutter/material.dart';
import 'constants.dart';

class DetailHeader  extends StatelessWidget{

  final String  image ;

  const DetailHeader( { Key? key,
    required this.image

  }):super(key:key);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(bottom: kDefaultPadding),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
           children:[

            Expanded(
                child: Container(
                  //color:Colors.green,
                  height: size.height*0.7,
                  child:   Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DetailIcon(icon:Icons.access_alarm_sharp, press: (){}),
                      DetailIcon(icon:Icons.analytics_outlined, press: (){}),
                      DetailIcon(icon:Icons.view_stream_sharp, press: (){}),
                      DetailIcon(icon:Icons.arrow_circle_down, press: (){}),
                      DetailIcon(icon:Icons.accessibility_sharp, press: (){}),

                    ],
                  ),

                )
            ),
            // Container(padding:EdgeInsets.symmetric(vertical: kDefaultPadding),color:Colors.red, height: size.height*0.6, width: size.width*0.8,),
            Container(
              height: size.height*0.7,
              width: size.width*0.7,
              decoration: BoxDecoration(
                color: Colors.black12,
                  boxShadow: [
                    BoxShadow(offset: Offset(0,10), color:kPrimaryColor.withOpacity(0.2), blurRadius: 60)
                  ],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(63),
                    bottomLeft: Radius.circular(63),
                  ),
                  image: DecorationImage(
                      image:AssetImage("assets/images/png/"+image),
                      fit: BoxFit.cover,
                      alignment: Alignment.centerLeft
                  )
              ),
            ),
          ]
      ),
    );
  }
}

/**/

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
          child:  Icon(icon,size:40),
          margin:EdgeInsets.only(top: kDefaultPadding, bottom: kDefaultPadding ), height: size.width*0.15, width: size.width*0.15
      ),
    );

  }



}