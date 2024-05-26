import 'package:firestore_favorites_api/firestore_favorites_api.dart';
import 'package:games_api/game_prices_api.dart';

/// {@template games_repository}
/// A repository that handles the games and the related actions
/// {@endtemplate}
class GamesRepository {
  /// {@macro games_repository}
  const GamesRepository({
    required GamePricesApi gamePricesApi,
    required FirestoreFavoritesApi firestoreFavoritesApi,
  })  : _gamePricesApi = gamePricesApi,
        _firestoreFavoritesApi = firestoreFavoritesApi;

  final GamePricesApi _gamePricesApi;
  final FirestoreFavoritesApi _firestoreFavoritesApi;

  /// Fetches a [List] of [Game]s by the given [title].
  Future<List<Game>> getGames({required String title}) async {
    final games = await _gamePricesApi.getGamesByTitle(title);
    return games;
  }

  /// Fetches a [List] of favorited [Game]s by the given [userId].
  Future<List<Game>> getFavorites(String userId) async {
    final favorites = await _firestoreFavoritesApi.getFavorites(userId);
    final List<Game> games = [];
    for (final favorite in favorites) {
      final game = await _gamePricesApi.getGameById(favorite);
      games.add(game);
    }
    return games;
  }

  /// Adds a [Game] to the favorites of the given [userId].
  Future<void> addFavorite(String userId, Game game) async {
    await _firestoreFavoritesApi.saveFavorite(userId, game.gameID);
  }

  /// Removes a [Game] from the favorites of the given [userId].
  /// If the [Game] is not in the favorites, nothing happens.
  Future<void> removeFavorite(String userId, Game game) async {
    await _firestoreFavoritesApi.removeFavorite(userId, game.gameID);
  }
}
