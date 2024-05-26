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
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              l10n.favorites,
              style: const TextStyle(
                fontSize: 40,
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
                return Center(
                  child: Text(
                    l10n.noFavorites,
                    style: const TextStyle(fontSize: 30),
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
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
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
    );
  }
}
