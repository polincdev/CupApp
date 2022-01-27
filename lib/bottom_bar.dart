import 'package:flutter/material.dart';

import 'constants.dart';

class BottomBar  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left:kDefaultPadding*2,
          right:kDefaultPadding*2,
          bottom:kDefaultPadding
      ),
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(offset: Offset(0,10), blurRadius:50, color:kPrimaryColor.withOpacity(0.30) )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(onPressed: (){}, icon: Icon(Icons.pan_tool)),
          IconButton(onPressed: (){}, icon: Icon(Icons.height)),
          IconButton(onPressed: (){}, icon: Icon(Icons.album)),

        ],),

    );
  }
}