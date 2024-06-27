import 'package:flutter/material.dart';
import '../constrants/colors.dart';

class searchBox extends StatelessWidget {
  const searchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: tdLBlue,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: tdBlack,
            size: 24,
          ),
          prefixIconConstraints: BoxConstraints(
              maxHeight: 20,
              maxWidth: 25
          ),
          border: InputBorder.none,
          hintText: 'Search',
        ),
      ),
    );
  }
}