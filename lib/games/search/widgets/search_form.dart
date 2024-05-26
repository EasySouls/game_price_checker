import 'package:flutter/material.dart';
import 'package:game_price_checker/l10n/l10n.dart';

class SearchForm extends StatelessWidget {
  const SearchForm({
    required this.onSearch,
    required this.controller,
    super.key,
  });

  final void Function(BuildContext, String) onSearch;
  final SearchController controller;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return SearchBar(
      hintText: l10n.searchHint,
      controller: controller,
      onSubmitted: (value) => onSearch(context, controller.text),
    );
  }
}
