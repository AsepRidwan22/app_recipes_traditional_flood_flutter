import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'list/list_food.dart';
import '../main.dart';
import 'detail_food.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double size = MediaQuery.of(context).size.width;
        return Scaffold(
          appBar: size > 600
              ? AppBar(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  centerTitle: true,
                  title: Text(
                    'Favorite',
                    style: TextStyle(color: Colors.black),
                  ),
                )
              : null,
          drawer: DrawerWidget(),
          backgroundColor: Colors.grey.shade200,
          body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              if (constraints.maxWidth <= 500) {
                return MenuList();
              } else if (constraints.maxWidth <= 600) {
                return MenuGrid(gridCount: 2, fontSize: 14);
              } else if (constraints.maxWidth <= 700) {
                return MenuGrid(gridCount: 2, fontSize: 17);
              } else if (constraints.maxWidth <= 1200) {
                return MenuGrid(gridCount: 3, fontSize: 11);
              } else if (constraints.maxWidth <= 1300) {
                return MenuGrid(gridCount: 3, fontSize: 16);
              } else if (constraints.maxWidth <= 1400) {
                return MenuGrid(gridCount: 4, fontSize: 14);
              } else {
                return MenuGrid(gridCount: 5, fontSize: 14);
              }
            },
          ),
        );
      },
    );
  }
}

//tablet & pc
class MenuGrid extends StatelessWidget {
  final int gridCount;
  final double fontSize;

  MenuGrid({required this.gridCount, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      isAlwaysShown: true,
      child: GridView.count(
        crossAxisCount: gridCount,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: menuFoodList.map((menuFood) {
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailFoodScreen(
                  food: menuFood,
                );
              }));
            },
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Image.asset(
                      menuFood.imageAssets,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.only(top: 8, left: 8, right: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            menuFood.name_food,
                            style: TextStyle(
                                fontSize: fontSize,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: fontSize * 0.20,
                          ),
                          Text(
                            'by : ${menuFood.by}',
                            style: TextStyle(
                                fontSize: fontSize * 0.6,
                                color: Colors.grey.shade700),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '30 min',
                                style: TextStyle(fontSize: fontSize * 0.6),
                              ),
                              FavoriteButton(),
                            ],
                          ),
                          // Text(place.location),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

//Mobile
class MenuList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemBuilder: (context, index) {
          final menuFood menu = menuFoodList[index];
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailFoodScreen(
                  food: menu,
                );
              }));
            },
            child: Card(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Image.asset(
                      menu.imageAssets,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            menu.name_food,
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 15.0),
                          Text(
                            'by : ${menu.by}',
                            style: TextStyle(
                                fontSize: 12.0, color: Colors.grey.shade700),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '30 min',
                                style: TextStyle(fontSize: 12),
                              ),
                              FavoriteButton(),
                            ],
                          ),

                          // Text(place.location),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
        itemCount: menuFoodList.length,
      ),
    );
  }
}

//icon favorite
class FavoriteButton extends StatefulWidget {
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = true;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 20,
      padding: new EdgeInsets.all(0.0),
      autofocus: false,
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}
