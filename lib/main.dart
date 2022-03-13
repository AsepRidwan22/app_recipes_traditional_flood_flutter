import 'dart:ui';

import 'package:app_recipes_traditional_flood_flutter/menus/home.dart';
import 'package:flutter/material.dart';

import 'menus/search_screen.dart';
import 'menus/favorite.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // primarySwatch: Colors.blue,
          ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  List title = ['Home', 'Search', 'Favorit', 'Profile']; //Judul buat App Bar
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    SearchScreen(),
    FavoriteScreen(),
    Center(
      child: Text(
        'Gak Keburu',
        style: optionStyle,
      ),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false, //agar tidak berubah saat pakai keyboard
      extendBody: true,
      backgroundColor: Colors.white,
      drawer: DrawerWidget(),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: size <= 600 ? _buildBottomNavigationBar() : null,
    );
  }

  //widget bottom navigation bar
  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      unselectedFontSize: 0,
      selectedFontSize: 0,
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey.withOpacity(0.5),
      showUnselectedLabels: false,
      showSelectedLabels: false,
      backgroundColor: Colors.white,
      elevation: 0, //ketebalan shadow
      items: [
        BottomNavigationBarItem(title: Text('Home'), icon: Icon(Icons.home)),
        BottomNavigationBarItem(
            title: Text('Favorit'), icon: Icon(Icons.search)),
        BottomNavigationBarItem(
            title: Text('Search'), icon: Icon(Icons.favorite)),
        BottomNavigationBarItem(
            title: Text('Profile'), icon: Icon(Icons.account_circle))
      ],
      onTap: (index) {
        _onItemTapped(index);
      },
    );
  }
}

class BuildBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _drawerHeader(),

          //maaf listTile nya berulang karena kalau pake widget ontapnya jadi gak jalan
          ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return HomeScreen();
              }));
            },
            leading: Icon(
              Icons.home,
              color: Colors.black,
            ),
            title: Text('Home'),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SearchScreen();
              }));
            },
            leading: Icon(
              Icons.search,
              color: Colors.black,
            ),
            title: Text('Search'),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return FavoriteScreen();
              }));
            },
            leading: Icon(
              Icons.favorite,
              color: Colors.black,
            ),
            title: Text('Favorite'),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SearchScreen();
              }));
            },
            leading: Icon(
              Icons.account_circle,
              color: Colors.black,
            ),
            title: Text('Profil'),
          )
        ],
      ),
    );
  }
}

Widget _drawerHeader() {
  return Container(
    child: Image.asset(
      '../images/Banner2.jpg',
      fit: BoxFit.cover,
    ),
  );
}
