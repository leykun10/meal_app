import 'package:mealapp/widgets/meal_page.dart';

import '../widget_items/recipe_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/Dummy_data.dart';
class Recipe extends StatelessWidget {

  final Function toggleFavourite;
  final Function isFavourite;

  final Map<String,Object> arguments;
  Recipe(this.arguments,this.toggleFavourite,this.isFavourite);
  @override
  Widget build(BuildContext context) {
    final String id= arguments["id"];
    final Meal= DUMMY_MEALS.firstWhere((element) =>element.id==id);
    final ingredient=Meal.ingredients;
    final steps=Meal.steps;
    return Scaffold(floatingActionButton: FloatingActionButton(onPressed: (){
      toggleFavourite(id);
    },
      child: isFavourite(id)?Icon(Icons.star):Icon(Icons.star_border),),appBar:
    AppBar(title: Text("recipe"),),
      body: RecipeItem(steps,ingredient),);
  }
}
