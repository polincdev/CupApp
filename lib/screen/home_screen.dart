
import 'package:cupapp/screen/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/body.dart';
import '../components/bottom_bar.dart';
import '../utils/constants.dart';

class HomeScreen extends StatelessWidget{

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
  IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>RegisterScreen()));}, icon:ClipOval(child: Image.asset("assets/images/polinc.png"))),
],
  );
  }
}
