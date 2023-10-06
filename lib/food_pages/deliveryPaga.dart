import 'package:flutter/material.dart';

class FoodDeliveryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Delivery App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/menu': (context) => MenuScreen(),
        '/orders': (context) => OrderScreen(),
        '/delivery': (context) => DeliveryPage(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Delivery App'),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Text(
          'Welcome to the Food Delivery App!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/');
            },
          ),
          ListTile(
            leading: Icon(Icons.restaurant_menu),
            title: Text('Menu'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/menu');
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Orders'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/orders');
            },
          ),
          ListTile(
            leading: Icon(Icons.local_shipping),
            title: Text('Delivery'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/delivery');
            },
          ),
        ],
      ),
    );
  }
}

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

class DeliveryPage extends StatelessWidget {
  final TextEditingController addressController = TextEditingController();
  final TextEditingController contactController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delivery Details'),
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Delivery Address:',
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              controller: addressController,
              decoration: InputDecoration(
                hintText: 'Enter your delivery address',
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Contact Number:',
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              controller: contactController,
              decoration: InputDecoration(
                hintText: 'Enter your contact number',
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Implement order confirmation and delivery details handling here
                final deliveryAddress = addressController.text;
                final contactNumber = contactController.text;

                // Display a confirmation message or proceed with the order
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Order Confirmation'),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Delivery Address: $deliveryAddress'),
                          Text('Contact Number: $contactNumber'),
                          Text('Total: \$${getTotal().toStringAsFixed(2)}'),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            // Implement order placement logic
                            // For demonstration, we'll clear the cart
                            setState(() {
                              cart.clear();
                            });
                            Navigator.of(context).pop();
                          },
                          child: Text('Confirm Order'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Cancel'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Confirm Delivery'),
            ),
          ],
        ),
      ),
    );
  }
}
