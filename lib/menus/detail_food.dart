import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'list/list_food.dart';

class DetailFoodScreen extends StatelessWidget {
  final menuFood food;

  DetailFoodScreen({required this.food});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth <= 600) {
          return DetailMobilePage(food: food);
        } else {
          return DetailWebPage(food: food);
        }
      },
    );
  }
}

class DetailMobilePage extends StatelessWidget {
  final menuFood food;
  int i = 0;

  DetailMobilePage({required this.food});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.asset(
                  food.imageAssets,
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white.withOpacity(0.7),
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        FavoriteButton(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 16.0),
              child: Text(
                food.name_food,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ),
            Card(
              child: Container(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Description : ',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        food.description,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      )
                    ],
                  )),
            ),
            Card(
              child: Container(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Ingredients : ',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      ListBody(
                          children: food.ingredien.map((index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 8, right: 16, bottom: 8, left: 16),
                          child: Container(
                            child: Text(index),
                          ),
                        );
                      }).toList())
                    ],
                  )),
            ),
            Card(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8, right: 16, left: 16),
                    child: Text(
                      'Step : ',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListBody(
                      children: food.step.map((index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          top: 8, right: 16, bottom: 8, left: 16),
                      child: Container(child: Text(index)),
                    );
                  }).toList())
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Untuk Web
class DetailWebPage extends StatefulWidget {
  final menuFood food;

  DetailWebPage({required this.food});

  @override
  _DetailWebPageState createState() => _DetailWebPageState();
}

class _DetailWebPageState extends State<DetailWebPage> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: kIsWeb ? null : AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 64,
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              width: screenWidth <= 1200 ? 800 : 1200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Resep Masakan',
                    style: TextStyle(
                      fontSize: 32,
                    ),
                  ),
                  SizedBox(height: 32),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            ClipRRect(
                              child: Image.asset(widget.food.imageAssets),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 32),
                      Expanded(
                          child: Card(
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      widget.food.name_food,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 30.0,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 16.0),
                                    child: Text(
                                      widget.food.description,
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Ingredients : ',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  ListBody(
                                      children:
                                          widget.food.ingredien.map((index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8,
                                          right: 16,
                                          bottom: 8,
                                          left: 16),
                                      child: Container(
                                        child: Text(index),
                                      ),
                                    );
                                  }).toList())
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Step : ',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  ListBody(
                                      children: widget.food.step.map((index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8,
                                          right: 16,
                                          bottom: 8,
                                          left: 16),
                                      child: Container(
                                        child: Text(index),
                                      ),
                                    );
                                  }).toList())
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class FavoriteButton extends StatefulWidget {
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
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
