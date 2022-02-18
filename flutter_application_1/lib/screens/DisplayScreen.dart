import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:foodcode/models/Category.dart';
import 'package:foodcode/models/SavedItems.dart';
import 'package:foodcode/widgets/buildAppBar.dart';
import '';

import '../models/Food.dart';

class DisplayScreen extends StatefulWidget {
  DisplayScreen({key, @required this.title}) : super(key: key);
  final String title;
  static String routeName = 'displayScreen';
  @override
  _DisplayScreenState createState() => _DisplayScreenState();
}

class _DisplayScreenState extends State<DisplayScreen> {
  List<Food> categoryFood = [];
  Category category;
  AudioCache player = new AudioCache();
  void didChangeDependencies() {
    category = ModalRoute.of(context).settings.arguments as Category;
    categoryFood = foodList
        .where((element) => element.categoryId == category.categoryId)
        .toList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(title: category.categoryName),
        body: ListView.builder(
          itemCount: categoryFood.length,
          itemBuilder: (context, index) {
            return Container(
              height: 150,
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Container(
                    width: 100,
                    child: ClipRRect(
                      child: Image.asset(
                        'assets/images/${categoryFood[index].name}.jpg',
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.all(25),
                          child: Text(
                            categoryFood[index].name,
                            style: TextStyle(
                                fontSize: 20, color: Colors.teal.shade700),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(bottom: 10, left: 25),
                          child: Text(
                            categoryFood[index].price,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.orangeAccent,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  //favorite button
                  IconButton(
                      onPressed: () {
                        player.play('audios/Success.mp3');
                        setState(() {
                          //print('OKAY');
                          int indexOfFood;
                          bool found = false;
                          for (int i = 0; i < foodList.length; ++i) {
                            if (categoryFood[index].categoryId ==
                                    foodList[i].categoryId &&
                                (index + 1 == foodList[i].indx)) {
                              indexOfFood = i;
                              //print(foodList[indexOfFood].categoryId);
                              //print(foodList[indexOfFood].name);
                              //print(index+1);
                              break;
                            }
                          }
                          for (int i = 0; i < savedItems.length; ++i) {
                            if (foodList[indexOfFood].name ==
                                savedItems[i].name) {
                              found = true;
                              break;
                            }
                          }
                          if (found == false)
                            savedItems.add(Items(foodList[indexOfFood].name,
                                foodList[indexOfFood].price, true));
                          //for(int i=0; i<savedItems.length; ++i) print(savedItems[i]);
                          //print(savedItems.length);
                        });
                      },
                      icon: Icon(Icons.favorite))
                ],
              ),
            );
          },
        ));
  }
}
