import 'package:flutter/material.dart';

class FoodApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FoodItemList(),
    );
  }
}

class FoodItemList extends StatelessWidget {
  final List<FoodItem> items = [
    FoodItem(
      name: 'Burger',
      price: 5.99,
      imageUrl: 'https://example.com/burger.jpg', // Replace with your image URL
    ),
    FoodItem(
      name: 'Pizza',
      price: 7.99,
      imageUrl: 'https://example.com/pizza.jpg', // Replace with your image URL
    ),
    FoodItem(
      name: 'Pasta',
      price: 8.99,
      imageUrl: 'https://example.com/pasta.jpg', // Replace with your image URL
    ),
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
            leading: Image.network(
              items[index].imageUrl,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
            title: Text(items[index].name),
            subtitle: Text('\$${items[index].price.toStringAsFixed(2)}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FoodItemDetailPage(item: items[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class FoodItemDetailPage extends StatelessWidget {
  final FoodItem item;

  FoodItemDetailPage({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              item.imageUrl,
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(item.name, style: TextStyle(fontSize: 24)),
            Text('\$${item.price.toStringAsFixed(2)}', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}

class FoodItem {
  final String name;
  final double price;
  final String imageUrl;

  FoodItem({required this.name, required this.price, required this.imageUrl});
}
