import 'package:flutter/material.dart';
import '../net/firebase_api.dart';
import '../utils/constants.dart';
import '../dao/cup.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class CartViewModel extends ChangeNotifier{

  static List<Cup> cups=[];
  static addCup(Cup cup){cups.add(cup);}
  static removeCup(int index){cups.removeAt(index);}

}