part of 'games_search_bloc.dart';

sealed class GamesSearchState extends Equatable {
  const GamesSearchState();

  @override
  List<Object> get props => [];
}

final class GamesSearchInitialState extends GamesSearchState {
  const GamesSearchInitialState();
}

final class GamesSearchLoadInProgress extends GamesSearchState {
  const GamesSearchLoadInProgress();
}

final class GamesSearchLoadSuccess extends GamesSearchState {
  const GamesSearchLoadSuccess({
    required this.query,
    required this.games,
  });

  final List<Game> games;
  final String query;

  @override
  List<Object> get props => [games];
}

final class GamesSearchLoadFailure extends GamesSearchState {
  const GamesSearchLoadFailure();
}
