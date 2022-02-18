import 'package:flutter/cupertino.dart';
import 'package:foodcode/models/Food.dart';

class Items{
    String name;
    String price;
    bool isFound;

  Items(this.name, this.price,this.isFound);
   get namee => name;
   get pricee => price;
   get f => isFound;

}

List<Items>savedItems=[
  //Items(foodList[0].name,'123',false),
];
