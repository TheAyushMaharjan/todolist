import 'package:flutter/material.dart';
import '../constrants/colors.dart';

class SearchBox extends StatelessWidget {
  final Function(String) onSearch;

  const SearchBox({super.key, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: tdLBlue,
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextField(
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: tdBlack,
            size: 24,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            maxWidth: 25,
          ),
          border: InputBorder.none,
          hintText: 'Search',
        ),
        onChanged: onSearch,  // Call the passed callback here
      ),
    );
  }
}
