import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodcode/models/Food.dart';
import 'package:foodcode/models/SavedItems.dart';
import 'package:foodcode/widgets/buildAppBar.dart';

 class SavedItemsScreen extends StatefulWidget {
   SavedItemsScreen({@required this.title});
   static String routeName='savedScreen';
   final String title;
  @override
  _SavedItemsScreenState createState() => _SavedItemsScreenState();
}

class _SavedItemsScreenState extends State<SavedItemsScreen> {
  @override
  Widget build(BuildContext context) {
    return
     Scaffold(
        appBar:buildAppBar(title:'Saved Items'),
        body: (savedItems.length==0)?
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'No Saved Items',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.teal.shade700,
                ),
              ),
              SizedBox(height: 20,),
              Icon(Icons.favorite,color: Colors.grey.shade300,size: 100,),
              SizedBox(height: 20,),
              Text(
                'You don\'t have any saved items',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.teal.shade700,
                ),
              ),
            ],
          ),
        ):ListView.builder(
            itemCount: savedItems.length,
            itemBuilder: (context,index)
            {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 120.0,
                          height: 100.0,
                          child:(
                              Image.asset(
                                'assets/images/${savedItems[index].name}.jpg',
                                fit: BoxFit.cover,
                              )
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left:20.0,top:10),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(savedItems[index].name,
                                    style:TextStyle(
                                      fontSize: 18,
                                      color: Colors.teal.shade700,
                                    ) ,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right:140.0,top: 20),
                                child: Text(savedItems[index].price,
                                  style:TextStyle(
                                    fontSize: 15,
                                    color: Colors.teal.shade700,
                                  ) ,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom:70.0,right: 10,),
                          child: GestureDetector(child: Icon(CupertinoIcons.xmark,),onTap: (){
                            setState(() {
                              print('removed');
                              savedItems.removeAt(index);
                            });
                            Scaffold.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Product successfully removed from your saved items',
                                    style:TextStyle(fontSize: 15)),
                                behavior: SnackBarBehavior.floating,
                                margin: EdgeInsets.only(bottom:618.0), //730
                                backgroundColor: Colors.green.shade300,
                                duration: new Duration(milliseconds: 900),
                                //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                              ),
                            );

                          },),
                        ),
                      ],
                    ),
                  ),
                );
              }
        ),
    );
  }

}
