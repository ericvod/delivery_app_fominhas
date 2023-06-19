import 'package:flutter/material.dart';

class StoresScreen extends StatefulWidget {
  const StoresScreen({Key? key}) : super(key: key);

  @override
  State<StoresScreen> createState() => _StoresScreenState();
}

class _StoresScreenState extends State<StoresScreen> {
  List<Store> stores = [
    Store(
      name: 'Loja A',
      description: 'Descrição da Loja A',
      items: [
        Item(name: 'Item 1', price: 10.0),
        Item(name: 'Item 2', price: 15.0),
        Item(name: 'Item 3', price: 20.0),
      ],
    ),
    Store(
      name: 'Loja B',
      description: 'Descrição da Loja B',
      items: [
        Item(name: 'Item 4', price: 12.0),
        Item(name: 'Item 5', price: 18.0),
        Item(name: 'Item 6', price: 25.0),
      ],
    ),
  ];

  List<Item> cartItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lojas'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ShoppingCartScreen(cartItems: cartItems),
                ),
              );
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: stores.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(stores[index].name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StoreDetailsScreen(
                    store: stores[index],
                    onItemSelected: (item) {
                      setState(() {
                        cartItems.add(item);
                      });
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class Store {
  final String name;
  final String description;
  final List<Item> items;

  Store({
    required this.name,
    required this.description,
    required this.items,
  });
}

class Item {
  final String name;
  final double price;

  Item({
    required this.name,
    required this.price,
  });
}

class StoreDetailsScreen extends StatelessWidget {
  final Store store;
  final Function(Item) onItemSelected;

  const StoreDetailsScreen(
      {Key? key, required this.store, required this.onItemSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(store.name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              store.description,
              style: const TextStyle(fontSize: 18),
            ),
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Itens:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              itemCount: store.items.length,
              itemBuilder: (context, index) {
                final item = store.items[index];
                return CheckboxListTile(
                  title:
                      Text('${item.name} - \$${item.price.toStringAsFixed(2)}'),
                  value: false,
                  onChanged: (value) {
                    if (value != null && value) {
                      onItemSelected(item);
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ShoppingCartScreen extends StatelessWidget {
  final List<Item> cartItems;

  const ShoppingCartScreen({Key? key, required this.cartItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sacola'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final item = cartItems[index];
          return ListTile(
            title: Text('${item.name} - \$${item.price.toStringAsFixed(2)}'),
          );
        },
      ),
    );
  }
}
