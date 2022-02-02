
import 'dart:math';

class Cup{
  final String id;
  final String title;
  final String type;
  final int price;
  final String image;
  final bool recommended;
  final bool featured;

  const Cup({
    required this.id,
    required this.title,
    required this.type,
    required this.price,
    required this.recommended,
    required this.featured,
    required this.image});


 factory Cup.fromJson(Map<String, dynamic> json){
   return Cup(
     id: json['id'],
     title: json['title'],
     type: json['type'],
     price: json['price'],
     recommended: json['recommended'],
     featured: json['featured'],
     image: json['image'],
   );
 }
    Map<String, dynamic> toJson(){
       return {
         'id': id,
         'title': title,
         'type': type,
         'price': price,
         'image': image,
         'recommended': recommended,
         'featured': featured,
         'title': title,

       };

    }


}