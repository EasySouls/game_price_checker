import 'package:flutter/material.dart';

class SearchForm extends StatefulWidget {
  const SearchForm({required this.onSearch, super.key});

  final void Function(String) onSearch;

  @override
  State<SearchForm> createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  late final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        hintText: 'Search for a game title',
        border: OutlineInputBorder(),
      ),
      controller: _controller,
      onSubmitted: widget.onSearch,
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
