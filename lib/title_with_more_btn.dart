import 'package:flutter/material.dart';

import 'constants.dart';

class TitleWithMoreBtn extends StatelessWidget{
  final String text;
  final VoidCallback press;
  const TitleWithMoreBtn( { Key? key,required this.text, required this.press}): super(key:key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(children:[
        TitleSubsection( text:text),
        Spacer(),
        FlatButton(
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color:kPrimaryColor,
            onPressed: press,
            child: Text("More", style:TextStyle(color: Colors.white)))
      ],
      ),
    );
  }
}


class TitleSubsection extends StatelessWidget{
  final String text;
  const TitleSubsection( { Key? key,required this.text}): super(key:key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 24,
      child:Stack(
        children: [
          Padding(
              padding: EdgeInsets.only(left:kDefaultPadding),
              child: Text(text, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
          ),
          Positioned(
              left:0,
              right: 0,
              bottom:0,
              child:Container(height: 7, color:kPrimaryColor.withOpacity(0.2),))
        ],
      ),
    );
  }

}