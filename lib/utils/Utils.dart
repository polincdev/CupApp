//ignore_for_file: prefer_const_constructors
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';

import '../components/recommended_cups.dart';
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
  static loadImage(String image, Size size) {
    return FutureBuilder (
      future:downloadURLSmallPng(  image) ,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if(snapshot.hasData) {
          return Image.network(snapshot.data as String,fit: BoxFit.cover,loadingBuilder: (  context,   child,  loadingProgress){
            if (loadingProgress == null)
              return child;
            else
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null ?
                  loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 0)  : null,
                ),
              );
          },  );
        }
        else if(snapshot.hasError)
          return Container(width:size.width,child: Center(child: Text("No data") ));
        else
          return  Container(width:size.width,child: Center(child: CircularProgressIndicator() ));
      },
    );
  }

  static Future<String> downloadURLSmallPng(String image)   {
   // print("downloadURLSmallPng="+"assets/images/pngsmall/"+image+".png".toString());
    Future<String> downloadURL =   firebase_storage.FirebaseStorage.instance
        .ref("/assets/images/pngsmall/"+image+".png")
        .getDownloadURL();

    return downloadURL;
  }


  static Future<File> getFileFromAssets(String path) async {
    final byteData = await rootBundle.load('assets/$path');

    final file = File('${(await getTemporaryDirectory()).path}/$path');
    await file.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return file;
  }

  static Future<ByteBuffer> getFileDataFromAssets(String path) async {
    final byteData = await rootBundle.load(path);

    return byteData.buffer;
  }


}