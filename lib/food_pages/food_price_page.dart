import 'package:flutter/material.dart';


class FoodApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/item-details': (context) => ItemDetailsPage(),
        '/cart': (context) => CartPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  final List<FoodItem> items = [
    FoodItem(id: 1, name: 'Burger', price: 5.99),
    FoodItem(id: 2, name: 'Pizza', price: 7.99),
    FoodItem(id: 3, name: 'Pasta', price: 8.99),
    // Add more food items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food App'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index].name),
            subtitle: Text('\$${items[index].price.toStringAsFixed(2)}'),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/item-details',
                arguments: items[index],
              );
            },
          );
        },
      ),
    );
  }
}

class ItemDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FoodItem item = ModalRoute.of(context)!.settings.arguments as FoodItem;

    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(item.name, style: TextStyle(fontSize: 24)),
            Text('\$${item.price.toStringAsFixed(2)}', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement add to cart functionality here
              },
              child: Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Implement shopping cart page here
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: Center(
        child: Text('Your shopping cart is empty.'),
      ),
    );
  }
}

class FoodItem {
  final int id;
  final String name;
  final double price;

  FoodItem({required this.id, required this.name, required this.price});
}
