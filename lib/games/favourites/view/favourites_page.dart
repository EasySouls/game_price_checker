import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_price_checker/games/favourites/bloc/favorites_bloc.dart';
import 'package:games_repository/games_repository.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FavoritesBloc(
        gamesRepository: context.read<GamesRepository>(),
        authenticationRepository: context.read<AuthenticationRepository>(),
      )..add(LoadFavorites()),
      child: const FavouritesView(),
    );
  }
}

class FavouritesView extends StatelessWidget {
  const FavouritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Games'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'Ascending') {
                context
                    .read<FavoritesBloc>()
                    .add(LoadFavorites()); // Modify this to sort by ascending
              } else {
                context
                    .read<FavoritesBloc>()
                    .add(LoadFavorites()); // Modify this to sort by descending
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'Ascending',
                child: Text('Price: Low to High'),
              ),
              const PopupMenuItem(
                value: 'Descending',
                child: Text('Price: High to Low'),
              ),
            ],
          ),
        ],
      ),
      body: BlocBuilder<FavoritesBloc, FavoritesState>(
        builder: (context, state) {
          if (state is FavoritesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is FavoritesLoaded) {
            return ListView.builder(
              itemCount: state.favorites.length,
              itemBuilder: (context, index) {
                final game = state.favorites[index];
                return ListTile(
                  title: Text(game.name),
                  subtitle: Text('\$${game.cheapest}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.star, color: Colors.yellow),
                    onPressed: () {
                      context
                          .read<FavoritesBloc>()
                          .add(RemoveFavorite(game: game));
                    },
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text('No favorite games.'));
          }
        },
      ),
    );
  }
}
