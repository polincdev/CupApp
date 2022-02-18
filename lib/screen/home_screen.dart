
import 'package:cupapp/screen/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/body.dart';
import '../components/bottom_bar.dart';
import '../utils/constants.dart';
import 'one_screen.dart';

class HomeScreen extends StatelessWidget{
  var myMenuItems = <String>['Home', 'Profile', 'Setting', 'Privacy', 'Contact'];
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
          case 'Profile':
         Navigator.push(context, MaterialPageRoute(builder: (_)=>TwoScreen()));
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
