import 'package:cupapp/screen/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screen/choice_screen.dart';
import '../utils/constants.dart';

class BottomBar  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(
          left:kDefaultPadding*2,
          right:kDefaultPadding*2,


      ),
      height: size.width/5,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(offset: Offset(0,10), blurRadius:50, color:kPrimaryColor.withOpacity(0.30) )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(onPressed: (){}, icon: Icon(Icons.home, size:size.width/10 ,)),
          IconButton(
              onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>ChoiceScreen( ) )),
              icon: Icon(Icons.height,size:size.width/10 )),
          IconButton(
             onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>CartScreen( ) )),
             icon: Icon(Icons.add_shopping_cart_outlined,size:size.width/10 )),

        ],),

    );
  }
}