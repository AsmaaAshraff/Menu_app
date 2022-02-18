import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Category {
  @required
  final String categoryId;
  @required
  final String categoryName;

  Category({this.categoryId, this.categoryName});
}

List<Category> categories = [
  Category(categoryId: '1', categoryName: 'Pizza'),
  Category(categoryId: '2', categoryName: 'Seafood'),
  Category(categoryId: '3', categoryName: 'Burger'),
];
