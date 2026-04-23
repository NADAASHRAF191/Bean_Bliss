import 'package:coffee_shop/core/models/product_model.dart';
import 'package:coffee_shop/core/theme/app_theme.dart';
import 'package:coffee_shop/core/constant/image_constant.dart';
import 'package:coffee_shop/core/data/cart_controller.dart';
import 'package:coffee_shop/core/data/favorites_controller.dart';
import 'package:flutter/material.dart';

class DetailsView extends StatefulWidget {
  final ProductModel product;
  const DetailsView({super.key, required this.product});

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F9F9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Detail",
          style: MyTextStyle.normalTitleText(size: 18),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              FavoritesController().isFavorite(widget.product) ? Icons.favorite : Icons.favorite_border,
              color: FavoritesController().isFavorite(widget.product) ? Colors.red : Colors.black,
            ),
            onPressed: () {
              setState(() {
                FavoritesController().toggleFavorite(widget.product);
              });
            },
          ),
          SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Hero(
                tag: "product_${widget.product.id}",
                child: Image.asset(
                  widget.product.image,
                  width: double.infinity,
                  height: 226,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              widget.product.name,
              style: MyTextStyle.normalTitleText(size: 24),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.product.type,
                  style: MyTextStyle.subTitleText(size: 14),
                ),
                Row(
                  children: [
                    Image.asset(MyAppIcons.star, height: 16, width: 16),
                    SizedBox(width: 4),
                    Text(
                      "${widget.product.rate}",
                      style: MyTextStyle.normalTitleText(size: 16),
                    ),
                    Text(
                      " (230)",
                      style: MyTextStyle.subTitleText(size: 12),
                    ),
                  ],
                ),
              ],
            ),
            Divider(height: 40, color: Color(0xffEAEAEA)),
            Text(
              "Description",
              style: MyTextStyle.normalTitleText(size: 16),
            ),
            SizedBox(height: 12),
            Text(
              widget.product.description,
              style: MyTextStyle.subTitleText(size: 14),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Size",
                      style: MyTextStyle.normalTitleText(size: 16),
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: ["S", "M", "L"].map((size) {
                        bool isSelected = size == "M";
                        return Container(
                          margin: EdgeInsets.only(right: 8),
                          height: 40,
                          width: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: isSelected ? MyAppColor.primaryColor.withAlpha(20) : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: isSelected ? MyAppColor.primaryColor : Color(0xffEAEAEA),
                            ),
                          ),
                          child: Text(
                            size,
                            style: MyTextStyle.normalTitleText(
                              size: 14,
                              color: isSelected ? MyAppColor.primaryColor : Colors.black,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Quantity",
                      style: MyTextStyle.normalTitleText(size: 16),
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        _quantityBtn(Icons.remove, () {
                          if (quantity > 1) setState(() => quantity--);
                        }),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Text("$quantity", style: MyTextStyle.normalTitleText()),
                        ),
                        _quantityBtn(Icons.add, () => setState(() => quantity++)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 24),
            Text(
              "Milk Type",
              style: MyTextStyle.normalTitleText(size: 16),
            ),
            SizedBox(height: 12),
            _optionGroup(["Oat Milk", "Soy Milk", "Almond Milk"]),
            SizedBox(height: 24),
            Text(
              "Toppings",
              style: MyTextStyle.normalTitleText(size: 16),
            ),
            SizedBox(height: 12),
            _optionGroup(["Caramel", "Chocolate", "Hazelnut"]),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Price", style: MyTextStyle.subTitleText()),
                Text(
                  "\$ ${(widget.product.price * quantity).toStringAsFixed(2)}",
                  style: MyTextStyle.normalTitleText(size: 18, color: MyAppColor.primaryColor),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                CartController().addToCart(widget.product, quantity: quantity);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("${widget.product.name} added to bag!"),
                    backgroundColor: MyAppColor.primaryColor,
                    duration: Duration(seconds: 1),
                  ),
                );
              },
              child: Container(
                height: 56,
                width: 217,
                decoration: BoxDecoration(
                  color: MyAppColor.primaryColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                alignment: Alignment.center,
                child: Text(
                  "Add to Bag",
                  style: MyTextStyle.normalTitleText(color: Colors.white, size: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _quantityBtn(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffEAEAEA)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, size: 18),
      ),
    );
  }

  Widget _optionGroup(List<String> options) {
    return Wrap(
      spacing: 12,
      children: options.map((opt) {
        return ChoiceChip(
          label: Text(opt),
          selected: false, // For simplicity in this demo
          onSelected: (val) {},
          selectedColor: MyAppColor.primaryColor.withAlpha(50),
          backgroundColor: Colors.white,
          labelStyle: MyTextStyle.subTitleText(size: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Color(0xffEAEAEA)),
          ),
        );
      }).toList(),
    );
  }
}
