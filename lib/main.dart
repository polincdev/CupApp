import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'utils/constants.dart';
import 'data/cups_view_model.dart';
import 'screen/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'net/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());

 /* runApp(
  MultiProvider(
    providers: [
       //Provider(create: (_) => CupsViewModel()),
    ],
    child: MyApp(),
  ),);
*/

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
        inputDecorationTheme: InputDecorationTheme(
            border:textFieldBorder,
            enabledBorder:  textFieldBorder,
          focusedBorder:  textFieldBorder,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: kPrimaryColor,
            padding: EdgeInsets.all(kDefaultPadding)
          ),
        )
        //primarySwatch: Colors.blue,
      ),
      home:    ChangeNotifierProvider(
          create: (context) => CupsViewModel(),
          child: HomeScreen( )
      ),
    );
  }
}
