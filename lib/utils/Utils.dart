//ignore_for_file: prefer_const_constructors
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class Utils{
  static void showSnackbar(BuildContext context, String text){
    final snackBar = SnackBar(content: Text(text));

    ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(snackBar);
  }
static DateTime toDateTime(Timestamp value){

  return value.toDate();

}
  static dynamic fromDateTimeToJson(DateTime date) {

return date.toUtc();

  }





}