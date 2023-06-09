import 'package:delivery_app_fominhas/screens/store/catalog_store_screen.dart';
import 'package:delivery_app_fominhas/screens/store/profile_store_screen.dart';
import 'package:delivery_app_fominhas/screens/store/requests_store_screen.dart';
import 'package:flutter/material.dart';

class HomeStoreScreen extends StatefulWidget {
  const HomeStoreScreen({Key? key}) : super(key: key);

  @override
  State<HomeStoreScreen> createState() => _HomeStoreScreenState();
}

class _HomeStoreScreenState extends State<HomeStoreScreen> {
  int _selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: IndexedStack(
          index: _selectedPage,
          children: const [
            CatalogStoreScreen(),
            RequestsStoreScreen(),
            ProfileStoreScreen(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedPage,
        onTap: (value) {
          setState(() {
            _selectedPage = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: "Catalogo",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            label: "Pedidos",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            label: "Perfil",
          ),
        ],
      ),
    );
  }
}
