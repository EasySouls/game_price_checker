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

enum PriceOrder { ascending, descending }

class LoadFavorites extends FavoritesEvent {
  const LoadFavorites(this.priceOrder);

  final PriceOrder priceOrder;

  @override
  List<Object> get props => [priceOrder];
}
