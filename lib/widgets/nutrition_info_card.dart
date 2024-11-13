// widgets/nutrition_info_card.dart
import 'package:flutter/material.dart';

class NutritionInfoCard extends StatelessWidget {
  const NutritionInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NutritionItem(label: 'Protein', amount: '10g', percentage: '85%'),
                NutritionItem(label: 'Carbs', amount: '5g', percentage: '90%'),
                NutritionItem(label: 'Fats', amount: '5g', percentage: '100%'),
                NutritionItem(label: 'Fibre', amount: '5g', percentage: '100%'),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Additionally it contains Calcium + 450 mg...',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}

class NutritionItem extends StatelessWidget {
  final String label;
  final String amount;
  final String percentage;

  const NutritionItem({super.key, required this.label, required this.amount, required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(amount, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        Text(percentage, style: const TextStyle(color: Colors.grey)),
        Text(label, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
      ],
    );
  }
}