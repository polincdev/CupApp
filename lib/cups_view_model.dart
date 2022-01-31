import 'package:flutter/material.dart';
import 'constants.dart';
import 'cup.dart';

class CupsViewModel extends ChangeNotifier{
  List<Cup> _cups=[];
  CupsViewModel(){

    Cup cup= Cup(image:"mug_red.png", title:"Mug",  type:"Red",  price:210, featured: true, recommended: true);
    _cups.add(cup);
    cup= Cup(image:"mug_green.png", title:"Mug",  type:"Green",  price:10, featured: false, recommended: true);
    _cups.add(cup);
     cup= Cup(image:"mug_blue.png", title:"Mug",  type:"Blue",  price:90, featured: true, recommended: false);
    _cups.add(cup);
     cup= Cup(image:"cup_red.png", title:"Cup",  type:"Red",  price:120, featured: true, recommended: true);
    _cups.add(cup);
     cup= Cup(image:"cup_green.png", title:"Cup",  type:"Green",  price:130, featured: false, recommended: true);
    _cups.add(cup);
     cup= Cup(image:"cup_blue.png", title:"Cup",  type:"Blue",  price:140, featured: true, recommended: true);
    _cups.add(cup);
    cup= Cup(image:"glass_red.png", title:"Glass",  type:"Red",  price:120, featured: false, recommended: false);
    _cups.add(cup);
    cup= Cup(image:"glass_green.png", title:"Glass",  type:"Green",  price:145, featured: true, recommended: true);
    _cups.add(cup);
    cup= Cup(image:"glass_blue.png", title:"Glass",  type:"Blue",  price:190, featured: false, recommended: true);
    _cups.add(cup);
  }
  

  List<Cup> get cups=> _cups;
  List<Cup> get cupsRecommended=>_cups.where((cup)=>cup.recommended==true ).take(3).toList();
  List<Cup> get cupsFeatured=>_cups.where((cup)=>cup.featured==true ).take(3).toList();
  List<Cup> get cupsCups=>_cups.where((cup)=>cup.title.toLowerCase().contains("cup") ).toList();
  List<Cup> get cupsMugs=>_cups.where((cup)=>cup.title.toLowerCase().contains("mug") ).toList();
  List<Cup> get cupsGlasses=>_cups.where((cup)=>cup.title.toLowerCase().contains("glass") ).toList();



}
