import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:games_repository/games_repository.dart';

class GameTile extends StatelessWidget {
  const GameTile({
    required this.game,
    required this.onToggleFavorite,
    required this.isFavorite,
    super.key,
  });

  final Game game;
  final VoidCallback onToggleFavorite;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    final isLoggedIn =
        context.read<AuthenticationRepository>().currentUser.isNotEmpty;

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
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                '\$${game.cheapest}',
                style: const TextStyle(color: Colors.white70),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              border: isFavorite
                  ? null
                  : Border.all(
                      color: Colors.white,
                    ),
              color: isFavorite ? Colors.tealAccent : Colors.grey[800],
              shape: BoxShape.circle,
            ),
            child: IconButton(
              color: isFavorite ? Colors.tealAccent : Colors.white,
              onPressed: isLoggedIn
                  ? onToggleFavorite
                  : () {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                          const SnackBar(
                            content: Text('Log in to favorite games'),
                          ),
                        );
                    },
              icon: Icon(
                isFavorite ? Icons.star : Icons.star_border_outlined,
                color: isFavorite ? Colors.grey[800] : Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
