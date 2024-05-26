import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_price_checker/games/favourites/bloc/favorites_bloc.dart';
import 'package:game_price_checker/games/search/widgets/game_tile.dart';
import 'package:games_repository/games_repository.dart';

class GameList extends StatelessWidget {
  const GameList({
    required this.games,
    super.key,
  });

  final List<Game> games;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: games.length,
      itemBuilder: (context, index) {
        final game = games[index];
        return BlocBuilder<FavoritesBloc, FavoritesState>(
          builder: (context, state) {
            final isFavorite = state is FavoritesLoaded &&
                state.favorites.any((fav) => fav.gameID == game.gameID);
            return Container(
              margin: const EdgeInsets.only(bottom: 8),
              height: 50,
              color: Colors.red,
              child: GameTile(
                game: game,
                onToggleFavorite: () {
                  if (isFavorite) {
                    context.read<FavoritesBloc>().add(
                          RemoveFavorite(game: game),
                        );
                  } else {
                    context.read<FavoritesBloc>().add(AddFavorite(game: game));
                  }
                  if (kDebugMode) {
                    print('Toggling favorite for game: ${game.name}');
                  }
                },
              ),
            );
          },
        );
      },
    );
  }
}
