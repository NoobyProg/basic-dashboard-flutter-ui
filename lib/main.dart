import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Used to remove Debug Mode Banner from Screen
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: ListView(
        children: <Widget>[
          // _top() function defined on line 190
          _top(),
          SizedBox(height: 20,),
          // Creates a row to display text in a horizontal way
          Padding(
              padding: EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Category",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                Text(
                  "View All",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),
          // Grid to contain all the icons and text
          Container(
            height: 200,
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 3/2),
              children: <Widget>[
                // _gridItem() function defined at line 168
                _gridItem(Icons.airport_shuttle, "Travel"),
                _gridItem(Icons.add_shopping_cart, "Shopping"),
                _gridItem(Icons.arrow_drop_down_circle, "More"),
                _gridItem(Icons.bluetooth_searching, "Devices"),
                _gridItem(Icons.add_location, "Maps"),
                _gridItem(Icons.arrow_drop_down_circle, "More"),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: <Widget>[
                Text(
                  "Latest",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          //_cardItem() function defined at line 114
          _cardItem(1),
        ],
      ),
    );
  }
}

// Used to create a card that contains an image and text
_cardItem(image){
  return Padding(
      padding: EdgeInsets.all(16), child: Row(
    children: [
      // Container for the Image
      Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage("https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
            fit: BoxFit.cover,
          ),
          // Gives the Image a circular border
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      SizedBox(height: 20,),
      // Displays text in a vertical manner
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Brother's Graduations",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
          ),
          SizedBox(height: 10,),
          Padding(padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "15 items",
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          ),
          SizedBox(height: 10,),
          Padding(padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "by Hawkins",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
          ),)
        ],
      ),
    ],
  ),
  );
}

// Used to create an Item in the grid with specified icon and text
_gridItem(icon, text){
  return Column(
    children: [
      CircleAvatar(
        child: Icon(
          icon,size: 16,
          color: Colors.white,
        ),
        backgroundColor: Colors.deepOrange.withOpacity(0.9),
      ),
      SizedBox(height: 10,),
      Text(
        text,
        style: TextStyle(
          fontSize: 11
        ),
      ),
    ],
  );
}

// Creates the top area of the page
_top(){
  return Container(
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.deepOrange,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(30),
        bottomRight: Radius.circular(30),
      )
    ),
    child: Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage("https://cdn4.iconfinder.com/data/icons/circle-avatars-1/128/042_girl_avatar_profile_woman_shirt-2-512.png"),
                ),
                SizedBox(width: 10,),
                Text("Hi, Hawkins", style: TextStyle(color: Colors.white),),
              ],
            ),
            IconButton(
                onPressed: (){}, // Placeholder, can be implemented
                icon: Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
            ),
          ],
        ),
        SizedBox(height: 30,),
        // Creates the Search TextField
        TextField(
          decoration: InputDecoration(
            hintText: "Search",
            fillColor: Colors.white,
            filled: true,
            suffixIcon: Icon(Icons.search),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            contentPadding:
              EdgeInsets.symmetric(horizontal: 16, vertical: 16)
          ),
        ),
      ],
    ),
  );
}