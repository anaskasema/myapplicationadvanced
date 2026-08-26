import 'package:flutter/material.dart';

class CategoryNewsItem extends StatelessWidget {
  const CategoryNewsItem({
    super.key,
    required this.categoriesIcons,
    required this.categories,
  });

  final IconData categoriesIcons;
  final String categories;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Stack(
        alignment: AlignmentGeometry.center,
        children: [
          Positioned(
            top: 20,
            left: 10,
            child: Icon(Icons.favorite, color: Colors.red, size: 30),
          ),
          Icon(categoriesIcons, color: Colors.blue, size: 30),
          Positioned(



            bottom: 30,
            child: Text(
              categories,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
