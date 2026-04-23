import 'package:coffee_shop/core/data/cart_controller.dart';
import 'package:coffee_shop/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  final cart = CartController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F9F9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Order", style: MyTextStyle.normalTitleText(size: 18)),
        centerTitle: true,
      ),
      body: cart.items.isEmpty
          ? Center(child: Text("Your bag is empty", style: MyTextStyle.subTitleText()))
          : ListView.separated(
              padding: EdgeInsets.all(24),
              itemCount: cart.items.length,
              separatorBuilder: (context, index) => SizedBox(height: 16),
              itemBuilder: (context, index) {
                final item = cart.items[index];
                return Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(item.product.image, height: 60, width: 60, fit: BoxFit.cover),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item.product.name, style: MyTextStyle.normalTitleText(size: 16)),
                            Text(item.product.type, style: MyTextStyle.subTitleText(size: 12)),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          _btn(Icons.remove, () {
                            setState(() {
                              if (item.quantity > 1) {
                                item.quantity--;
                              } else {
                                cart.removeFromCart(item.product.id);
                              }
                            });
                          }),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Text("${item.quantity}", style: MyTextStyle.normalTitleText(size: 14)),
                          ),
                          _btn(Icons.add, () => setState(() => item.quantity++)),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
      bottomNavigationBar: cart.items.isEmpty
          ? null
          : Container(
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total", style: MyTextStyle.normalTitleText()),
                      Text("\$ ${cart.totalPrice.toStringAsFixed(2)}",
                          style: MyTextStyle.normalTitleText(color: MyAppColor.primaryColor)),
                    ],
                  ),
                  SizedBox(height: 16),
                  InkWell(
                    onTap: () {
                      cart.clearCart();
                      setState(() {});
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Order placed successfully!")),
                      );
                    },
                    child: Container(
                      height: 56,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: MyAppColor.primaryColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      alignment: Alignment.center,
                      child: Text("Checkout", style: MyTextStyle.normalTitleText(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _btn(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffEAEAEA)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, size: 16),
      ),
    );
  }
}
