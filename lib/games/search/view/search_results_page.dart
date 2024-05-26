import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_price_checker/games/search/bloc/games_search_bloc.dart';
import 'package:game_price_checker/games/search/widgets/game_list.dart';
import 'package:game_price_checker/home/cubit/home_cubit.dart';
import 'package:game_price_checker/l10n/l10n.dart';
import 'package:games_repository/games_repository.dart';

class SearchResultsPage extends StatelessWidget {
  const SearchResultsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SearchResultsView();
  }
}

class SearchResultsView extends StatelessWidget {
  const SearchResultsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      body: BlocConsumer<GamesSearchBloc, GamesSearchState>(
        listener: (context, state) {
          if (state is GamesSearchLoadFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(l10n.gamesSearchError),
                ),
              );
          }
          if (state is GamesSearchLoadSuccess && state.games.isEmpty) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(l10n.gamesSearchNoResults),
                ),
              );
          }
        },
        builder: (context, state) {
          if (state is GamesSearchLoadFailure) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is GamesSearchLoadSuccess) {
            return Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Text(
                  l10n.searchResultsTitle,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 42,
                  ),
                ),
                Text(
                  state.query,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.tealAccent,
                    fontSize: 42,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: _searchResults(games: state.games),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: MaterialButton(
                    minWidth: MediaQuery.of(context).size.width * 0.4,
                    color: Colors.tealAccent,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 20,
                    ),
                    onPressed: () {
                      context.read<HomeCubit>().setTab(HomeTab.favourites);
                    },
                    child: Text(
                      l10n.seeFavorites,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _searchResults({required List<Game> games}) {
    return GameList(games: games);
  }
}
