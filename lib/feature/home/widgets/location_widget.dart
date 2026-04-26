import 'package:coffee_shop/core/constant/image_constant.dart';
import 'package:coffee_shop/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Location",
          style: MyTextStyle.subTitleText(color: Color(0xffB7B7B7), size: 12),
        ),
        const SizedBox(height: 3),
        Row(
          children: [
            Text(
              "Bilzen, Tanjungbalai",
              style: MyTextStyle.smallTitleText(color: Colors.white, size: 14),
            ),
            const SizedBox(width: 4),
            Image.asset(MyAppIcons.arrowDown, height: 14, width: 14, color: Colors.white),
          ],
        ),
      ],
    );
  }
}
