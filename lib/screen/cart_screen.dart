import 'package:cupapp/components/cart_bottom_bar.dart';
import 'package:cupapp/components/search_body.dart';
import 'package:cupapp/data/cart_view_model.dart';
import 'package:cupapp/utils/Utils.dart';
import 'package:flutter/material.dart';
import '../dao/cup.dart';
import '../utils/constants.dart';
import '../components/details_body.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  // final cartViewModel=Provider.of<CartViewModel>(context,listen:false);
  //  final cartViewModel= context.read<CartViewModel>();

    return Scaffold(

      body: CartBody(),
      bottomNavigationBar: CartBottomBar(),
    );
  }

}

class CartBody  extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return CartBodyState();
  }

}

class CartBodyState extends State {
  @override
  Widget build(BuildContext context) {
   return Container(
     //color:Colors.red,
     child: ListView.separated(

       itemCount:CartViewModel.cups.length ,
       itemBuilder: (context, i) {
         return Dismissible(

           key: Key(CartViewModel.cups[i].key),
           onDismissed: (direction) {
             // Remove the item from the data source.
             Utils.showSnackbar( context, "Deleted "+CartViewModel.cups[i].title );
             CartViewModel.removeCup(i);

           },

           child: ListTile(
             leading: SizedBox(
                 height: 50.0,
                 width: 50.0, // fixed width and height
                 child: Image.asset("assets/images/pngsmall/"+CartViewModel.cups[i].image+".png", fit: BoxFit.fill,)
             ),
             title: Text(CartViewModel.cups[i].title),
             subtitle: Text(CartViewModel.cups[i].type),
             trailing:Text(CartViewModel.cups[i].price.toString(), style:TextStyle(color: kPrimaryColor,fontWeight: FontWeight.bold,fontSize: 20)) ,
           ),
         );

       },
       separatorBuilder: (context, index) => Divider(
         color: kPrimaryColor,
       ),
     ),




   );


  }
}