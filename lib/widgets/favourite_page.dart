import 'package:flutter/material.dart';
import '../models/Meal_app.dart';
import '../widget_items/meal_item.dart';
class Favourite extends StatelessWidget {
  final List<Meal> favourite;

  Favourite(this.favourite);
  @override
  Widget build(BuildContext context) {
    if(favourite.isEmpty)
      return Container(child: Text("no favourite meals"),);
    else{
      return ListView.builder(itemBuilder:(context,index){
        return Meal_item(favourite[index].id,favourite[index].affordability, favourite[index].title,
            favourite[index].complexity, favourite[index].duration,favourite[index].imageUrl);
      }
        ,itemCount: favourite.length,);}
  }
}
