import 'package:flutter/widgets.dart';

class HomeBackGround extends StatelessWidget {
  const HomeBackGround({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 280,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xff131313),
                  Color(0xff313131),
                ],
              ),
            ),
          ),
          Expanded(child: Container(color: Color(0xffF9F9F9))),
        ],
      ),
    );
  }
}
