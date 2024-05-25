import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
        return Container(
          margin: const EdgeInsets.only(bottom: 8),
          height: 50,
          color: Colors.red,
          child: GameTile(
            game: game,
            onToggleFavorite: () {
              // if (game.isFavorite) {
              //   context.read<GamesBloc>().add(
              //    GamesRemovedFromFavorites(game),
              //   );
              // } else {
              //   context.read<GamesBloc>().add(GamesAddedToFavorites(game));
              // }
              if (kDebugMode) {
                print('Toggling favorite for game: ${game.name}');
              }
            },
          ),
        );
      },
    );
  }
}
