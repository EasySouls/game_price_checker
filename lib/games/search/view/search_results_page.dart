import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_price_checker/games/search/bloc/games_search_bloc.dart';
import 'package:game_price_checker/games/search/widgets/game_list.dart';
import 'package:game_price_checker/home/cubit/home_cubit.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search results'),
      ),
      body: BlocConsumer<GamesSearchBloc, GamesSearchState>(
        listener: (context, state) {
          if (state is GamesSearchLoadFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(
                  content: Text('Failed to load games'),
                ),
              );
          }
          if (state is GamesSearchLoadSuccess && state.games.isEmpty) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(
                  content: Text('No games found'),
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
                const Text('Results for query'),
                Expanded(
                  child: _searchResults(games: state.games),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      textStyle: const TextStyle(
                        color: Colors.black38,
                      ),
                    ),
                    onPressed: () {
                      context.read<HomeCubit>().setTab(HomeTab.favourites);
                    },
                    child: const Text('See Favorites'),
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
