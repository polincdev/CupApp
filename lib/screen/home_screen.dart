
import 'package:cupapp/screen/register_screen.dart';
import 'package:cupapp/screen/seven_screen.dart';
import 'package:cupapp/screen/six_screen.dart';
import 'package:cupapp/screen/three_screen.dart';
import 'package:cupapp/screen/two_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/body.dart';
import '../components/bottom_bar.dart';
import '../utils/constants.dart';
import 'five_screen.dart';
import 'four_screen.dart';
import 'one_screen.dart';

class HomeScreen extends StatelessWidget{
  var myMenuItems = <String>['One', 'Two', 'Three', 'Four', 'Five', 'Six', 'Seven'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Body(),
      bottomNavigationBar: BottomBar(),

    );
  }

  _buildAppBar(BuildContext context) {
  return AppBar(
  backgroundColor: kPrimaryColor,
  elevation: 0,
  leading: IconButton(icon: Icon(Icons.window), onPressed: () {  },),
actions: [
  Padding(
      padding: EdgeInsets.only(right: 20.0),
      child: IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>RegisterScreen()));}, icon:ClipOval(child: Image.asset("assets/images/polinc.png")))),
 

  Padding(
    padding: EdgeInsets.only(right: 20.0),
    child: PopupMenuButton<String>(
        itemBuilder: (BuildContext context) {
                  return myMenuItems.map((String choice) {
                  return PopupMenuItem<String>(
                  child: Text(choice),
                  value: choice,
                  );
                  }
                  ).toList();
            },
      onSelected: (item) {
          switch (item) {
          case 'One':
          Navigator.push(context, MaterialPageRoute(builder: (_)=>OneScreen()));
          break;
          case 'Two':
         Navigator.push(context, MaterialPageRoute(builder: (_)=>TwoScreen()));
          break;
            case 'Three':
               Navigator.push(context, MaterialPageRoute(builder: (_)=>ThreeScreen()));
              break;
         case 'Four':
              Navigator.push(context, MaterialPageRoute(builder: (_)=>FourScreen()));
              break;

         case 'Five':
              Navigator.push(context, MaterialPageRoute(builder: (_)=>FiveScreen()));
          break;
            case 'Six':
              Navigator.push(context, MaterialPageRoute(builder: (_)=>SixScreen()));
              break;
            case 'Seven':
              Navigator.push(context, MaterialPageRoute(builder: (_)=>SevenScreen()));
              break;
          case 'Setting':
          print('Setting clicked');
          break;
          }
      },
    ),
  )

],
  );
  }
}
