import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: const Color.fromARGB(255, 194, 31, 20),
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top, left: 25, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Howdy , What Are You\n Looking For 👀',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            child: SvgPicture.asset(
              'assets/icons/cart.svg',
              width: 20,
            ),
          )
        ],
      ),
    );
  }
}
