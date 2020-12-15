import 'package:flutter/material.dart';
import 'package:mealapp/models/Dummy_data.dart';
import 'package:mealapp/models/Meal_app.dart';
import 'widgets/Tab_screen.dart';
import 'widgets/catagories_page.dart';
import 'widgets/Filtered.dart';
import 'widgets/meal_page.dart';
import 'widgets/recipe_page.dart';
import 'widgets/Error_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _availableMeals =DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];


  Map<String, bool> filters = {
    'glutenFree': false,
    'lactoseFree': false,
    'vegan': false,
    'vegetarian': false,
  };



  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      filters = filterData;
      _availableMeals = DUMMY_MEALS.where((element) {
        if(filters["glutenFree"] && !element.isGlutenFree){

          return false;
        }
        if(filters["lactoseFree"] && !element.isLactoseFree){
          return false;
        }
        if(filters["vegan"] && !element.isVegan){
          return false;
        }
        if(filters["vegetarian"] && !element.isVegetarian){

          return false;
        }

        return true;
      }).toList();
    });
  }

  void toggleFavourite(String mealId){
    int existingIndex=_favoriteMeals.indexWhere((element) => element.id==mealId);

    if(existingIndex>=0){
      setState(() {
         _favoriteMeals.removeAt(existingIndex);
      });
    }

    else{

      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((element) => element.id==mealId));
      });
    }

  }
  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal app',
      theme: ThemeData(
        // This is the theme of your application.
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.amberAccent,
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(body1: TextStyle(color: Colors.black),body2:
        TextStyle(color: Colors.black),title: TextStyle(fontFamily: "RobotoCondensed",fontSize: 22,fontWeight: FontWeight.bold),),

        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
      ),
      onGenerateRoute: (settings){
        if (settings.name=='/'){
          return MaterialPageRoute(builder: (BuildContext context)=>TabScreen(_favoriteMeals));
        }
        else if(settings.name==Catagories_page.route){

          return MaterialPageRoute(builder: (BuildContext context)=>Meal_page(settings,_availableMeals));

        }
        else if(settings.name==Meal_page.route){
          return MaterialPageRoute(builder: (BuildContext context)=>Recipe(settings.arguments,toggleFavourite,_isMealFavorite));
        }
        else if(settings.name==Filtered.route){

          return MaterialPageRoute(builder: (BuildContext context)=>Filtered(_setFilters,filters));
        }
        return MaterialPageRoute(builder: (BuildContext context)=>Error());

      },

    );
  }
}

