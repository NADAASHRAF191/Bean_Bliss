import 'package:coffee_shop/core/constant/image_constant.dart';
import 'package:coffee_shop/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MySearchTextField extends StatelessWidget {
  final Function(String)? onChanged;
  const MySearchTextField({
    super.key,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: Container(
          padding: EdgeInsets.all(16),
          child: Image.asset(
            MyAppIcons.search,
            height: 24,
            width: 24,
            color: MyAppColor.subTitleText,
          ),
        ),
        hintText: "Search coffee",
        hintStyle: MyTextStyle.subTitleText(size: 16),
        fillColor: Color(0xff2A2A2A),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.transparent),
        ),
      ),
    );
  }
}
