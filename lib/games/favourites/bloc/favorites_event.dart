part of 'favorites_bloc.dart';

abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object> get props => [];
}

class AddFavorite extends FavoritesEvent {
  const AddFavorite({required this.game});

  final Game game;

  @override
  List<Object> get props => [game];
}

class RemoveFavorite extends FavoritesEvent {
  const RemoveFavorite({required this.game});

  final Game game;

  @override
  List<Object> get props => [game];
}

class LoadFavorites extends FavoritesEvent {}
