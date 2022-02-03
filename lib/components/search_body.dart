import 'package:cupapp/data/cups_view_model.dart';
import 'package:cupapp/screen/details_screen.dart';
import 'package:cupapp/screen/search_screen.dart';
import 'package:flutter/material.dart';
import '../dao/cup.dart';
import '../utils/constants.dart';
import '../components/details_body.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchBody extends StatelessWidget {

  final String searchWord;

  const SearchBody({required this.searchWord});

  @override
  Widget build(BuildContext context) {

    final cupsViewModel=Provider.of<CupsViewModel>(context,listen:false);
    Size size=MediaQuery.of(context).size;
    return Column(
      children: [
       _searchField(context,searchWord,cupsViewModel),
        _searchList(context,cupsViewModel),
      ],
    );
  }

  _searchField(BuildContext context, String searchWord, CupsViewModel cupsViewModel) {
    Size size=MediaQuery.of(context).size;
    TextEditingController controller=new TextEditingController(text: searchWord);
    controller.text;
    return  Container(padding:EdgeInsets.symmetric(vertical:kDefaultPadding),
       // color:Colors.red,
        height: size.width/4,width: double.infinity,
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          height: 54,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [BoxShadow(
                offset:  Offset(0,10),
                blurRadius: 50,
                color: kPrimaryColor.withOpacity(0.23)
            )],
          ),
          child: TextField(
           controller: controller,
            onChanged: (_){},
            onSubmitted: (searchWord)=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>
                Provider(
                    create: (context) => CupsViewModel(),
                    child: SearchScreen(searchWord: searchWord))
            ), ),

            style: TextStyle(fontSize: 20),
            decoration: InputDecoration(
              hintText: "Search",
              contentPadding: EdgeInsets.all(10),isDense: true,
              hintStyle: TextStyle(color:kTextColor.withOpacity(0.5)),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              suffixIcon: Icon(Icons.search, size: 32,),


            ),
          ),

        )
    );

  }

  _searchList(BuildContext context,CupsViewModel cupsViewModel) {

    Size size=MediaQuery.of(context).size;
    return Expanded(child: Container(
      //color:Colors.green,

      child:  FutureBuilder (
        future:cupsViewModel.retrieveSearchCups(searchWord) ,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.hasData) {
            List<Cup> cups=cupsViewModel.prepareCupsList(snapshot.data as QuerySnapshot<Map<String, dynamic>> );


            return  ListView.separated(

              itemCount:cups.length ,
              itemBuilder: (context, i) {
                return GestureDetector(
                   onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen(cup:cups[i])));  },
                   child: ListTile(
                  leading: SizedBox(
                      height: 50.0,
                      width: 50.0, // fixed width and height
                      child: Image.asset("assets/images/pngsmall/"+cups[i].image+".png", fit: BoxFit.fill,)
                  ),
                  title: Text(cups[i].title),
                  subtitle: Text(cups[i].type),
                  trailing:Text(cups[i].price.toString(), style:TextStyle(color: kPrimaryColor,fontWeight: FontWeight.bold,fontSize: 20)) ,
              ),
                );},
              separatorBuilder: (context, index) => Divider(
                color: kPrimaryColor,
              ),
            );

          }
          else if(snapshot.hasError)
            return Container(width:size.width,child: Center(child: Text("No data") ));
          else
            return  Container(width:size.width,child: Center(child: CircularProgressIndicator() ));
        },
      ),




    ));

  }

}