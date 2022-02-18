import 'package:flutter/cupertino.dart';

class Food {
  final String categoryId;
  final String name;
  final String price;
  final int indx;

  Food({@required this.categoryId, @required this.name, @required this.price,@required this.indx});
}

List<Food> foodList = [
  Food(categoryId: '1', name: 'Chicken Ranch Pizza', price: '135 EGP',indx:1),
  Food(categoryId: '1', name: 'Margherita Pizza', price: '100 EGP',indx:2),
  Food(categoryId: '1', name: 'Pepperoni Pizza', price: '115 EGP',indx:3),
  Food(categoryId: '1', name: 'Smoky Cheese Pizza', price: '135 EGP',indx:4),
  Food(categoryId: '1', name: 'Tuna Pizza', price: '115 EGP',indx:5),
  Food(categoryId: '1', name: 'Chicken BBQ Pizza', price: '125 EGP',indx:6),
  Food(categoryId: '2', name: 'Seafood Soup', price: '65 EGP',indx:1),
  Food(categoryId: '2', name: 'Seafood Crepe', price: '55 EGP',indx:2),
  Food(categoryId: '2', name: 'Seafood Pizza', price: '120 EGP',indx:3),
  Food(categoryId: '2', name: 'Seafood Pasta', price: '142 EGP',indx:4),
  Food(categoryId: '2', name: 'Seafood Meal', price: '80 EGP',indx:5),
  Food(categoryId: '3', name: 'Cheese Burger', price: '50 EGP',indx:1),
  Food(categoryId: '3', name: 'Chicken Burger', price: '60 EGP',indx:2),
  Food(categoryId: '3', name: 'Mushroom Burger', price: '70 EGP',indx:3),
  Food(categoryId: '3', name: 'Steak Burger', price: '70 EGP',indx:4),
  Food(categoryId: '3', name: 'Beef Bacon Burger', price: '80 EGP',indx:5),
  Food(categoryId: '3', name: 'Italian Burger', price: '65 EGP',indx:6),
];
