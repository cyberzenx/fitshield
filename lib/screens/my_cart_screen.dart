import 'package:fitshield/screens/PaymentPage.dart';
import 'package:flutter/material.dart';
  // Import your PaymentPage.dart

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({super.key});

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  List<CartItem> cartItems = [
    CartItem(title: 'Burger With Meat', price: 190, quantity: 1),
    CartItem(title: 'Burger With Cheese', price: 160, quantity: 1),
  ];

  int get totalAmount {
    return cartItems.fold(0, (sum, item) => sum + item.totalPrice);
  }

  int get discount => 50; // Fixed discount

  int get grandTotal => totalAmount; // Grand total before discount

  int get totalToPay => grandTotal - discount; // Total after discount

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Center(
          child: Text(
            'My Cart',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildGreetingCard(context),
              const SizedBox(height: 20),
              ...cartItems.map((item) => _buildCartItem(context, item)).toList(),
              const SizedBox(height: 20),
              _buildRecommendedSection(context),
              const SizedBox(height: 20),
              _buildBillSummary(context),
              const SizedBox(height: 20),
              _buildGrandTotalSection(context),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomBar(context),
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
                  TextSpan(
                    text: 'Hello 👋, ',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.black),
                  ),
                  TextSpan(
                    text: 'Krishna',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                  ),
                  TextSpan(
                    text: ' Your Goal! 😊',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.black),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            _buildNutrientGoalsRow(context),
            const SizedBox(height: 8),
            const Divider(color: Colors.black12, thickness: 1),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Additionally it contains Calcium = 450 mg...',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.grey,
                        ),
                  ),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        backgroundColor: Colors.white,
                        title: const Text(
                          'Calcium Content',
                          style: TextStyle(color: Colors.black),
                        ),
                        content: const Text(
                          'Calcium is an essential mineral for bone health...',
                          style: TextStyle(color: Colors.black),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Close', style: TextStyle(color: Colors.black)),
                          ),
                        ],
                      ),
                    );
                  },
                  child: const Text(
                    'Read More',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
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
        Container(height: 4, width: 40, color: color),
        const SizedBox(height: 4),
        Text(
          percentage,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
        ),
        const SizedBox(height: 2),
        Text(label, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.black)),
      ],
    );
  }

  Widget _buildCartItem(BuildContext context, CartItem item) {
    return Card(
      elevation: 2,
      child: ListTile(
        title: Text(item.title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green, width: 1),
                borderRadius: BorderRadius.circular(6),
              ),
              child: IconButton(
                icon: const Icon(Icons.remove, color: Colors.green, size: 14),
                onPressed: () {
                  setState(() {
                    if (item.quantity > 1) {
                      item.quantity--;
                    }
                  });
                },
              ),
            ),
            const SizedBox(width: 10),
            Text('${item.quantity}', style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(width: 10),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green, width: 1),
                borderRadius: BorderRadius.circular(6),
              ),
              child: IconButton(
                icon: const Icon(Icons.add, color: Colors.green, size: 14),
                onPressed: () {
                  setState(() {
                    item.quantity++;
                  });
                },
              ),
            ),
          ],
        ),
        trailing: Text('Rs. ${item.totalPrice}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
      ),
    );
  }

  Widget _buildRecommendedSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Recommended For You', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(5, (index) {
              String imagePath = 'assets/images/burger${index + 1}.jpg'; // burger1.jpg, burger2.jpg, etc.
              return _buildRecommendedItem(context, imagePath, 'Ordinary Burger ${index + 1}', 190);
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildRecommendedItem(BuildContext context, String imagePath, String title, int price) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 4,
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1, // Makes the image area square
              child: Image.asset(imagePath, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  Text('Rs. $price', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBillSummary(BuildContext context) {
    return Card(
      elevation: 2,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Bill Summary', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total Price', style: TextStyle(color: Colors.black)),
                Text('Rs. $totalAmount', style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGrandTotalSection(BuildContext context) {
    return Card(
      elevation: 2,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Grand Total', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total Price', style: TextStyle(color: Colors.black)),
                Text('Rs. $grandTotal', style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Discount', style: TextStyle(color: Colors.black)),
                Text('Rs. $discount', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('To Pay', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                Text('Rs. $totalToPay', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.green)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {
                print('Order Now pressed');
              },
              child: const Text('Order Now', style: TextStyle(color: Colors.white, fontSize: 14)),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PaymentPage()), // Navigate to PaymentPage
                );
              },
              child: const Text('Pay Now', style: TextStyle(color: Colors.white, fontSize: 14)),
            ),
          ),
        ],
      ),
    );
  }
}

class CartItem {
  final String title;
  final int price;
  int quantity;

  CartItem({
    required this.title,
    required this.price,
    required this.quantity,
  });

  int get totalPrice => price * quantity;
}
