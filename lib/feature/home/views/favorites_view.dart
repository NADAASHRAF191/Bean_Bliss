import 'package:coffee_shop/core/data/favorites_controller.dart';
import 'package:coffee_shop/core/theme/app_theme.dart';
import 'package:coffee_shop/feature/home/widgets/my_products_item.dart';
import 'package:flutter/material.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  final fav = FavoritesController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F9F9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Favorites", style: MyTextStyle.normalTitleText(size: 18)),
        centerTitle: true,
      ),
      body: fav.favorites.isEmpty
          ? Center(child: Text("No favorites yet", style: MyTextStyle.subTitleText()))
          : GridView.builder(
              padding: EdgeInsets.all(24),
              itemCount: fav.favorites.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
              ),
              itemBuilder: (context, index) {
                return MyProductItem(products: fav.favorites[index]);
              },
            ),
    );
  }
}
