import 'package:coffee_shop/core/constant/image_constant.dart';
import 'package:coffee_shop/core/theme/app_theme.dart';
import 'package:coffee_shop/core/shared/buttons.dart';
import 'package:coffee_shop/feature/home/data/home_data_source.dart';
import 'package:coffee_shop/feature/home/widgets/my_home_banner.dart';
import 'package:coffee_shop/feature/home/widgets/my_search_widget.dart' show MySearchWidget;
import 'package:coffee_shop/feature/home/widgets/home_background.dart';
import 'package:coffee_shop/feature/home/widgets/location_widget.dart';
import 'package:coffee_shop/feature/home/widgets/my_products_item.dart';
import 'package:coffee_shop/core/models/product_model.dart';
import 'package:coffee_shop/feature/home/views/favorites_view.dart';
import 'package:coffee_shop/feature/home/views/cart_view.dart';
import 'package:coffee_shop/feature/home/views/profile_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeDataSource homeDataSource = HomeDataSource();
  final TextEditingController searchController = TextEditingController();

  int selectedIndex = 0;
  int selectedCategory = 0;
  String searchQuery = "";

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Filter products based on category and search query
    final filteredProducts = homeDataSource.products.where((p) {
      bool matchesCategory = true;
      if (selectedCategory != 0) {
        String catName = homeDataSource.categories[selectedCategory].name;
        matchesCategory = p.name.contains(catName) || p.type.contains(catName);
      }
      
      bool matchesSearch = p.name.toLowerCase().contains(searchQuery.toLowerCase()) || 
                           p.type.toLowerCase().contains(searchQuery.toLowerCase());
      
      return matchesCategory && matchesSearch;
    }).toList();

    return Scaffold(
      backgroundColor: Color(0xffF9F9F9),
      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(20),
              blurRadius: 20,
              offset: Offset(0, -5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(MyAppIcons.home, 0),
            _buildNavItem(MyAppIcons.heart, 1),
            _buildNavItem(MyAppIcons.bag, 2),
            _buildNavItem(MyAppIcons.notification, 3),
          ],
        ),
      ),
      body: selectedIndex == 0
          ? _buildHomeBody(filteredProducts)
          : selectedIndex == 1
              ? FavoritesView()
              : selectedIndex == 2
                  ? CartView()
                  : ProfileView(),
    );
  }

  Widget _buildHomeBody(List<ProductModel> products) {
    return Stack(
      children: [
        HomeBackGround(),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                LocationWidget(),
                const SizedBox(height: 24),
                MySearchWidget(
                  onChanged: (val) {
                    setState(() {
                      searchQuery = val;
                    });
                  },
                ),
                const SizedBox(height: 24),
                MyHomeBanner(),
                const SizedBox(height: 24),
                SizedBox(
                  height: 35,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(width: 16),
                    scrollDirection: Axis.horizontal,
                    itemCount: homeDataSource.categories.length,
                    itemBuilder: (context, index) {
                      final category = homeDataSource.categories[index];
                      return MyCategoryButton(
                        isSelected: category.id == selectedCategory,
                        onTap: () {
                          selectedCategory = category.id;
                          setState(() {});
                        },
                        category: category,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: GridView.builder(
                    itemCount: products.length,
                    padding: EdgeInsets.only(bottom: 24),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                    ),
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return MyProductItem(products: product);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNavItem(String icon, int index) {
    bool isSelected = selectedIndex == index;
    return InkWell(
      onTap: () => setState(() => selectedIndex = index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            icon,
            height: 24,
            width: 24,
            color: isSelected ? MyAppColor.primaryColor : Colors.grey,
          ),
          if (isSelected) ...[
            SizedBox(height: 4),
            Container(
              height: 4,
              width: 10,
              decoration: BoxDecoration(
                color: MyAppColor.primaryColor,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
