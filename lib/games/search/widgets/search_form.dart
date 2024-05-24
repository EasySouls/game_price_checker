import 'package:flutter/material.dart';

class SearchForm extends StatelessWidget {
  const SearchForm({
    required this.onSearch,
    required this.controller,
    super.key,
  });

  final void Function(BuildContext, String) onSearch;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        hintText: 'Search for a game title',
        border: OutlineInputBorder(),
      ),
      controller: controller,
      onSubmitted: (value) => onSearch(context, controller.text),
    );
  }
}
