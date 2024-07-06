import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchInputWidget extends StatelessWidget {
  const SearchInputWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: TextField(
          decoration: InputDecoration(
              fillColor: Color.fromARGB(255, 231, 231, 231),
              filled: true,
              hintText: 'Search',
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(14.0),
                child: SvgPicture.asset(
                  'assets/icons/search.svg',
                  width: 10,
                ),
              )),
        ),
      ),
    );
  }
}
