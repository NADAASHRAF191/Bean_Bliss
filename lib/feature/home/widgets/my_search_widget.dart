import 'package:coffee_shop/core/constant/image_constant.dart';
import 'package:coffee_shop/core/shared/my_text_field.dart';
import 'package:coffee_shop/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class MySearchWidget extends StatelessWidget {
  final Function(String)? onChanged;
  const MySearchWidget({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: MySearchTextField(
            onChanged: onChanged,
          ),
        ),
        const SizedBox(width: 12),
        Container(
          height: 52,
          width: 52,
          decoration: BoxDecoration(
            color: MyAppColor.primaryColor,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.all(12),
          child: Image.asset(MyAppIcons.filter, color: Colors.white),
        ),
      ],
    );
  }
}
