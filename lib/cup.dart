
class Cup{

  final String title;
  final String type;
  final int price;
  final String image;
  final bool recommended;
  final bool featured;

  const Cup({required this.title,
    required this.type,
    required this.price,
    required this.recommended,
    required this.featured,
    required this.image});

 factory Cup.toJson(Map<String, dynamic> json){
   return Cup(
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