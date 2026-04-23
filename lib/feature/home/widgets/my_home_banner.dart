import 'package:coffee_shop/core/constant/image_constant.dart';
import 'package:flutter/material.dart';

class MyHomeBanner extends StatelessWidget {
  const MyHomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(height: 140, child: Image.asset(MyAppImage.banner));
  }
}
