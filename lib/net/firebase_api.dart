import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dummycastle/pl/polinc/dummycastle/dummycastle.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../dao/cup.dart';


class FirebaseApi{

  static Future<QuerySnapshot<Map<String, dynamic>>> readAllCups() async {
     Future<QuerySnapshot<Map<String, dynamic>>> data= FirebaseFirestore.instance.collection('cups').get();
    return data;

  }
  static Future<QuerySnapshot<Map<String, dynamic>>> readRecommendedAllCups() async {
    Future<QuerySnapshot<Map<String, dynamic>>> data= FirebaseFirestore.instance.collection('cups')
        .where('recommended', isEqualTo: true)
        .orderBy("id", descending: true)
         .get();
    return data;

  }
  static Future<QuerySnapshot<Map<String, dynamic>>> readRecommendedSomeCups() async {
    Future<QuerySnapshot<Map<String, dynamic>>> data= FirebaseFirestore.instance.collection('cups')
        .limit(3)
        .where('recommended', isEqualTo: true)
        .orderBy("id", descending: true)
        .get();
    return data;

  }

  static Future<QuerySnapshot<Map<String, dynamic>>> readFeaturedSomeCups() async {
    Future<QuerySnapshot<Map<String, dynamic>>> data= FirebaseFirestore.instance.collection('cups')
        .limit(3)
        .where('featured', isEqualTo: false)
        .orderBy("id", descending: true)
        .get();
    return data;

  }

  static Future<QuerySnapshot<Map<String, dynamic>>> retrieveSearchCups(String  searchWord) async {
    Future<QuerySnapshot<Map<String, dynamic>>> data= FirebaseFirestore.instance.collection('cups')
        .limit(3)
        .where('tags', arrayContains: searchWord)
        .orderBy("id", descending: true)
        .get();
    return data;

  }
  static Future<List<Cup>> getCups() async {
    Future<QuerySnapshot<Map<String, dynamic>>>  data=readAllCups();

    QuerySnapshot<Map<String, dynamic>> querySnapshot = await data;
     final allData = querySnapshot.docs.map((doc) =>Cup.fromJson(doc.data())).toList();
    // Get data from docs and convert map to List
    return  allData;

  }







}