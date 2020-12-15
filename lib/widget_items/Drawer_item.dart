import 'package:flutter/material.dart';
import 'package:mealapp/widgets/Filtered.dart';
import 'package:mealapp/widgets/catagories_page.dart';
import '../models/Dummy_data.dart';
import '../models/Meal_app.dart';

class DrawerItem extends StatefulWidget {

  @override
  _DrawerItemState createState() => _DrawerItemState();
}

class _DrawerItemState extends State<DrawerItem> {

  List<Meal> availaible_meals;
  Map<String, Function> savedFilter;
  Map<String,bool> filter = {
    "gluten_free":false,
    "lactose_free":false,
    "vegan":false,
    "vegetarian":false
  };
  void saveFilter(filters){
    setState(() {
      filter=filters;
      availaible_meals =DUMMY_MEALS.where((element){
        if(filter["gluten_free"] && !element.isGlutenFree){
          return false;
        }
        if(filter["lactose_free"] && !element.isLactoseFree){
          // ignore: missing_return
          return false;
        }
        if(filter["vegan"] && !element.isVegan){
          // ignore: missing_return
          return false;
        }
        if(filter["vegetarian"] && !element.isVegetarian){
          // ignore: missing_return
          return false;
        }

        return true;
      });
    });
  }


  void navigate(BuildContext context,String route){
  Navigator.pushReplacementNamed(context, route);

  }

  @override
  Widget build(BuildContext context) {
    return Drawer(child: Column(
      children: <Widget>[
        SafeArea(
          child: Container(
            padding: EdgeInsets.only(left: 20,top: 25),
            width:double.infinity,
            color: Colors.amberAccent,
            height: 100, child:
            Text("Cooking Up",style: TextStyle(fontSize: 40),),
            ),
        ),SizedBox(height: 20,),
      ListTile(onTap:(){
        navigate(context,"/");

      } ,leading: Icon(Icons.restaurant_menu),title: Text("Meals",style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),),
        ListTile(onTap:(){
          navigate(context, Filtered.route);
        } ,leading: Icon(Icons.settings),title: Text("Filters",style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold)),)],
    ),);
  }
}
