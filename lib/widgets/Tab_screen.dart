import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/catagories_page.dart';
import '../widgets/favourite_page.dart';
import '../widget_items/Drawer_item.dart';
import '../models/Meal_app.dart';
class TabScreen extends StatefulWidget {
  final List<Meal> favourite;
  TabScreen(this.favourite);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List pages;
  int selectedIndex=0;
  void selectedTab(int index){
    setState(() {
      selectedIndex=index;
    });
  }
  @override
  void initState() {
    pages=[{"page":Catagories_page(), "title":"Categories"},
      {"page":Favourite(widget.favourite),"title":"Favourites"}];

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(drawer: DrawerItem(),appBar: AppBar(title: Text(pages[selectedIndex]["title"])

      ),body: pages[selectedIndex]["page"],bottomNavigationBar: BottomNavigationBar(
      backgroundColor: Colors.blue,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.black,
      currentIndex: selectedIndex,
      type: BottomNavigationBarType.shifting
      ,onTap: selectedTab,
      items: [BottomNavigationBarItem(icon: Icon(Icons.local_dining),title:Text("Categories",),
        backgroundColor: Colors.blue,),

        BottomNavigationBarItem(icon: Icon(Icons.favorite),
            title: Text("Favourite"),backgroundColor: Colors.blue)],),);

  }
}
