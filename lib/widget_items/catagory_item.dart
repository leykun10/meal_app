import 'package:flutter/material.dart';
import '../widgets/meal_page.dart';
import '../widgets/catagories_page.dart';
class Catagory_item extends StatelessWidget {
  final String title;
  final Color color;
  final String id;

  Catagory_item({this.title,this.color,this.id});

  void navigate(ctx){
    Navigator.pushNamed(ctx,Catagories_page.route,arguments: {'title':title,"id":id});
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.deepOrange,
      onTap: (){
        navigate(context);},
      child: Container(
        padding: EdgeInsets.all(20),
          child: Text(title,style: Theme.of(context).textTheme.title,),decoration: BoxDecoration(gradient:
      LinearGradient(colors: [color.withOpacity(0.7),color],begin: Alignment.topLeft,end: Alignment.bottomLeft)
            ,borderRadius:BorderRadius.circular(15)),
      ),
    );

  }
}
