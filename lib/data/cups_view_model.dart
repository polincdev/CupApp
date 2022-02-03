import 'package:flutter/material.dart';
import '../net/firebase_api.dart';
import '../utils/constants.dart';
import '../dao/cup.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
class CupsViewModel extends ChangeNotifier{
  List<Cup> _cups=[];
  CupsViewModel(){
/*
    Cup cup= Cup(id:"1",image:"mug_red.png", title:"Mug",  type:"Red",  price:210, featured: true, recommended: true);
    _cups.add(cup);
    cup= Cup(id:"2",image:"mug_green.png", title:"Mug",  type:"Green",  price:10, featured: false, recommended: true);
    _cups.add(cup);
     cup= Cup(id:"3",image:"mug_blue.png", title:"Mug",  type:"Blue",  price:90, featured: true, recommended: false);
    _cups.add(cup);
     cup= Cup(id:"4",image:"cup_red.png", title:"Cup",  type:"Red",  price:120, featured: true, recommended: true);
    _cups.add(cup);
     cup= Cup(id:"5",image:"cup_green.png", title:"Cup",  type:"Green",  price:130, featured: false, recommended: true);
    _cups.add(cup);
     cup= Cup(id:"6",image:"cup_blue.png", title:"Cup",  type:"Blue",  price:140, featured: true, recommended: true);
    _cups.add(cup);
    cup= Cup(id:"7",image:"glass_red.png", title:"Glass",  type:"Red",  price:120, featured: false, recommended: false);
    _cups.add(cup);
    cup= Cup(id:"8",image:"glass_green.png", title:"Glass",  type:"Green",  price:145, featured: true, recommended: true);
    _cups.add(cup);
    cup= Cup(id:"9",image:"glass_blue.png", title:"Glass",  type:"Blue",  price:190, featured: false, recommended: true);
    _cups.add(cup);

 */
    Future<List<Cup>> data=FirebaseApi.getCups();
    data.then((List<Cup> values) => _cups.addAll(values));
  print("Cups="+_cups.length.toString());
  }
  

  List<Cup> get cups=> _cups;
  List<Cup> get cupsRecommended=>_cups.where((cup)=>cup.recommended==true ).take(3).toList();
  List<Cup> get cupsFeatured=>_cups.where((cup)=>cup.featured==true ).take(3).toList();
  List<Cup> get cupsCups=>_cups.where((cup)=>cup.title.toLowerCase().contains("cup") ).toList();
  List<Cup> get cupsMugs=>_cups.where((cup)=>cup.title.toLowerCase().contains("mug") ).toList();
  List<Cup> get cupsGlasses=>_cups.where((cup)=>cup.title.toLowerCase().contains("glass") ).toList();

     List<Cup>  prepareCupsList( QuerySnapshot<Map<String, dynamic>> querySnapshot )   {

    final allData = querySnapshot.docs.map((doc) =>Cup.fromJson(doc.data())).toList();
    // Get data from docs and convert map to List
    return  allData;

  }
 Future<QuerySnapshot<Map<String, dynamic>>> retrieveAllCups()   {
     return FirebaseApi.readAllCups();

    }
  Future<QuerySnapshot<Map<String, dynamic>>> retrieveRecommendedAllCups()   {
    return FirebaseApi.readRecommendedAllCups();

  }
  Future<QuerySnapshot<Map<String, dynamic>>> retrieveRecommendedSomeCups()   {
    return FirebaseApi.readRecommendedSomeCups();

  }
  Future<QuerySnapshot<Map<String, dynamic>>> retrieveFeaturedSomeCups()   {
    return FirebaseApi.readFeaturedSomeCups();

  }
  Future<QuerySnapshot<Map<String, dynamic>>> retrieveSearchCups(String searchWord)   {
    return FirebaseApi.retrieveSearchCups(  searchWord);

  }

}
