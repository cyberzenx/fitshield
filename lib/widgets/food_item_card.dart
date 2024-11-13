// widgets/food_item_card.dart
import 'package:flutter/material.dart';

class FoodItemCard extends StatelessWidget {
  final String title;
  final int price;
  final int calories;
  final String description;
  final String? badgeText;
  final int? discount;
  final String imageUrl;

  const FoodItemCard({super.key, 
    required this.title,
    required this.price,
    required this.calories,
    required this.description,
    required this.imageUrl,
    this.badgeText,
    this.discount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(imageUrl), // Replace with network image if needed
              if (badgeText != null)
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    color: Colors.green,
                    child: Text(
                      badgeText!,
                      style: const TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
                ),
              if (discount != null)
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    color: Colors.red,
                    child: Text(
                      '$discount% OFF',
                      style: const TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleMedium), // Updated from subtitle1 to titleMedium
                Text(
                  'Rs.$price',
                  style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.bold),
                ),
                Text('$calories Kcal | $description', style: Theme.of(context).textTheme.bodySmall), // Updated from caption to bodySmall
              ],
            ),
          ),
          ElevatedButton(onPressed: () {}, child: const Text('ADD')),
        ],
      ),
    );
  }
}
