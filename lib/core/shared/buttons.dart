import 'package:coffee_shop/core/models/category_model.dart';
import 'package:coffee_shop/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class MyGenralButton extends StatelessWidget {
  final String name;
  final Function()? onPressed;
  const MyGenralButton({
    required this.name,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 56,
      color: MyAppColor.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      onPressed: onPressed,
      child: Text(
        name,
        style: MyTextStyle.normalTitleText(color: Colors.white),
      ),
    );
  }
}

class MyIconButton extends StatelessWidget {
  final String icon;
  final Function() onTap;
  const MyIconButton({required this.icon, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 52,
        width: 52,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: MyAppColor.primaryColor,
        ),
        child: Image.asset(icon, color: Colors.white, height: 20, width: 20),
      ),
    );
  }
}


class MyCategoryButton extends StatelessWidget {
  final bool isSelected;
  final Function() onTap;
  const MyCategoryButton({
    required this.isSelected,
    required this.onTap,
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isSelected ? MyAppColor.primaryColor : Colors.white,
          border: isSelected
              ? null
              : Border.all(color: Color(0xffEDEDED), width: 1),
        ),
        child: Text(
          category.name,
          style: MyTextStyle.normalTitleText(
            color: isSelected ? Colors.white : Color(0xff2F2D2C),
            size: 14,
          ),
        ),
      ),
    );
  }
}
