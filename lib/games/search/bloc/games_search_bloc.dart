import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:games_repository/games_repository.dart';

part 'games_search_event.dart';
part 'games_search_state.dart';

class GamesSearchBloc extends Bloc<GamesSearchEvent, GamesSearchState> {
  GamesSearchBloc({
    required this.gamesRepository,
  }) : super(const GamesSearchInitialState()) {
    on<GameSearchQuerySubmitted>(_onSearchQuerySubmitted);
    on<GameSearchQueryCleared>(_onSearchQueryCleared);
  }

  final GamesRepository gamesRepository;

  Future<void> _onSearchQuerySubmitted(
    GameSearchQuerySubmitted event,
    Emitter<GamesSearchState> emit,
  ) async {
    emit(const GamesSearchLoadInProgress());

    try {
      final games = await gamesRepository.getGames(title: event.query);
      emit(GamesSearchLoadSuccess(games: games));
    } catch (e) {
      emit(const GamesSearchLoadFailure());
    }
  }

  void _onSearchQueryCleared(
    GameSearchQueryCleared event,
    Emitter<GamesSearchState> emit,
  ) {
    emit(const GamesSearchInitialState());
  }
}
