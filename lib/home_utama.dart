import 'package:flutter/material.dart';
import 'package:cfm/tabs/first.dart';
import 'package:cfm/tabs/second.dart';
import 'package:cfm/tabs/third.dart';
import 'package:cfm/home_page.dart';
import 'package:cfm/tabs/listview_product.dart';


void main() {
  runApp(new MaterialApp(
      // Title
      title: "Using Tabs",
      // Home
      home: new HomeUtama()));
}

class HomeUtama extends StatefulWidget {
   static String tag = 'home-utama';
  @override
  MyHomeState createState() => new MyHomeState();
}

// SingleTickerProviderStateMixin is used for animation
class MyHomeState extends State<HomeUtama> with SingleTickerProviderStateMixin {

  //  int _selectedTab = 0;
    // final _pageOptions = [
    //     SecondTab(),
    //     SecondTab(),
    //     SecondTab(),
    // ];

    
  // Create a tab controller
  TabController controller;

  @override
  void initState() {
    super.initState();

    // Initialize the Tab Controller
    controller = new TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
       appBar: AppBar(
        leading: Icon(
          Icons.home,
          color: Colors.black87,
        ),
      // Appbar
     
        // Title
        title: new Text("Work Request"),
        // Set the background color of the App Bar
        backgroundColor: Colors.white,
         bottom: new TabBar(
          controller: controller,
          tabs: <Widget>[
             new Tab(text: "Outstanding",),


            new Tab(text: "Completed"), 


            new Tab(text: "Disapprove"),
          ]
        )
      ),
      // Set the TabBar view as the body of the Scaffold
      body: new TabBarView(
        // Add tabs as widgets
        children: <Widget>[new ListViewProduct(), new SecondTab(), new ThirdTab()],
        
        // set the controller
        controller: controller,
      ),
      // // Set the bottom navigation bar
      // bottomNavigationBar: new Material(
      //   // set the color of the bottom navigation bar
      //   color: Colors.white,
      //   // set the tab bar as the child of bottom navigation bar
      //   child: new TabBar(
      //     tabs: <Tab>[
      //       new Tab(
      //         // set icon to the tab
      //         icon: new Icon(Icons.home),
      //       ),
      //       new Tab(
      //         icon: new Icon(Icons.business),
      //       ),
      //       new Tab(
      //         icon: new Icon(Icons.account_circle),
      //       ),
      //     ],
      //     // setup the controller
      //     controller: controller,
      //   ),
      // ),

        bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), title: Text("Company")),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), title: Text("Account")),
        ],
        // onTap: (int i)=>debugPrint('Tapped $i'),
      ),












      
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.yellow,
      //   tooltip: 'Add Something',
      //   onPressed: () {
      //     Navigator.of(context).pushNamed(HomePage.tag);
      //   },
      //   child: Icon(Icons.add),
         
      // ),
    );
  }
}
