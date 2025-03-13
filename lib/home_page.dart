import 'package:flutter/material.dart';
import 'order_page.dart';
import 'login_page.dart';

class FoodItem {
  final String name;
  final double price;
  final String image;

  FoodItem(this.name, this.price, this.image);
}

class HomePage extends StatelessWidget {
  final String username;
  const HomePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    final List<FoodItem> menu = [
      FoodItem('Pizza', 80000, 'assets/pizza.jpg'),
      FoodItem('Burger', 45000, 'assets/burger.jpg'),
      FoodItem('Pasta', 55000, 'assets/pasta.jpg'),
      FoodItem('Salad', 35000, 'assets/salad.jpg'),
      FoodItem('Steak', 120000, 'assets/steak.jpg'),
      FoodItem('Sushi', 100000, 'assets/sushi.jpg')
    ];

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Halo @$username'),
            const Text(
              'Mau makan apa hari ini?',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/banner.jpg',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Food Menu',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(12), // Reduced padding
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12, // Reduced spacing
                mainAxisSpacing: 12, // Reduced spacing
                childAspectRatio: 0.75, // Adjusted ratio
              ),
              itemCount: menu.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Image.asset(
                          menu[index].image,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0), // Reduced padding further
                          child: Column(
                            mainAxisSize: MainAxisSize.min, // Added this
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                menu[index].name,
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text('Rp ${menu[index].price}'),
                              SizedBox( // Removed extra padding around button
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(vertical: 8), // Reduced button padding
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => OrderPage(
                                          item: menu[index],
                                        ),
                                      ),
                                    );
                                  },
                                  child: const Text('Order'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
