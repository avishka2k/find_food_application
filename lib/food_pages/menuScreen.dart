import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  final List<FoodItem> menu = [
    FoodItem(id: 1, name: 'Burger', price: 5.99),
    FoodItem(id: 2, name: 'Pizza', price: 7.99),
    FoodItem(id: 3, name: 'Pasta', price: 8.99),
    // Add more food items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: menu.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(menu[index].name),
            subtitle: Text('\$${menu[index].price.toStringAsFixed(2)}'),
            trailing: AddToCartButton(item: menu[index]),
          );
        },
      ),
    );
  }
}

class FoodItem {
  final int id;
  final String name;
  final double price;
  int quantity;

  FoodItem({
    required this.id,
    required this.name,
    required this.price,
    this.quantity = 0,
  });
}

class AddToCartButton extends StatelessWidget {
  final FoodItem item;

  AddToCartButton({required this.item});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        item.quantity++;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Added ${item.name} to cart.'),
            duration: Duration(seconds: 2),
          ),
        );
      },
      child: Text('Add to Cart'),
    );
  }
}

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  List<FoodItem> cart = [];

  double getTotal() {
    double total = 0;
    for (var item in cart) {
      total += item.price * item.quantity;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(cart[index].name),
            subtitle: Text('\$${cart[index].price.toStringAsFixed(2)}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      if (cart[index].quantity > 0) {
                        cart[index].quantity--;
                      }
                    });
                  },
                ),
                Text(cart[index].quantity.toString()),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      cart[index].quantity++;
                    });
                  },
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total: \$${getTotal().toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 18)),
              ElevatedButton(
                onPressed: () {
                  // Implement the order functionality here
                  if (cart.isNotEmpty) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Order Placed'),
                          content: Text('Your order has been placed.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  cart.clear();
                                });
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Text('Place Order'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
