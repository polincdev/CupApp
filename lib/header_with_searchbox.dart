
import 'package:flutter/material.dart';

import 'constants.dart';
class HeaderSearchbar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    return  Container(
        margin: EdgeInsets.only(bottom: kDefaultPadding*2.5),
        height: size.height*0.2,
        child: Stack(
            children: [
              _buildHeaderBG(size, context),
             _buildSearchbar(),

            ]
        ),
      );


  }

  _buildHeaderBG(Size size, BuildContext context) {

    return   Container(
      padding: EdgeInsets.only(
          left: kDefaultPadding,
          right: kDefaultPadding,
          bottom: 36+kDefaultPadding
      ),
      height: size.height*0.2-27,
      decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(36),
              bottomRight: Radius.circular(36)
          )),
      child: Row(
        children: [
          Text("Cup Shop App",
            style:Theme.of(context).textTheme.headline5?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          Spacer(),
          CircleAvatar(radius: 40,backgroundImage:  AssetImage("assets/images/polinc.png",),)

        ],
      ),
    );
  }


  _buildSearchbar() {
    return   Positioned(
        left:0,
        right:0,
        bottom: 0,
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          height: 54,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [BoxShadow(
                offset:  Offset(0,10),
                blurRadius: 50,
                color: kPrimaryColor.withOpacity(0.23)
            )],
          ),
          child: TextField(
            onChanged: (_){},
            style: TextStyle(fontSize: 20),
            decoration: InputDecoration(
              hintText: "Search",
              contentPadding: EdgeInsets.all(10),isDense: true,
              hintStyle: TextStyle(color:kTextColor.withOpacity(0.5)),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              suffixIcon: Icon(Icons.search, size: 32,),


            ),
          ),

        )
    );

  }

}