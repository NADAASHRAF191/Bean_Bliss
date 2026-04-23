import 'package:coffee_shop/core/constant/image_constant.dart';
import 'package:coffee_shop/core/theme/app_theme.dart';
import 'package:coffee_shop/feature/home/views/home_view.dart';
import 'package:flutter/material.dart';

class WelcomeViewPage extends StatelessWidget {
  const WelcomeViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              MyAppImage.welcome,
              fit: BoxFit.cover,
            ),
          ),
          // Gradient Overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withAlpha(200),
                    Colors.black,
                  ],
                  stops: [0.4, 0.7, 0.9],
                ),
              ),
            ),
          ),
          // Content
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 48),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Coffee so good, your taste buds will love it.",
                    textAlign: TextAlign.center,
                    style: MyTextStyle.normalTitleText(
                      color: Colors.white,
                      size: 34,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "The best grain, the finest roast, the powerful flavor.",
                    textAlign: TextAlign.center,
                    style: MyTextStyle.subTitleText(
                      color: Color(0xffA9A9A9),
                      size: 14,
                    ),
                  ),
                  SizedBox(height: 32),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomeView()),
                      );
                    },
                    child: Container(
                      height: 62,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: MyAppColor.primaryColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Get Started",
                        style: MyTextStyle.normalTitleText(
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
