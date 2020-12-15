import '../widget_items/catagory_item.dart';
import 'package:flutter/material.dart';
import '../models/Dummy_data.dart';
class Catagories_page extends StatelessWidget {

static final String route= "/catagories";
  @override
  Widget build(BuildContext context) {
    return  GridView(
        padding: const EdgeInsets.all(25),
        children: DUMMY_CATEGORIES.map((item) =>
          Catagory_item(title: item.title,color: item.color,id:item.id)).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent
        (maxCrossAxisExtent: 200,childAspectRatio: 1.5,crossAxisSpacing: 20,mainAxisSpacing: 20
      ),);
  }
}


