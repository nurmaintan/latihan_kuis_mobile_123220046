import 'package:flutter/material.dart';
import 'home_page.dart';

class OrderPage extends StatefulWidget {
  final FoodItem item;

  const OrderPage({super.key, required this.item});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final _quantityController = TextEditingController(text: '1');
  int get quantity => int.tryParse(_quantityController.text) ?? 1;

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(  // Changed from Image.network to Image.asset
              widget.item.image,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Text(
              widget.item.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'Price: Rp ${widget.item.price}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _quantityController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Quantity',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  // Force rebuild to update total price
                });
              },
            ),
            const SizedBox(height: 20),
            Text(
              'Total: Rp ${widget.item.price * quantity}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Order Summary'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Item: ${widget.item.name}'),
                          Text('Quantity: $quantity'),
                          Text(
                            'Total Price: Rp ${widget.item.price * quantity}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                },
                child: const Text('Submit Order'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
