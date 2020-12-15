import 'package:flutter/material.dart';
import '../widget_items/Drawer_item.dart';

class Filtered extends StatefulWidget {
  static final route="/filter";
  final Function saveFilters;
  final Map<String, bool>currentFilters;
  Filtered(this.saveFilters,this.currentFilters);

  @override
  _FilteredState createState() => _FilteredState();
}

class _FilteredState extends State<Filtered> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;
  @override
  void initState() {
    _glutenFree = widget.currentFilters['glutenFree'];
    _lactoseFree = widget.currentFilters['lactoseFree'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    super.initState();
  }

  Widget buildSwitchListTile(bool value,String title,String subtitle,Function update){

    return SwitchListTile(value: value,onChanged: update,title: Text(title,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
      subtitle: Text('$subtitle',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.lightGreen,drawer: DrawerItem(),
        appBar: AppBar(actions: <Widget>[IconButton(icon: Icon(Icons.save), onPressed:(){
          final selectedFilters = {
            "glutenFree":_glutenFree,
            "lactoseFree":_lactoseFree,
            "vegan":_vegan,
            "vegetarian":_vegetarian,
          };
         widget.saveFilters(selectedFilters);
        }
    )],title:Text("filtered"),),
        body: Column(children: <Widget>[Container(
          padding:EdgeInsets.all(40)
          ,child: Text("Adjust your meal selection",style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),),
         Expanded(child: ListView(children: <Widget>[buildSwitchListTile(_glutenFree, "Gluten free", "Only gluten free meals",(value){
           setState(() {
             _glutenFree=value;
           });
         }),
           buildSwitchListTile(_lactoseFree, "Lactose free", "Only gluten free meals",(value){
             setState(() {
               _lactoseFree=value;
             });
           }),
           buildSwitchListTile(_vegan, " Vegan", "Only Vegan meals",(value){
             setState(() {
              _vegan=value;
             });
           }),
           buildSwitchListTile(_vegetarian, "Vegetarian", "Only Vegetarian meals",(value){
             setState(() {
               _vegetarian=value;
             });
           })],),)],)  );
  }
}
