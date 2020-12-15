import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../models/Meal_app.dart';
import '../widgets/meal_page.dart';


class Meal_item extends StatelessWidget {
  final String id;
  final String title;
  final String imageurl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;


  Meal_item(this.id,this.affordability,this.title,
  this.complexity,this.duration,this.imageurl);
 String get complex {
   switch(complexity){

     case Complexity.Simple:
       return 'Simple';
       break;
     case Complexity.Challenging:
       return 'Challenging';
       break;
     case Complexity.Hard:
       return 'Hard';
     break;
   }
 }
 String get affordable {
   switch(affordability){
     case Affordability.Affordable:
       return "affordable";
     case Affordability.Luxurious:
       return "luxurious";
     case Affordability.Pricey:
       return "pricey";
   }
 }
  void navigate(ctx){
    Navigator.pushNamed(ctx,Meal_page.route,arguments: {'title':title,"id":id});

  }
  @override
  Widget build(BuildContext context) {
    return InkWell(onTap:(){
      navigate(context);}
      ,child:
    Card(elevation: 4,child:Column(children: <Widget>[
     Stack(
       children: <Widget>[ ClipRRect(borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
       child: Image.asset("Assets/images/pexels-photo-2911521.jpeg",height: 250,width: double.infinity,
         fit: BoxFit.cover,),),Positioned(
           bottom: 20,
           right: 0,
           child: Container(
             padding: EdgeInsets.all(10),

               width: 220,
               color: Colors.black54,child: Text(title,style: TextStyle(color: Colors.white,fontSize: 30),softWrap: true,overflow: TextOverflow.fade,)))],)
   , Padding(padding: EdgeInsets.all(20),child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: <Widget>[Row(children: <Widget>[Icon(Icons.timer),SizedBox(width: 10,),Text("${duration}")],),
        Row(children: <Widget>[Icon(Icons.work),SizedBox(width: 10,),Text("${complex}")],),
        Row(children: <Widget>[Icon(Icons.attach_money),SizedBox(width: 10,),Text("${affordable}")],)],),)],)
      ,margin: EdgeInsets.all(10),shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15)),),);
  }
}
