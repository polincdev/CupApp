
import 'package:flutter/material.dart';

import 'body.dart';
import 'bottom_bar.dart';
import 'constants.dart';

class HomeScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Body(),
      bottomNavigationBar: BottomBar(),

    );
  }

  _buildAppBar() {
  return AppBar(
  backgroundColor: kPrimaryColor,
  elevation: 0,
  leading: IconButton(icon: Icon(Icons.window), onPressed: () {  },),

  );
  }
}
