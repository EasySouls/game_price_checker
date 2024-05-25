import 'package:flutter/material.dart';
import 'package:games_repository/games_repository.dart';

class GameTile extends StatelessWidget {
  const GameTile({
    required this.game,
    required this.onToggleFavorite,
    super.key,
  });

  final Game game;
  final VoidCallback onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                game.name,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
              Text(
                '\$${game.cheapest}',
                style: const TextStyle(color: Colors.white70),
              ),
            ],
          ),
          IconButton(
            onPressed: onToggleFavorite,
            icon: const Icon(
              // game.isFavorite ? Icons.star : Icons.star_border,
              Icons.star,
              color: Colors.teal,
            ),
          ),
        ],
      ),
    );
  }
}
