import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_price_checker/l10n/l10n.dart';
import 'package:game_price_checker/search/bloc/games_search_bloc.dart';
import 'package:game_price_checker/search/widgets/widgets.dart';
import 'package:games_repository/games_repository.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GamesSearchBloc(
        gamesRepository: context.read<GamesRepository>(),
      ),
      child: const SearchView(),
    );
  }
}

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.searchPageTitle),
      ),
      body: BlocBuilder(
        bloc: context.read<GamesSearchBloc>(),
        builder: (context, state) {
          if (state is GamesSearchInitialState) {
            return Container(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: Column(
                  children: [
                    const Text('Search for a game title'),
                    const SizedBox(height: 8),
                    SearchForm(
                      onSearch: (query) {
                        context
                            .read<GamesSearchBloc>()
                            .add(GameSearchQuerySubmitted(query));
                      },
                    ),
                  ],
                ),
              ),
            );
          }
          if (state is GamesSearchLoadInProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is GamesSearchLoadSuccess) {
            return Column(
              children: [
                const Text('Search results'),
                GameList(games: state.games)
              ],
            );
          }

          if (state is GamesSearchLoadFailure) {
            return Center(
              child: Text(l10n.gamesSearchError),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
