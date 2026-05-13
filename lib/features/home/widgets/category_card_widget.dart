import 'package:flutter/material.dart';

import '../model/home_category_model.dart';

class CategoryCardWidget extends StatelessWidget {
  const CategoryCardWidget({
    super.key,
    required this.category,
  });

  final HomeCategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Color(category.backgroundColor),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            category.icon,
            style: const TextStyle(fontSize: 34),
          ),
          const SizedBox(height: 10),
          Text(
            category.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
