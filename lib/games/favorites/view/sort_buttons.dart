import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_price_checker/games/favorites/bloc/favorites_bloc.dart';
import 'package:game_price_checker/l10n/l10n.dart';

class SortButtons extends StatefulWidget {
  const SortButtons({super.key});

  @override
  State<SortButtons> createState() => _SortButtonsState();
}

class _SortButtonsState extends State<SortButtons> {
  int selectedIndex = 0;

  void _onSortChanged(int index) {
    setState(() {
      selectedIndex = index;
    });

    if (index == 0) {
      context
          .read<FavoritesBloc>()
          .add(const LoadFavorites(PriceOrder.ascending));
    } else {
      context
          .read<FavoritesBloc>()
          .add(const LoadFavorites(PriceOrder.descending));
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return ToggleButtons(
      isSelected: [selectedIndex == 0, selectedIndex == 1],
      borderRadius: BorderRadius.circular(8),
      fillColor: Theme.of(context).colorScheme.primary,
      selectedColor: Colors.black,
      color: Colors.white,
      onPressed: _onSortChanged,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(l10n.lowToHigh),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(l10n.highToLow),
        ),
      ],
    );
  }
}
