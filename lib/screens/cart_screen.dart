import 'package:flutter/material.dart';
import '../models/product.dart';

class CartScreen extends StatefulWidget {
  final List<Product> cartItems;

  const CartScreen({super.key, required this.cartItems});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final Map<int, int> itemQuantities = {};

  @override
  void initState() {
    super.initState();

    for (var item in widget.cartItems) {
      itemQuantities[item.id] = 1;
    }
  }

  void increaseQuantity(Product product) {
    final current = itemQuantities[product.id] ?? 1;

    setState(() {
      itemQuantities[product.id] = current + 1;
    });
  }

  void decreaseQuantity(Product product) {
    final current = itemQuantities[product.id] ?? 1;

    if (current > 1) {
      setState(() {
        itemQuantities[product.id] = current - 1;
      });
    }
  }

  void removeItemFromCart(Product product) {
    setState(() {
      widget.cartItems.remove(product);
      itemQuantities.remove(product.id);
    });
  }

  double calculateTotalPrice() {
    double total = 0;

    for (var item in widget.cartItems) {
      final quantity = itemQuantities[item.id] ?? 1;
      total += item.price * quantity;
    }

    return total;
  }

  @override
  Widget build(BuildContext context) {
    final totalPrice = calculateTotalPrice();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 46,
            left: 20,
            right: 20,
            bottom: 10,
          ),
          child: Row(
            children: [
              const Text(
                'Cart',
                style: TextStyle(
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w700,
                  fontSize: 28,
                  letterSpacing: -0.28,
                  color: Color(0xFF202020),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 30,
                height: 30,
                decoration: const BoxDecoration(
                  color: Color(0xFFE5EBFC),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  widget.cartItems.length.toString(),
                  style: const TextStyle(
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    letterSpacing: -0.18,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),

        Expanded(
          child: widget.cartItems.isEmpty
              ? const Center(
                  child: Text(
                    'Your cart is empty',
                    style: TextStyle(
                      fontFamily: 'Nunito Sans',
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: widget.cartItems.length,
                  itemBuilder: (context, index) {
                    final product = widget.cartItems[index];
                    final quantity = itemQuantities[product.id] ?? 1;

                    return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            blurRadius: 6,
                            spreadRadius: 2,
                            offset: const Offset(2, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // картинка + корзина
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Stack(
                              children: [
                                Image.asset(
                                  product.image,
                                  width: 121,
                                  height: 101,
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                  bottom: 4,
                                  left: 4,
                                  child: GestureDetector(
                                    onTap: () {
                                      removeItemFromCart(product);
                                    },
                                    child: Image.asset(
                                      'assets/icons/trash.png',
                                      width: 30,
                                      height: 30,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.title,
                                  style: const TextStyle(
                                    fontFamily: 'Nunito Sans',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                    height: 16 / 12,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                const Text(
                                  'Pink, Size M',
                                  style: TextStyle(
                                    fontFamily: 'Raleway',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    letterSpacing: -0.14,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 13),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '\$${product.price.toStringAsFixed(2)}',
                                      style: const TextStyle(
                                        fontFamily: 'Raleway',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18,
                                        letterSpacing: -0.18,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            decreaseQuantity(product);
                                          },
                                          child: Image.asset(
                                            'assets/icons/minus.png',
                                            width: 30,
                                            height: 30,
                                          ),
                                        ),
                                        Container(
                                          width: 37,
                                          height: 30,
                                          margin: const EdgeInsets.symmetric(
                                            horizontal: 8,
                                          ),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFE5EBFC),
                                            borderRadius: BorderRadius.circular(
                                              6,
                                            ),
                                          ),
                                          alignment: Alignment.center,
                                          child: Text(
                                            quantity.toString(),
                                            style: const TextStyle(
                                              fontFamily: 'Raleway',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                              letterSpacing: -0.16,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            increaseQuantity(product);
                                          },
                                          child: Image.asset(
                                            'assets/icons/plus.png',
                                            width: 30,
                                            height: 30,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
        ),

        Container(
          width: double.infinity,
          height: 60,
          color: const Color(0xFFF5F5F5),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text(
                    'Total: ',
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                      letterSpacing: -0.2,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '\$${totalPrice.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      letterSpacing: -0.18,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Container(
                width: 128,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFF004CFF),
                  borderRadius: BorderRadius.circular(11),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Checkout',
                  style: TextStyle(
                    fontFamily: 'Nunito Sans',
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
