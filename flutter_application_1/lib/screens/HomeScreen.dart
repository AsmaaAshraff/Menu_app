import 'package:flutter/material.dart';
import 'package:foodcode/widgets/buildAppBar.dart';

import 'DisplayScreen.dart';
import '../models/Category.dart';
import 'SavedItem.dart';
//import 'SavedItem.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = 'homeScreen';
  HomeScreen({key, @required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(title: 'GOOD FOOD GOOD MOOD'),
        body: Column(children: [
          GridView.builder(
              shrinkWrap: true,
              reverse: false,
              padding: EdgeInsets.all(8),
              itemCount: 3,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1,
                crossAxisCount: 3,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
              ),
              itemBuilder: (context, index) {
                return gridItemChild(
                    title: categories[index].categoryName,
                    category: categories[index],
                    context: context);
              }),
          SizedBox(height: 20),
          Expanded(
              child: ListView(
            children: [
              Container(
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: AssetImage('assets/images/Pizzaa.jpg'),
                      fit: BoxFit.cover),
                ),
                margin: EdgeInsets.symmetric(horizontal: 10),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: AssetImage('assets/images/Hawkers.jpg'),
                      fit: BoxFit.cover),
                ),
                margin: EdgeInsets.symmetric(horizontal: 10),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: AssetImage('assets/images/Seafood Meal.jpg'),
                      fit: BoxFit.cover),
                ),
                margin: EdgeInsets.symmetric(horizontal: 10),
              )
            ],
          )),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new SavedItemsScreen(
                            title: 'saved',
                          )));
            },
            child: Icon(Icons.favorite),
          ),
          SizedBox(
            height: 10,
          )
        ]));
  }
}

Widget gridItemChild({String title, Category category, BuildContext context}) {
  return Center(
    child: GestureDetector(
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
              image: AssetImage('assets/images/${category.categoryName}.jpg'),
              fit: BoxFit.cover),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, DisplayScreen.routeName,
            arguments: category);
      },
    ),
  );
  //return SizedBox(
  //   width: 100,
  //   height: 100,
  //   child: ElevatedButton(
  //     onPressed: () {
  //       Navigator.pushNamed(context, DisplayScreen.routeName,
  //           arguments: category);
  //     },
  //     style: ElevatedButton.styleFrom(primary: Colors.orangeAccent),
  //     child: Text(
  //       title,
  //       textAlign: TextAlign.center,
  //       style: TextStyle(
  //           fontSize: 16,
  //           fontWeight: FontWeight.w600,
  //           color: Colors.teal.shade700),
  //     ),
  //   ),
  // );
}
