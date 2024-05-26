part of 'favorites_bloc.dart';

abstract class FavoritesState extends Equatable {
  const FavoritesState();

  @override
  List<Object> get props => [];
}

class FavoritesInitial extends FavoritesState {}

class FavoritesLoading extends FavoritesState {}

class FavoritesLoaded extends FavoritesState {
  const FavoritesLoaded({
    required this.priceOrder,
    required this.favorites,
  });

  final List<Game> favorites;
  final PriceOrder priceOrder;

  @override
  List<Object> get props => [favorites];
}

class FavoritesError extends FavoritesState {
  const FavoritesError({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
