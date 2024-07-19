import 'package:flutter/material.dart';

class AttributesTabScreen extends StatelessWidget {
  const AttributesTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Brand',
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              child: Container(
                width: 100,
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Size',
                  ),
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                overlayColor: Color.fromARGB(255, 152, 1, 1),
              ),
              onPressed: () {},
              child: Text(
                'Add',
              ),
            ),
          ],
        )
      ],
    );
  }
}
