
import 'package:flutter/material.dart';


class BannerWidget extends StatelessWidget {
  const BannerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 140,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.yellow.shade900,
          borderRadius: BorderRadius.circular(10),
        ),
        child: PageView(
          children: [
            Center(child: Text('Banner 1')),
            Center(child: Text('Banner 2')),
            Center(child: Text('Banner 3')),
          ],
        ),
      ),
    );
  }
}