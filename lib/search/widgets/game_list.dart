import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:game_price_checker/search/widgets/game_list_tile.dart';
import 'package:games_repository/games_repository.dart';

class GameList extends StatelessWidget {
  const GameList({
    required this.games,
    super.key,
  });

  final List<Game> games;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
        child: ListView.builder(
      itemCount: games.length,
      itemBuilder: (context, index) {
        final game = games[index];
        return GameListTile(
          game: game,
          onToggleFavorite: () {
            // if (game.isFavorite) {
            //   context.read<GamesBloc>().add(GamesRemovedFromFavorites(game));
            // } else {
            //   context.read<GamesBloc>().add(GamesAddedToFavorites(game));
            // }
            if (kDebugMode) {
              print('Toggling favorite for game: ${game.name}');
            }
          },
        );
      },
    ));
  }
}
