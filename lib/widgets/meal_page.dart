import 'package:flutter/material.dart';
import '../models/Dummy_data.dart';
import '../models/Meal_app.dart';
import '../widget_items/meal_item.dart';
class Meal_page extends StatefulWidget {
  static final String route= "/recipe";
  final settings;
  final List<Meal> availableMeals;
  Meal_page(this.settings,this.availableMeals);

  @override
  _MealPageState createState() => _MealPageState();
}

class _MealPageState extends State<Meal_page> {
  String title;
  List<Meal> filtered;

  @override
  void initState() {
    final args=widget.settings.arguments;
    title=args["title"];
    final categoryId =args["id"];
    filtered= widget.availableMeals.where((element) => element.categories.contains(categoryId)).toList();
    // TODO: implement initState
    super.initState();
  }

  void removeItem(String value){
    setState(() {
     filtered.removeWhere((element) => element.id==value);
    });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(appBar: AppBar(title: Text(title),
    ),body:ListView.builder(itemBuilder:(context,index){
      return Meal_item(filtered[index].id,filtered[index].affordability, filtered[index].title,
          filtered[index].complexity, filtered[index].duration,filtered[index].imageUrl);
    }
    ,itemCount: filtered.length,),);
  }
}
