import 'package:flutter/material.dart';

import '../model/home_product_model.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({
    super.key,
    required this.product,
  });

  final HomeProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190,
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                '-${product.discount}%',
                style: TextStyle(
                  color: Colors.red.shade400,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.network(
                product.image,
                height: 110,
                width: 110,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 14),
          Text(
            product.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.star, size: 16, color: Colors.orange),
              const SizedBox(width: 4),
              Text(product.rating.toString()),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              Text(
                '\$${product.price}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '\$${product.oldPrice}',
                style: const TextStyle(
                  decoration: TextDecoration.lineThrough,
                  color: Colors.grey,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFF0CA678),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(Icons.add, color: Colors.white),
              )
            ],
          )
        ],
      ),
    );
  }
}
