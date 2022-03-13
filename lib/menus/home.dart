import 'package:app_recipes_traditional_flood_flutter/menus/detail_food.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import 'list/list_carousel.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'favorite.dart';
import 'list/list_category_menu.dart';
import 'list/list_food.dart';

class HomeScreen extends StatelessWidget {
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
                    'Home',
                    style: TextStyle(color: Colors.black),
                  ),
                )
              : null,
          drawer: DrawerWidget(),
          body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              if (constraints.maxWidth <= 500) {
                return menuScreenPage();
              } else {
                return menuScreenPage();
              }
            },
          ),
        );
      },
    );
  }
}

class menuScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          CarouselSlider(
            options: CarouselOptions(
                viewportFraction: 1, aspectRatio: 1248 / 400, autoPlay: true),
            items: carouselImages.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(i));
                },
              );
            }).toList(),
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: Text(
              'Recommendation',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 125,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: menuList.map((food) {
                return InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                      child: Image.asset(food.imageAssets),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: Text(
              'New Menu',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              if (constraints.maxWidth <= 500) {
                return recomenList();
              } else if (constraints.maxWidth <= 600) {
                return recomenGrid(gridCount: 2, fontSize: 14);
              } else if (constraints.maxWidth <= 700) {
                return recomenGrid(gridCount: 2, fontSize: 17);
              } else if (constraints.maxWidth <= 1200) {
                return recomenGrid(gridCount: 3, fontSize: 11);
              } else if (constraints.maxWidth <= 1300) {
                return recomenGrid(gridCount: 3, fontSize: 16);
              } else if (constraints.maxWidth <= 1400) {
                return recomenGrid(gridCount: 4, fontSize: 14);
              } else {
                return recomenGrid(gridCount: 5, fontSize: 14);
              }
            },
          ),
        ],
      ),
    );
  }
}

//Mobile
class recomenList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: menuFoodList.map((food) {
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailFoodScreen(
                  food: food,
                );
              }));
            },
            child: Card(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Image.asset(
                      food.imageAssets,
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
                            food.name_food,
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 15.0),
                          Text(
                            'by : ${food.by}',
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

class recomenGrid extends StatelessWidget {
  final int gridCount;
  final double fontSize;

  recomenGrid({required this.gridCount, required this.fontSize});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.count(
          shrinkWrap: true,
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
      ],
    );
  }
}

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
