import 'package:cupapp/net/firebase_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../utils/constants.dart';
import '../dao/cup.dart';
import '../data/cups_view_model.dart';
import '../screen/details_screen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class RecommendedCups  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  final cupsViewModel=Provider.of<CupsViewModel>(context,listen:false);
  //  List<Cup> cups=cupsViewModel.cupsRecommended;
    Size size= MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: FutureBuilder (
        future:cupsViewModel.retrieveRecommendedSomeCups() ,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
               if(snapshot.hasData) {
                 List<Cup> cups=cupsViewModel.prepareCupsList(snapshot.data as QuerySnapshot<Map<String, dynamic>> );
                  return Row(children: cups.map((cup) =>   RecommendCupCard(cup: cup)).toList());
                // return Row(children:  cupsRecommended.map((cup) =>  RecommendCupCard( cup:cup  )).toList()  );
              }
              else if(snapshot.hasError)
                return Container(width:size.width,child: Center(child: Text("No data") ));
             else
                return  Container(width:size.width,child: Center(child: CircularProgressIndicator() ));
              },
           ),



    );
  }
}


Future<String> downloadURLSmallPng(String image)   {
  print("downloadURLSmallPng="+"assets/images/pngsmall/"+image+".png".toString());
  Future<String> downloadURL =   firebase_storage.FirebaseStorage.instance
      .ref("/assets/images/pngsmall/"+image+".png")
      .getDownloadURL();

   return downloadURL;
}
//
class RecommendCupCard extends StatelessWidget {

  final Cup cup ;

  const RecommendCupCard( { Key? key , required this.cup }): super(key:key);

  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    return Container(
        margin: EdgeInsets.only(left:kDefaultPadding,top:kDefaultPadding/2, bottom: kDefaultPadding*2.5),
        width: size.width*0.4,
        child:Column(
          children: [
          GestureDetector(
          onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen(cup:cup)));  },
          //child:   Image.asset("assets/images/pngsmall/"+cup.image+".png"),
            child: FutureBuilder (
              future:downloadURLSmallPng( cup.image) ,
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                print("IAMG="+snapshot.error.toString());

                if(snapshot.hasData) {

                  return Image.network(snapshot.data as String,fit: BoxFit.cover,loadingBuilder: (  context,   child,  loadingProgress){
                    if (loadingProgress == null) return child;

                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null ?
                        loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 0)
                            : null,
                      ),
                    );

                  },  );
                }

                else if(snapshot.hasError)
                  return Container(width:size.width,child: Center(child: Text("No data") ));
                else
                  return  Container(width:size.width,child: Center(child: CircularProgressIndicator() ));
              },
            ),


          ),
            Container(
                padding: EdgeInsets.all(kDefaultPadding),
                decoration: BoxDecoration(
                    color:Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    boxShadow:[BoxShadow(
                      offset:Offset(0,10),
                      blurRadius: 50,
                      color:kPrimaryColor.withOpacity(0.2),
                    )
                    ]
                ),
                child:Row(
                  children: [
                    RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "${cup.title}\n".toUpperCase(),
                              style:Theme.of(context).textTheme.button),
                          TextSpan(
                              text: "${cup.type}".toUpperCase(),
                              style:TextStyle(color:kPrimaryColor.withOpacity(0.5))),
                        ])
                    ),
                    Spacer(),
                    Text("${cup.price}", style: Theme.of(context).textTheme.button?.copyWith(color: kPrimaryColor)),
                  ],
                ),
              ),

          ],
        ));
  }
}


