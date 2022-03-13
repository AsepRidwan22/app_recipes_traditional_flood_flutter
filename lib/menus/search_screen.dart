import 'dart:math';
import 'dart:ui';

import 'package:app_recipes_traditional_flood_flutter/main.dart';
import 'package:flutter/material.dart';

import 'list/list_category_menu.dart';

class SearchScreen extends StatelessWidget {
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
                    'Search',
                    style: TextStyle(color: Colors.black),
                  ),
                )
              : null,
          drawer: DrawerWidget(),
          backgroundColor: Colors.grey.shade200,
          body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              if (constraints.maxWidth <= 600) {
                return searchScreenPage(
                  gridCount: 2,
                );
              } else if (constraints.maxWidth <= 800) {
                return searchScreenPage(
                  gridCount: 3,
                );
              } else {
                return searchScreenPage(gridCount: 6);
              }
            },
          ),
        );
      },
    );
  }
}

class searchScreenPage extends StatelessWidget {
  final int gridCount;

  searchScreenPage({required this.gridCount});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 30.0),
              child: Text(
                'What to eat?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
            ),
            Positioned(
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(15.0),
                padding: EdgeInsets.only(left: 20, right: 10),
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 50,
                          color: Colors.grey.shade500.withOpacity(0.23))
                    ]),
                child: TextField(
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle:
                          TextStyle(color: Colors.black.withOpacity(0.23)),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      suffixIcon: Icon(
                        Icons.search,
                        color: Colors.black.withOpacity(0.6),
                      )),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: GridView.count(
                shrinkWrap: true, //mengatur scrollable
                crossAxisCount: gridCount,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: menuList.map((menuFood) {
                  return InkWell(
                    onTap: () {},
                    child: Card(
                      elevation: 5,
                      color: Color.fromRGBO(
                          menuFood.bgcolor[0],
                          menuFood.bgcolor[1],
                          menuFood.bgcolor[2],
                          menuFood.bgcolor[3]),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: Image.asset(
                              menuFood.imageAssets,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Text(
                              menuFood.name,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16.0,
                                fontFamily: 'Raleway',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
