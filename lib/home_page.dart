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
  const HomePage({super.key});

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
        title: const Text('Food Menu'),
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
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.65, // Adjusted ratio to give more height
              ),
              itemCount: menu.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // Add this
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
                          padding: const EdgeInsets.all(4.0), // Reduced padding
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                menu[index].name,
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text('Rp ${menu[index].price}'),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
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
