import 'package:coffee_shop/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F9F9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Profile", style: MyTextStyle.normalTitleText(size: 18)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: MyAppColor.primaryColor.withAlpha(30),
              child: Icon(Icons.person, size: 50, color: MyAppColor.primaryColor),
            ),
            SizedBox(height: 16),
            Text("Coffee Lover", style: MyTextStyle.normalTitleText(size: 20)),
            Text("coffee.lover@example.com", style: MyTextStyle.subTitleText()),
            SizedBox(height: 32),
            _profileItem(Icons.history, "Order History"),
            _profileItem(Icons.payment, "Payment Methods"),
            _profileItem(Icons.location_on, "Shipping Address"),
            _profileItem(Icons.settings, "Settings"),
            _profileItem(Icons.help, "Help Center"),
            SizedBox(height: 32),
            _profileItem(Icons.logout, "Logout", color: Colors.red),
          ],
        ),
      ),
    );
  }

  Widget _profileItem(IconData icon, String title, {Color? color}) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(icon, color: color ?? Colors.black),
          SizedBox(width: 16),
          Text(title, style: MyTextStyle.normalTitleText(size: 16, color: color)),
          Spacer(),
          Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        ],
      ),
    );
  }
}
