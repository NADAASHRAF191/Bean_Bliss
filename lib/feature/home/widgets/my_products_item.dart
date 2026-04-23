import 'package:coffee_shop/core/constant/image_constant.dart';
import 'package:coffee_shop/core/models/product_model.dart';
import 'package:coffee_shop/core/theme/app_theme.dart';
import 'package:coffee_shop/feature/home/views/details_view.dart';
import 'package:flutter/material.dart';

class MyProductItem extends StatelessWidget {
  const MyProductItem({super.key, required this.products});

  final ProductModel products;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsView(product: products),
          ),
        );
      },
      child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with Rating
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Hero(
                  tag: "product_${products.id}",
                  child: Image.asset(
                    products.image,
                    width: double.infinity,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.black.withAlpha(100),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  child: Row(
                    children: [
                      Image.asset(MyAppIcons.star, height: 10, width: 10),
                      SizedBox(width: 4),
                      Text(
                        "${products.rate}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Text(
            products.name,
            style: MyTextStyle.normalTitleText(size: 16),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 4),
          Text(
            products.type,
            style: MyTextStyle.subTitleText(size: 12),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$ ${products.price}",
                style: MyTextStyle.normalTitleText(size: 18),
              ),
              Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                  color: MyAppColor.primaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.add, color: Colors.white, size: 20),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
}
