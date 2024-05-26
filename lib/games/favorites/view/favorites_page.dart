import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_price_checker/games/favorites/bloc/favorites_bloc.dart';
import 'package:game_price_checker/games/favorites/view/sort_buttons.dart';
import 'package:game_price_checker/games/search/widgets/game_list.dart';
import 'package:game_price_checker/home/cubit/home_cubit.dart';
import 'package:game_price_checker/l10n/l10n.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    context
        .read<FavoritesBloc>()
        .add(const LoadFavorites(PriceOrder.ascending));
    return const FavouritesView();
  }
}

class FavouritesView extends StatelessWidget {
  const FavouritesView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SafeArea(
      child: ColoredBox(
        color: Theme.of(context).colorScheme.surface,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                l10n.favorites,
                style: TextStyle(
                  fontSize: 40,
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SortButtons(),
            const SizedBox(height: 20),
            BlocBuilder<FavoritesBloc, FavoritesState>(
              builder: (context, state) {
                if (state is FavoritesLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is FavoritesLoaded) {
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: GameList(games: state.favorites),
                    ),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: Text(
                      l10n.noFavorites,
                      style: const TextStyle(fontSize: 30, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  );
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: MaterialButton(
                minWidth: MediaQuery.of(context).size.width * 0.4,
                color: Colors.tealAccent,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                onPressed: () {
                  context.read<HomeCubit>().setTab(HomeTab.search);
                },
                child: Text(
                  l10n.backToSearch,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
