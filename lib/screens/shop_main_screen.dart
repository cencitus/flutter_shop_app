import 'package:flutter/material.dart';
import '../models/product.dart';
import 'home_screen.dart';
import 'favorites_screen.dart';
import 'cart_screen.dart';

class ShopMainScreen extends StatefulWidget {
  const ShopMainScreen({super.key});

  @override
  State<ShopMainScreen> createState() => _ShopMainScreenState();
}

class _ShopMainScreenState extends State<ShopMainScreen> {
  int currentIndex = 0;

  final List<Product> products = [
    Product(
      id: 0,
      title: 'Lorem ipsum dolor sit amet consectetur',
      image: 'assets/images/product1.png',
      price: 17.00,
    ),
    Product(
      id: 1,
      title: 'Lorem ipsum dolor sit amet consectetur',
      image: 'assets/images/product2.png',
      price: 17.00,
    ),
    Product(
      id: 2,
      title: 'Lorem ipsum dolor sit amet consectetur',
      image: 'assets/images/product3.png',
      price: 17.00,
    ),
    Product(
      id: 3,
      title: 'Lorem ipsum dolor sit amet consectetur',
      image: 'assets/images/product4.png',
      price: 17.00,
    ),
    Product(
      id: 4,
      title: 'Lorem ipsum dolor sit amet consectetur',
      image: 'assets/images/product5.png',
      price: 17.00,
    ),
    Product(
      id: 5,
      title: 'Lorem ipsum dolor sit amet consectetur',
      image: 'assets/images/product6.png',
      price: 17.00,
    ),
  ];

  void toggleFavourite(Product product) {
    setState(() {
      product.isFavourite = !product.isFavourite;
    });
  }

  void toggleCart(Product product) {
    setState(() {
      product.inCart = !product.inCart;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Product> favouriteProducts = [];
    List<Product> cartItems = [];

    for (var p in products) {
      if (p.isFavourite == true) {
        favouriteProducts.add(p);
      }
      if (p.inCart == true) {
        cartItems.add(p);
      }
    }

    final List<Widget> screens = [
      HomeScreen(
        products: products,
        onToggleFavourite: toggleFavourite,
        onToggleCart: toggleCart,
      ),

      FavouritesScreen(
        favouriteProducts: favouriteProducts,
        toggleFavourite: toggleFavourite,
        toggleCart: toggleCart,
      ),

      CartScreen(cartItems: cartItems),
    ];

    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        backgroundColor: Colors.white,
        elevation: 10,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: const Color(0xFF004CFF),
        iconSize: 32,
        items: const [
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/icons/home.png')),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/icons/heart.png')),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/icons/bag.png')),
            label: '',
          ),
        ],
      ),
    );
  }
}
