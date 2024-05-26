import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:games_repository/games_repository.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc({
    required this.gamesRepository,
    required this.authenticationRepository,
  }) : super(FavoritesInitial()) {
    on<LoadFavorites>(_onLoadFavorites);
    on<AddFavorite>(_onAddFavorite);
    on<RemoveFavorite>(_onRemoveFavorite);
  }

  final GamesRepository gamesRepository;
  final AuthenticationRepository authenticationRepository;

  Future<void> _onLoadFavorites(
    LoadFavorites event,
    Emitter<FavoritesState> emit,
  ) async {
    emit(FavoritesLoading());
    try {
      final userId = authenticationRepository.currentUser.id;
      if (userId.isEmpty) {
        emit(const FavoritesError(message: 'Log in to favorite games'));
        return;
      }

      final favorites = await gamesRepository.getFavorites(userId);
      if (event.priceOrder == PriceOrder.ascending) {
        favorites.sort((a, b) => a.cheapest.compareTo(b.cheapest));
      } else {
        favorites.sort((a, b) => b.cheapest.compareTo(a.cheapest));
      }
      emit(FavoritesLoaded(favorites: favorites, priceOrder: event.priceOrder));
    } catch (e) {
      emit(FavoritesError(message: e.toString()));
    }
  }

  Future<void> _onAddFavorite(
    AddFavorite event,
    Emitter<FavoritesState> emit,
  ) async {
    emit(FavoritesLoading());
    try {
      final userId = authenticationRepository.currentUser.id;
      if (userId.isEmpty) {
        emit(const FavoritesError(message: 'User not authenticated'));
        return;
      }

      await gamesRepository.addFavorite(userId, event.game);
      final favorites = await gamesRepository.getFavorites(userId);
      emit(
        FavoritesLoaded(
          favorites: favorites,
          priceOrder: PriceOrder.ascending,
        ),
      );
    } catch (e) {
      emit(FavoritesError(message: e.toString()));
    }
  }

  Future<void> _onRemoveFavorite(
    RemoveFavorite event,
    Emitter<FavoritesState> emit,
  ) async {
    emit(FavoritesLoading());
    try {
      final userId = authenticationRepository.currentUser.id;
      if (userId.isEmpty) {
        emit(const FavoritesError(message: 'User not authenticated'));
        return;
      }

      await gamesRepository.removeFavorite(userId, event.game);
      final favorites = await gamesRepository.getFavorites(userId);
      emit(
        FavoritesLoaded(
          favorites: favorites,
          priceOrder: PriceOrder.ascending,
        ),
      );
    } catch (e) {
      emit(FavoritesError(message: e.toString()));
    }
  }
}
