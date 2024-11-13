import 'package:fitshield/screens/my_cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FoodMenuScreen extends StatefulWidget {
  const FoodMenuScreen({super.key});

  @override
  _FoodMenuScreenState createState() => _FoodMenuScreenState();
}

class _FoodMenuScreenState extends State<FoodMenuScreen> {
  bool isVegOnly = false;
  String? selectedCardTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Briyani Blues',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
            ),
            Text(
              'Chinese, Asian, Fast Food',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey,
                  ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyCartScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildGreetingCard(context),
              const SizedBox(height: 20),
              _buildMenuFilterSection(context),
              const SizedBox(height: 20),
              _buildRecommendedSection(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGreetingCard(BuildContext context) {
    return Card(
      elevation: 2,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  _buildTextSpan('Hello 👋, ', context),
                  _buildTextSpan('Krishna', context, FontWeight.bold),
                  _buildTextSpan(' Your Goal! 😊', context),
                ],
              ),
            ),
            const SizedBox(height: 12),
            _buildNutrientGoalsRow(context),
            const SizedBox(height: 8),
            const Divider(
              color: Colors.black12,
              thickness: 1,
            ),
            const SizedBox(height: 8),
            _buildReadMore(context),
          ],
        ),
      ),
    );
  }

  Widget _buildNutrientGoalsRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildNutrientColumn(context, '10g', '85%', 'Protein', Colors.orange),
        _buildNutrientColumn(context, '5g', '90%', 'Carbs', Colors.green),
        _buildNutrientColumn(context, '5g', '100%', 'Fats', Colors.blue),
        _buildNutrientColumn(context, '5g', '100%', 'Fibre', Colors.yellow),
      ],
    );
  }

  Widget _buildNutrientColumn(
      BuildContext context, String amount, String percentage, String label, Color color) {
    return Column(
      children: [
        Text(
          amount,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
        ),
        const SizedBox(height: 4),
        Container(
          height: 4,
          width: 40,
          color: color,
        ),
        const SizedBox(height: 4),
        Text(
          percentage,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.black,
              ),
        ),
      ],
    );
  }

  Widget _buildReadMore(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text('Additionally it contains Calcium = 450 mg...', style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey))),
        GestureDetector(
          onTap: () => _showCalciumDialog(context),
          child: const Text('Read More', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14)),
        ),
      ],
    );
  }

  void _showCalciumDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        title: const Text('Calcium Content', style: TextStyle(color: Colors.black)),
        content: const Text('Calcium is an essential mineral for bone health...', style: TextStyle(color: Colors.black)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close', style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuFilterSection(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _buildMenuOption(
                  context,
                  GestureDetector(
                    onTap: () {
                      print('Full Menu tapped');
                    },
                    child: SvgPicture.asset(
                      'assets/icons/full_menu.svg',
                      height: 20,
                      width: 20,
                    ),
                  ),
                  'Full Menu',
                ),
              ),
              Expanded(
                child: _buildMenuOption(
                  context,
                  GestureDetector(
                    onTap: () {
                      print('Healthy tapped');
                    },
                    child: SvgPicture.asset(
                      'assets/icons/healthy.svg',
                      height: 20,
                      width: 20,
                    ),
                  ),
                  'Healthy',
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Veg Only',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black),
                    ),
                    Switch(
                      value: isVegOnly,
                      onChanged: (bool value) {
                        setState(() {
                          isVegOnly = value;
                        });
                      },
                      activeColor: Colors.green,
                      inactiveTrackColor: Colors.grey,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMenuOption(BuildContext context, Widget icon, String label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        icon,
        const SizedBox(width: 4),
        Flexible(
          child: Text(
            label,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.black,
                  fontSize: 14,
                ),
          ),
        ),
      ],
    );
  }

  Widget _buildRecommendedSection(BuildContext context) {
    return Card(
      elevation: 2,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recommended (2)',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
            ),
            const SizedBox(height: 8),
            _buildRecommendedCard(
              context,
              'Fried Rice',
              'Rs.450',
              '175 Kcal',
              discount: '25% OFF',
              isBestMatch: true,
              imagePath: 'assets/images/fried_rice.jpg',
            ),
            const SizedBox(height: 16),
            _buildRecommendedCard(
              context,
              'Cappuccino',
              'Rs.200',
              '329 Kcal',
              isBestMatch: false,
              imagePath: 'assets/images/cappuccino.jpg',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecommendedCard(BuildContext context, String title, String price, String calories,
      {String? discount, bool isBestMatch = false, required String imagePath}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCardTitle = title;
        });
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: 12.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: selectedCardTitle == title
              ? const BorderSide(color: Colors.orange, width: 2)
              : BorderSide.none,
        ),
        elevation: 2,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  imagePath,
                  height: 60,
                  width: 60,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          price,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          calories,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Colors.black54,
                              ),
                        ),
                        const SizedBox(width: 8),
                        if (discount != null)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              discount,
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                      ],
                    ),
                    if (isBestMatch)
                      Text(
                        'Best Match',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    const SizedBox(height: 8),
                    _buildNutrientRow(context),
                    // ADD button below the image
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: () {
                        // Just for demonstration, adding logic for the button click
                        print('Add button clicked!');
                      },
                      child: Container(
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.green),
                        ),
                        child: Center(
                          child: Text(
                            'ADD',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNutrientRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildNutrientColumn(context, '10g', '85%', 'Protein', Colors.orange),
        _buildNutrientColumn(context, '5g', '90%', 'Carbs', Colors.green),
        _buildNutrientColumn(context, '5g', '100%', 'Fats', Colors.blue),
        _buildNutrientColumn(context, '5g', '100%', 'Fibre', Colors.yellow),
      ],
    );
  }

  TextSpan _buildTextSpan(
    String text,
    BuildContext context, [
    FontWeight weight = FontWeight.normal,
  ]) {
    return TextSpan(
      text: text,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontWeight: weight,
            color: Colors.black,
          ),
    );
  }
}