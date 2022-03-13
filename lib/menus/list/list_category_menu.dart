import 'dart:ui';

class menuFood {
  String name;
  String imageAssets;
  List bgcolor;
  // List<String> imageUrls;

  menuFood({
    required this.name,
    required this.imageAssets,
    required this.bgcolor,
  });
}

var menuList = [
  menuFood(
      name: 'Quickly',
      imageAssets: 'images/menu1.png',
      bgcolor: [253, 229, 152, 1.0]),
  menuFood(
      name: 'Breakfast',
      imageAssets: 'images/menu2.png',
      bgcolor: [125, 216, 190, 1.0]),
  menuFood(
      name: 'Celebratory',
      imageAssets: 'images/menu3.png',
      bgcolor: [252, 168, 150, 1.0]),
  menuFood(
      name: 'Dinner',
      imageAssets: 'images/menu4.png',
      bgcolor: [211, 176, 223, 1.0]),
  menuFood(
      name: 'Vegetarian',
      imageAssets: 'images/menu2.png',
      bgcolor: [125, 216, 190, 1.0]),
  menuFood(
      name: 'Low Calorie',
      imageAssets: 'images/menu3.png',
      bgcolor: [255, 214, 152, 1.0])
];
