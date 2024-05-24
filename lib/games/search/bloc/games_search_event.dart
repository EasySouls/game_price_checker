part of 'games_search_bloc.dart';

sealed class GamesSearchEvent extends Equatable {
  const GamesSearchEvent();

  @override
  List<Object> get props => [];
}

final class GameSearchQuerySubmitted extends GamesSearchEvent {
  const GameSearchQuerySubmitted(this.query);

  final String query;

  @override
  List<Object> get props => [query];
}

final class GameSearchQueryCleared extends GamesSearchEvent {
  const GameSearchQueryCleared();
}
