import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'constants.dart';
import 'cups_view_model.dart';
import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cup App',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        primaryColor: kPrimaryColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),

        //primarySwatch: Colors.blue,
      ),
      home:    ChangeNotifierProvider(
          create: (context) => CupsViewModel(),
          child: HomeScreen( )
      ),
    );
  }
}
