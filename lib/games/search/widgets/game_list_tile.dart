import 'package:flutter/material.dart';
import 'package:games_repository/games_repository.dart';

class GameListTile extends StatelessWidget {
  const GameListTile({
    required this.game,
    required this.onToggleFavorite,
    super.key,
  });

  final Game game;
  final VoidCallback onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      textColor: Colors.red,
      title: Text(game.name),
      subtitle: Text(game.cheapest),
      trailing: IconButton(
        icon: const Icon(Icons.star_border),
        onPressed: onToggleFavorite,
      ),
    );
  }
}
