import 'dart:io';

import 'package:flutter/material.dart';
class RecipeItem extends StatelessWidget {
  final List<String> ingredient,steps;
  RecipeItem(this.steps,this.ingredient);
  Widget showsteps(steps){


    return Container(
      margin: EdgeInsets.fromLTRB(0, 3, 40, 0),
      width: 300,
      child: Card(
        elevation: 4,
        child: Container(
          width: 300,
          height: 120,
          child: ListView.builder(itemBuilder: (context,index){
          return ListTile(leading: CircleAvatar(backgroundColor: Colors.purple,child: Text("${index+1}"),),title: Text(steps[index],
            style: TextStyle(fontSize: 20),),);
        },itemCount: steps.length,)
        ,),
      ),
    );
  }
  Widget showingredient(List ingredient){
    return Card( elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.fromLTRB(0,20, 0,0),width: 300,height:150,child: ListView.builder(itemBuilder: (context,index){
        return Card(
            elevation: 2,
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              color: Colors.redAccent,
              child: Text('${ingredient[index]}',style:TextStyle(fontSize: 20),),));
      },itemCount: ingredient.length,),),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(children: <Widget>[Card(
        shadowColor: Colors.black54,
        child: Image.asset("Assets/images/pexels-photo-2911521.jpeg",fit: BoxFit.cover
          ,height: 200,width: double.infinity,),
      ),SizedBox(height: 30,child:
      Text("Ingredients",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),),showingredient(ingredient)
        ,SizedBox(height:40,child: Text("Steps",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),),showsteps(steps)
      ],),
    );
  }
}
