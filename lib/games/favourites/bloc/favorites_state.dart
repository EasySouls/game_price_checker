part of 'favorites_bloc.dart';

final class FavoritesState extends Equatable {
  const FavoritesState(this.favorites);

  final List<Game> favorites;

  @override
  List<Object> get props => [favorites];
}
